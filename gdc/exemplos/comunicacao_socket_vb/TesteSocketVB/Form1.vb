Imports System.Net
Imports System.Net.Sockets
Imports System.Text
Imports System.Windows.Forms.VisualStyles.VisualStyleElement
Public Class Form1
    Dim client As TcpClient
    Dim stream As NetworkStream
    Private Sub btnConect_Click(sender As Object, e As EventArgs) Handles btnConect.Click
        Dim ip As String = txtIp.Text
        Dim port As Int32 = Convert.ToString(txtPort.Text)
        client = New TcpClient(ip, port)
        stream = client.GetStream()
        ckConected.Checked = True
    End Sub

    Private Sub btnDisconect_Click(sender As Object, e As EventArgs) Handles btnDisconect.Click
        client.Close()
        stream.Close()
        ckConected.Checked = False
    End Sub

    Private Sub btnSend_Click(sender As Object, e As EventArgs) Handles btnSend.Click
        Dim command As String = txtCommand.Text
        Dim data As [Byte]() = Encoding.ASCII.GetBytes(txtCommand.Text)
        stream.Write(data, 0, data.Length)

        Dim teste(126) As Byte
        Dim bytes As Int32 = stream.Read(teste, 0, teste.Length)
        Dim responseData As String = Encoding.ASCII.GetString(teste, 0, bytes)
        txtAnswer.Text = responseData
    End Sub

    Function checksumMod256(ByVal data() As Byte) As Byte
        Dim sum As Integer = 0
        For Each b As Byte In data
            sum += b
        Next
        Return sum Mod 256
    End Function

    Function mountCommandSavePassword(ByVal password As String, ByVal minutes As Byte, ByVal seconds As Byte, ByVal showerNumber As Byte, ByVal timesOfActivation As Byte) As Byte()
        Dim initialCommand As Byte() = {&H53, &HF, &HEE, &H0, &H0}

        If password.Length <> 6 OrElse Not password.All(AddressOf Char.IsDigit) Then
            MessageBox.Show("A senha deve ter exatamente 6 números.", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Return Nothing
        End If

        Dim passwordBytes As Byte() = password.Select(Function(c) Convert.ToByte(c.ToString(), 16)).ToArray()

        Dim userData As Byte() = {&HDE, &HDE, minutes, seconds, showerNumber, timesOfActivation, &HF, &H26}

        Dim command As Byte() = initialCommand.Concat(passwordBytes).Concat(userData).ToArray()

        Dim checksum As Byte = checksumMod256(command)

        Dim checksumStr As String = checksum.ToString("X2")
        Dim checksumBytes As Byte() = Encoding.ASCII.GetBytes(checksumStr)

        ' Adicionar delimitadores { (0x7B) no início e } (0x7D) no final
        Dim finalCommand As Byte() = {CByte(&H7B)}.Concat(command).Concat(checksumBytes).Concat({CByte(&H7D)}).ToArray()

        tb_command_to_send.Text = BitConverter.ToString(finalCommand).Replace("-", " ")

        Return finalCommand
    End Function

    Private Sub btn_send_command_save_password_Click(sender As Object, e As EventArgs) Handles btn_send_command_save_password.Click
        Dim password As String = tb_password.Text
        Dim minutes As Byte = Convert.ToByte(tb_duration_minutes.Text)
        Dim seconds As Byte = Convert.ToByte(tb_duration_seconds.Text)
        Dim showerNumber As Byte = Convert.ToByte(tb_shower.Text)
        Dim timesOfActivation As Byte = Convert.ToByte(tb_times_of_activation.Text)

        Dim command As Byte() = mountCommandSavePassword(password, minutes, seconds, showerNumber, timesOfActivation)

        stream.Write(command, 0, command.Length)

        ' Receber resposta
        Dim buffer(126) As Byte
        Dim bytes As Int32 = stream.Read(buffer, 0, buffer.Length)
        Dim responseData As String = Encoding.ASCII.GetString(buffer, 0, bytes)

        ' Exibir resposta no txtAnswer
        tb_ans_command_save_password.Text = responseData
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles btn_send_command_status.Click
        ' Montar comando
        Dim command As Byte() = {&H58, &H26}
        Dim checksum As Byte = checksumMod256(command)
        Dim checksumStr As String = checksum.ToString("X2")
        Dim checksumBytes As Byte() = Encoding.ASCII.GetBytes(checksumStr)

        ' Adicionar delimitadores { e }
        Dim finalCommand As Byte() = {CByte(&H7B)}.Concat(command).Concat(checksumBytes).Concat({CByte(&H7D)}).ToArray()

        ' Mostrar comando enviado (em ASCII)
        tb_send_command_status.Text = System.Text.Encoding.ASCII.GetString(finalCommand)

        ' Enviar comando
        stream.Write(finalCommand, 0, finalCommand.Length)

        ' Preparar para receber resposta
        Dim fullResponse As New List(Of Byte)()
        Dim endFound As Boolean = False

        While Not endFound
            Dim buffer(126) As Byte
            Dim bytesRead As Int32 = stream.Read(buffer, 0, buffer.Length)

            For i As Integer = 0 To bytesRead - 1
                fullResponse.Add(buffer(i))
                If buffer(i) = &H7D Then ' } = 0x7D
                    endFound = True
                    Exit For
                End If
            Next
        End While

        ' Montar hexdump
        Dim hexDump As New StringBuilder()
        Dim lineAddress As Integer = 0

        For i As Integer = 0 To fullResponse.Count - 1 Step 16
            ' Endereço da linha
            hexDump.AppendFormat("{0:X4}: ", lineAddress)

            ' Bytes da linha
            For j As Integer = 0 To 15
                If (i + j) < fullResponse.Count Then
                    hexDump.AppendFormat("{0:X2} ", fullResponse(i + j))
                Else
                    hexDump.Append("   ") ' Se não tem byte, preencher espaço
                End If
            Next

            ' Representação ASCII da linha (opcional, fica bem bonito!)
            hexDump.Append(" |")
            For j As Integer = 0 To 15
                If (i + j) < fullResponse.Count Then
                    Dim b As Byte = fullResponse(i + j)
                    If b >= 32 AndAlso b <= 126 Then ' Se caractere imprimível
                        hexDump.Append(ChrW(b))
                    Else
                        hexDump.Append(".") ' Se não imprimível, mostra ponto
                    End If
                Else
                    hexDump.Append(" ")
                End If
            Next
            hexDump.AppendLine("|")

            ' Atualizar endereço da linha
            lineAddress += 16
        Next

        ' Mostrar hexdump formatado
        tb_ans_command_status.Text = hexDump.ToString().Trim()


        '' Aqui é um código para receber a resposta só em hexa, sem mostrar os caracteres nem quantidade
        '' Montar comando
        'Dim command As Byte() = {&H58, &H26}
        'Dim checksum As Byte = checksumMod256(command)
        'Dim checksumStr As String = checksum.ToString("X2")
        'Dim checksumBytes As Byte() = Encoding.ASCII.GetBytes(checksumStr)

        '' Adicionar delimitadores { e }
        'Dim finalCommand As Byte() = {CByte(&H7B)}.Concat(command).Concat(checksumBytes).Concat({CByte(&H7D)}).ToArray()

        '' Mostrar comando enviado (em ASCII)
        'tb_send_command_status.Text = System.Text.Encoding.ASCII.GetString(finalCommand)

        '' Enviar comando
        'stream.Write(finalCommand, 0, finalCommand.Length)

        '' Preparar para receber resposta
        'Dim fullResponse As New List(Of Byte)()
        'Dim endFound As Boolean = False

        'While Not endFound
        '    Dim buffer(126) As Byte
        '    Dim bytesRead As Int32 = stream.Read(buffer, 0, buffer.Length)

        '    For i As Integer = 0 To bytesRead - 1
        '        fullResponse.Add(buffer(i))
        '        If buffer(i) = &H7D Then ' } = 0x7D
        '            endFound = True
        '            Exit For
        '        End If
        '    Next
        'End While

        '' Converter todos os bytes recebidos para hexadecimal
        'Dim hexString As New StringBuilder()
        'For Each b As Byte In fullResponse
        '    hexString.AppendFormat("{0:X2} ", b)
        'Next

        'tb_ans_command_status.Text = hexString.ToString().Trim()



    End Sub
End Class
