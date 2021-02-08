Imports System.Net
Imports System.Net.Sockets
Imports System.Text
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
End Class
