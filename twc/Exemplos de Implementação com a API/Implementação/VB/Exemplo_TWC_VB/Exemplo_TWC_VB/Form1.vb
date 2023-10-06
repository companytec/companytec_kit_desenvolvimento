Imports System.Net.Sockets
Imports System.Net



Public Class Form1

    Public Const Versao_System = "2.0                 "
    Public Const Max_Erro = 10
    Public Const TimetoTx = 0
    Public Const TimetoRx = 100
    Public Const TimetoConnect = 100

    Public Connect As Connection
    Public Aut As Tcp
    Public Term As TWC
    Public Tout As Tick
    Public Horustech As Hrs

    Public Sub New()

        InitializeComponent()

        Connect = New Connection()
        Tout = New Tick()
        Horustech = New Hrs()
        Term = New TWC()
        Controls.Add(Connect.Grade.Grd) ' não consegui referenciar o from dentro do construtor da grade
        Me.Text = "Aplicação Exemplo para TWC in VB © Cleber Peter"
        Label1.Text = "IP"
        TextBox1.Text = "192.168.0.123"
        Button1.Text = "Conectar"
        ComboBox1.Items.Add("2001")
        ComboBox1.Items.Add("1771")
        ComboBox1.Items.Add("857")
        MaximizeBox = False
        ComboBox1.Items.Add("771")
        ComboBox1.SelectedIndex = 0
        Timer1.Interval = 1
        Timer1.Start()
        GroupBox2.Text = "Conexão"
        GroupBox1.Text = "Abastecimento Frota"
        Label2.Text = "Placa"
        Label3.Text = "Odômetro"
        Label4.Text = "CPF"
        Label5.Text = "Cartão Frentista"
        GroupBox3.Text = "Abastecimento Cliente"
        Label6.Text = "Cartão Cliente"
        Label7.Text = "Tag do Veículo"
        Label8.Text = "Senha"
        Label9.Text = "Cartão Frentista"
        Label10.Text = "Bico"
        Label11.Text = "Bico"
        Label12.Text = "Troca de Óleo"
        Label13.Text = "Valor à Abastecer"
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Connect.Task()
        Horustech.Task()
        Term.Task()
        Tout.Val += 1
    End Sub

    Private Sub Button1_Click_1(sender As Object, e As EventArgs) Handles Button1.Click
        If Button1.Text = "Conectar" Then
            Connect.Sm = Connection.Sm_States.Connect
        Else
            Connect.Sm = Connection.Sm_States.Disconnect
        End If
    End Sub

End Class

Public Class ProtTWC

    Private Sm_task, Sm_back_cmd, Sm_cmd, Erro As Integer
    Private is_asking As Boolean
    Private Menu As Integer

    Private Const Frota = 20
    Private Const Cliente = 21

    Enum Sm_States
        Tx
        Rx
    End Enum

    Enum Sm_Cmds
        Pendency
        Clean
        Read_Version
        Write_Version
        Write_Men0
        Write_Men1
        Write_MenA
        Write_MenB
        Write_Tela
        Write_Odometro
        Write_CardF
        Write_CPF
        Write_Bico
        Write_Abast
        Write_Abast_Init
        Write_óleo
        Write_Senha
        Write_Tag
        Write_Value
        Bico_Busy
        Bico_Off
        Checked
        Canceled
    End Enum

    Sub New()
        Sm_task = Sm_States.Tx
        Sm_cmd = Sm_Cmds.Read_Version
    End Sub

    Function Not_Virg(str As String) As String
        Dim count_aux As Integer
        Dim len As Integer = str.Length
        Dim acc() As Char
        ReDim acc(len)
        For count As Integer = 1 To len - 1 Step 1
            If str(count) <> ","c Then
                acc(count_aux) = str(count)
            End If
        Next
        Return acc
    End Function


    Public Sub Parser(Str As String, Len As Integer)
        Dim cmd As String = Mid(Str, 1, 2)
        Dim escape As String = Mid(Str, 10, 1)
        Dim index As String = Mid(Str, 7, 2)
        Dim Versao As String
        If cmd = "2C" Then
            If (Erro < Form1.Max_Erro) Then 'se contagem de erros não excedida
                If (escape <> "G") Then 'se fluxo não cancelado


                    'Inicia fluxo de abastecimento de frota
                    If index = "20" Or index = "2A" Then
                        Menu = Frota 'seta uso menu de frota
                        Form1.TextBox2.Text = Mid(Str, 12, 8)
                        Sm_cmd = Sm_Cmds.Write_Odometro 'pede o odometro do veículo

                        'Inicia fluxo de abastecimento de cliente
                    ElseIf index = "21" Or index = "2B" Then
                        Menu = Cliente 'seta uso menu de cliente
                        Form1.TextBox6.Text = Mid(Str, 15, 16)
                        Sm_cmd = Sm_Cmds.Write_CardF 'pede o cartão de frentista

                        'Lê Versão do Menu
                    ElseIf index = "80" Then
                        Sm_back_cmd = Sm_cmd
                        Versao = Mid(Str, 10, Len - 9)

                        If String.Compare(Versao, Form1.Versao_System) Then 'se desatualizado
                            Sm_cmd = Sm_Cmds.Write_Version 'grava a nova versão do menu
                        Else
                            Sm_cmd = Sm_Cmds.Checked 'Terminal verificado, isto é, atualizado
                        End If

                        'Lê odômetro
                    ElseIf index = "82" Then
                        Form1.TextBox3.Text = Mid(Str, 17, 8)
                        Sm_cmd = Sm_Cmds.Write_CPF 'pede o CPF

                        'Lê CPF
                    ElseIf index = "83" Then
                        Form1.TextBox4.Text = Mid(Str, 15, 14)
                        Sm_cmd = Sm_Cmds.Write_CardF 'pede o cartão do frentista

                        'Lê Cartão de Frentista
                    ElseIf index = "84" Then
                        If Menu = Frota Then
                            Form1.TextBox5.Text = Mid(Str, 15, 16)
                            Sm_cmd = Sm_Cmds.Write_óleo 'oferece troca do óleo

                        ElseIf Menu = Cliente Then
                            Form1.TextBox9.Text = Mid(Str, 15, 16)
                            Sm_cmd = Sm_Cmds.Write_Senha 'pede a senha de cliente
                        End If

                        'Lê troca de óleo
                    ElseIf index = "85" Then
                        Dim stro As String = Mid(Str, 15, 1)
                        Sm_cmd = Sm_Cmds.Write_Bico 'se digito válido pede o bico

                        If stro = "1" Then
                            Form1.TextBox12.Text = "Sim"
                        ElseIf stro = "2" Then
                            Form1.TextBox12.Text = "Não"
                        Else
                            Sm_cmd = Sm_Cmds.Write_óleo 'Digito inválido pede óleo novamente
                        End If

                        'Lê Bico
                    ElseIf index = "86" Then

                        If Menu = Frota Then
                            Form1.TextBox10.Text = Mid(Str, 13, 2)
                            Sm_cmd = Sm_Cmds.Write_Abast 'Envia Preset Identificado

                        ElseIf Menu = Cliente Then
                            Form1.TextBox11.Text = Mid(Str, 13, 2)
                            Sm_cmd = Sm_Cmds.Write_Abast
                        End If

                        'Lê Senha do cliente
                    ElseIf index = "87" Then
                        Form1.TextBox8.Text = Mid(Str, 15, 5)
                        Sm_cmd = Sm_Cmds.Write_Tag 'pede a tag do veículo


                        'Lê Tag do Veículo
                    ElseIf index = "88" Then
                        Form1.TextBox7.Text = Mid(Str, 15, 16)
                        Sm_cmd = Sm_Cmds.Write_Value 'pede o valor do preset


                        'Lê Valor do Abastecimento ($)
                    ElseIf index = "89" Then
                        Form1.TextBox13.Text = Mid(Str, 15, 7)
                        Sm_cmd = Sm_Cmds.Write_Bico 'pede o bico

                        'Bico Inválido
                    ElseIf index = "93" Or index = "94" Then
                        Sm_cmd = Sm_Cmds.Write_Bico 'pede o bico denovo

                    Else
                        Erro += 1 'Solicitou e não Recebeu
                    End If
                Else
                    Sm_cmd = Sm_Cmds.Canceled 'Fluxo Cancelado pelo usuário
                End If
            Else
                Erro = 0 'Zera contador de erros
                Sm_cmd = Sm_back_cmd 'Envia o anterior novamente
            End If

            'Verifica autorização do abastecimento
        ElseIf index = "26" Then
            Dim check As String = Mid(Str, 3, 2)
            If check = "00" Then
                Sm_cmd = Sm_Cmds.Write_Abast_Init 'bico válido
            ElseIf check(1) = "7"c Then
                Sm_cmd = Sm_Cmds.Bico_Off 'bico inválido (não configurado ou em falha)
            ElseIf check(1) = "8"c Then
                Sm_cmd = Sm_Cmds.Bico_Busy 'bico ocupado (já abastecendo ou pronto)
            End If



        ElseIf cmd = "2B" Or cmd = "2E" Then
            Dim index2 As String = Mid(Str, 3, 2)
            If index2 = "E1" Then 'Mensagem pendente no buffer do console
                Sm_cmd = Sm_Cmds.Clean 'Limpa pendência
            ElseIf index2 = "E5" Then 'Terminal com pendência não resolvida
                Sm_cmd = Sm_Cmds.Clean
            ElseIf index2 = "00" Then 'enviado ao terminal com sucesso
            End If

            Erro = 0 'Mensagem recebida zera contador de erros
        End If
    End Sub

    Public Sub Task()
        Select Case Sm_task
            Case Sm_States.Tx

                Sm_task = Sm_States.Rx 'salta para a recepção
                Dim Numberlogic As String = Form1.Horustech.Ajust(Form1.Term.NLogic.ToString, 2) 'extrair número lógico

                Select Case Sm_cmd 'seletor de comandos
                    Case Sm_Cmds.Pendency
                        Form1.Horustech.HrsPut("2C" + Numberlogic) 'solicita requisição
                    Case Sm_Cmds.Read_Version
                        Form1.Horustech.HrsPut("2B" + Numberlogic + "0E80Terminal|ML") 'pede versão do menu
                        Sm_back_cmd = Sm_cmd 'salva o estado anterior para refazer a pergunta se necessário
                        Sm_cmd = Sm_Cmds.Pendency 'salta para a solicitação de requisição
                    Case Sm_Cmds.Write_Version
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E81|MG" + Form1.Versao_System) 'grava versão de menu 
                        Sm_cmd = Sm_Cmds.Write_Men0 'salta para a gravação do 1º menu
                    Case Sm_Cmds.Write_Men0
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E20Abastecer Frota|D0030|T1Insira a Placa: |EM08SSSS-NNN") 'grava 1º menu
                        Sm_cmd = Sm_Cmds.Write_Men1 'salta para a gravação do 2º menu
                    Case Sm_Cmds.Write_Men1
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E21Abastecer Cliente|D1730|T1Aproxime o Cartão|D2450|T1 do cliente.|D2070|C|KN") 'grava 2º menu
                        Sm_cmd = Sm_Cmds.Write_MenA 'salta para a gravação da tecla caminhão
                    Case Sm_Cmds.Write_MenA
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E2AAbastecer Frota|D0030|T1Insira a Placa: |R|R|EM08SSSS-NNN") 'grava tecla caminhão
                        Sm_cmd = Sm_Cmds.Write_MenB 'salta para a gravação da tecla Bomba
                    Case Sm_Cmds.Write_MenB
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E2BAbastecer Cliente|D1730|T1Aproxime o Cartão|D2450|T1 do cliente.|D2070|C|KN") 'grava tecla bomba
                        Sm_cmd = Sm_Cmds.Write_Tela 'salta para a gravação da tela inicial
                    Case Sm_Cmds.Write_Tela
                        Form1.Horustech.HrsPut("2B" + Numberlogic + "0E2CCompanytec System|D1820|T2Companytec|D2250|T2Soluções") 'grava tela inicial
                        Sm_cmd = Sm_Cmds.Read_Version 'lê versão do menu novamente
                    Case Sm_Cmds.Canceled
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E90Terminal|D1535|T1Operação Cancelada|KN") 'exibe mensagem de cancelamento
                        Sm_cmd = Sm_Cmds.Pendency 'salta para a solicitação de requisição
                    Case Sm_Cmds.Checked
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E91Terminal|T1Sucesso!|R|R|T1Terminal Atualizado ...|KN") 'exibe mensagem de terminal verificado
                        Sm_cmd = Sm_Cmds.Pendency
                    Case Sm_Cmds.Write_Odometro
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E82Lê Odometro|D1730|T1Insira o Odometro|R|R|D2450|T1 do Veículo.|D3570|EN080") 'pede odometro
                        Sm_cmd = Sm_Cmds.Pendency
                    Case Sm_Cmds.Write_CPF
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E83Lê CPF|D2530|T1Insira o CPF|D3045|T1do Cliente|D2065|EC") 'pede o CPF
                        Sm_cmd = Sm_Cmds.Pendency
                    Case Sm_Cmds.Write_CardF
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E84Lê Cartão|D3030|T1Aproxime o|D3050|T1seu Cartão.|D2070|C|KN") 'pede o cartão do frentista
                        Sm_cmd = Sm_Cmds.Pendency
                    Case Sm_Cmds.Write_óleo
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E85Lê Óleo|D2430|T1Troca de óleo?|D2250|T1<1:Sim   2:Não>|D5070|EN010") 'verifica a troca do óleo
                        Sm_cmd = Sm_Cmds.Pendency
                    Case Sm_Cmds.Write_Bico
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E86Lê Bico|D2530|T1Insira o Bico.|D4550|EN020") 'pede o bico
                        Sm_cmd = Sm_Cmds.Pendency
                    Case Sm_Cmds.Write_Senha
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E87Lê Senha|D2530|T1Insira a Senha|D2850|T1de 5 dígitos.|D4070|EM05NNNKK") 'pede a senha
                        Sm_cmd = Sm_Cmds.Pendency
                    Case Sm_Cmds.Write_Tag
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E88Lê Tag|D2530|T1Leia a Tag do|D3550|T1Veículo.|D2170|C|KC") 'pede a tag do veículo
                        Sm_cmd = Sm_Cmds.Pendency
                    Case Sm_Cmds.Write_Value
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E89Lê Valor|D1830|T1Insira o Valor ($)|D2150|T1do abastecimento|D3870|EN062") 'pede o valor do preset em dinheiro ou volume
                        Sm_cmd = Sm_Cmds.Pendency
                    Case Sm_Cmds.Write_Abast
                        'BBTTTTTTTTTTTTTTTTCAPPPPPPttpRRRRR / p -> "V"c (preset de volume), "$"c (preset de dinheiro)
                        If Menu = Frota Then
                            Form1.Horustech.HrsPut("26" + Form1.TextBox10.Text + Form1.TextBox5.Text + "0S00000020V00000") 'envia preset(infinito) de volume e identificado para o bico e cartão lido
                        ElseIf Menu = Cliente Then
                            Form1.Horustech.HrsPut("26" + Form1.TextBox11.Text + Form1.TextBox9.Text + "0S" + Form1.TextBox13.Text + "20$00000") 'preset em dinheiro
                        End If
                        Sm_cmd = Sm_Cmds.Pendency
                    Case Sm_Cmds.Write_Abast_Init
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E92Terminal|T1Sucesso!|R|R|T1Bico Liberado ...|KN") 'exibe mensagem de bico liberado
                        Sm_cmd = Sm_Cmds.Pendency
                    Case Sm_Cmds.Bico_Busy
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E93Terminal|T1Erro!|R|R|T1Bico Ocupado ...|KC") 'exibe mensagem de bico ocupado
                        Sm_cmd = Sm_Cmds.Pendency
                    Case Sm_Cmds.Bico_Off
                        Form1.Horustech.HrsPut("2E" + Numberlogic + "0E94Terminal|T1Erro|R|R|T1Bico Inexistente ...|KC") 'exibe mensagem de bico inexistente
                        Sm_cmd = Sm_Cmds.Pendency
                End Select
            Case Sm_States.Rx
                If Form1.Horustech.Pckg_ok Then
                    Parser(Form1.Horustech.Buff_rx, Form1.Horustech.Rx_data_len) 'verifica de qual comando foi a resposta obtida e seleciona o próximo estado
                    Form1.Term.Indexer += 1 'seleciona o próximo terminal da lista de terminais online
                    Sm_task = Sm_States.Tx 'volta para o estado de transmissão
                End If
        End Select

    End Sub
End Class


Public Class TWC

    Private State_sm, Qtd_TWC, List(99) As Integer
    Public NLogic, Indexer, Sm As Integer
    Private Twc(99) As ProtTWC

    Sub New()
        State_sm = Sm_States.Tx
        Sm = Sm_States.State
        For count As Integer = 0 To 99 Step 1
            Twc(count) = New ProtTWC()
        Next
    End Sub

    Enum Sm_States
        State
        Looping
        Tx
        Rx
    End Enum

    Function Extract(Str As String, len As Integer) As Integer
        Dim N_term As Integer = ((len - 2) / 2)
        If N_term Then
            For count As Integer = 0 To N_term - 1 Step 1
                Dim Stri As String = Mid(Str, (count * 2) + 3, 2)
                List(count) = Convert.ToInt32(Stri)
            Next
        End If
        Return N_term
    End Function

    Function Send_State() As Integer
        Select Case State_sm
            Case Sm_States.Tx
                Form1.Horustech.HrsPut("2F")
                State_sm = Sm_States.Rx
                Return False
            Case Sm_States.Rx
                If Form1.Horustech.Pckg_ok Then
                    Dim cmd As String = Mid(Form1.Horustech.Buff_rx, 1, 2)
                    If cmd = "2F" Then
                        Dim len As Integer = Form1.Horustech.Rx_len
                        If len > 2 Then
                            Dim Qtd_term As Integer = Extract(Form1.Horustech.Buff_rx, len)
                            Return Qtd_term
                        Else
                            State_sm = Sm_States.Tx
                            Return False
                        End If
                    Else
                        State_sm = Sm_States.Tx
                        Return False
                    End If
                Else
                    Return False
                End If
        End Select
    End Function

    Public Sub Task()
        If Form1.Connect.Connected Then
            If Not Form1.Connect.tcpClient.is_busy Then
                Select Case Sm
                    Case Sm_States.State
                        Qtd_TWC = Send_State()
                        If Qtd_TWC Then
                            Indexer = 0
                            Sm = Sm_States.Looping
                        End If
                    Case Sm_States.Looping
                        If Indexer < Qtd_TWC Then
                            NLogic = List(Indexer)
                            If NLogic = 0 Then
                                NLogic = 1
                            End If
                            Twc(NLogic).Task()
                        Else
                            Sm = Sm_States.State
                        End If
                End Select
            End If
        End If
    End Sub

End Class

Public Class Hrs
    Private Tx_Checksum As Integer
    Private Tx_Len As Integer
    Public Rx_data_len As Integer
    Public Pckg_ok As Boolean
    Public Buff_rx(200) As Char
    Public Rx_len, Sm As Integer
    Public Buff_tx(200) As Char
    Public Buff_tcp As String
    Private ToutTx, ToutRx As Integer

    Enum Sm_State
        Tx
        Rx
        STX
        INIT
        GET_LEN
        GET_DATA
        GET_CHECK
    End Enum

    Function Parser(ByRef Str As Char(), len As Integer) As Boolean

        Dim Rx_count, Rx_Sm, Rx_checksum, Rx_lencount, Rx_Ckcount, Rx_datacount As Integer
        Dim Rx_data, Rx_Len_Acc(4), Rx_Ck_acc(2) As Char
        Dim Rx_data_b As Byte
        Dim stra As String
        Rx_Sm = Sm_State.STX

        While (Rx_count < len)
            Rx_data = Str(Rx_count)
            Rx_data_b = Convert.ToByte(Rx_data)
            Rx_count += 1
            Select Case Rx_Sm
                Case Sm_State.STX
                    If Rx_data = ">"c Then
                        Rx_Sm = Sm_State.INIT
                        Rx_checksum = 0
                    End If
                Case Sm_State.INIT
                    If Rx_data = "!"c Then
                        Rx_Sm = Sm_State.GET_LEN
                        Rx_checksum += Rx_data_b
                    End If
                Case Sm_State.GET_LEN
                    Rx_Len_Acc(Rx_lencount) = Rx_data
                    Rx_lencount += 1
                    Rx_checksum += Rx_data_b
                    If Rx_lencount = 4 Then
                        stra = Mid(Str, 3, 4)
                        Rx_len = Convert.ToInt32(stra, 16)
                        Rx_Sm = Sm_State.GET_DATA
                        Rx_lencount = 0
                    End If
                Case Sm_State.GET_DATA
                    Str(Rx_datacount) = Rx_data
                    Rx_datacount += 1
                    Rx_checksum += Rx_data_b
                    If Rx_datacount = Rx_len Then
                        Rx_data_len = Rx_datacount
                        Str(Rx_datacount) = Chr(0)
                        Rx_Sm = Sm_State.GET_CHECK
                        Rx_datacount = 0
                    End If
                Case Sm_State.GET_CHECK
                    Rx_Ck_acc(Rx_Ckcount) = Rx_data
                    Rx_Ckcount += 1
                    If Rx_Ckcount = 2 Then
                        Dim stri As String = Hex(Rx_checksum)
                        Dim ck_c As String = Mid(stri, stri.Length - 1, 2)
                        Dim ck_a As String = Rx_Ck_acc
                        If Not String.Compare(ck_a, ck_c) Then
                            Rx_Ckcount = 0
                            Rx_Sm = Sm_State.STX
                            Return True
                        End If
                    End If
            End Select
        End While
        Return False
    End Function


    Public Sub Task()
        Select Case Sm
            Case Sm_State.Tx
                If Form1.Tout.TickCompare(ToutTx) Then
                    ToutTx = Form1.Tout.GetTick() + Form1.TimetoTx
                    ToutRx = Form1.Tout.GetTick() + Form1.TimetoRx
                    If Form1.Connect.Connected() And Buff_tcp <> "" Then
                        Form1.Connect.tcpClient.Write(Buff_tcp, Tx_Len)
                        Form1.Connect.tcpClient.is_busy = False
                        Form1.Connect.Grade.Write("Tx", Mid(Buff_tcp, 7, 2), Buff_tcp, "", "")
                        Array.Clear(Buff_tx, 0, 200)
                        Buff_tcp = ""
                        Tx_Checksum = 0
                        Tx_Len = 0
                        Pckg_ok = False
                        Sm = Sm_State.Rx
                    End If
                End If

            Case Sm_State.Rx
                If Not Form1.Tout.TickCompare(ToutRx) Then
                    Dim size As Integer = Form1.Connect.tcpClient.Read(Buff_rx)
                    If size > 0 Then
                        Form1.Connect.Grade.Write("Rx", Mid(Buff_rx, 7, 2), Buff_rx, "", "")
                        If Parser(Buff_rx, size) Then
                            Pckg_ok = True
                        Else
                            Form1.Connect.Grade.Write("Info", "Erro na Verificação de Pacote", "", "", "")
                            ToutTx = Form1.Tout.GetTick() + Form1.TimetoTx
                            Form1.Horustech.Pckg_ok = True
                        End If
                        Sm = Sm_State.Tx
                    End If
                Else
                    Sm = Sm_State.Tx
                End If
        End Select

    End Sub


    Public Function Ajust(Str As String, len As Integer) As String
        If Str <> "" Then
            While (1)
                If Str.Length < len Then
                    Str = "0" + Str
                Else
                    Exit While
                End If
            End While
            Return Str
        End If
    End Function

    Private Sub HrsBegin()
        Tx_Checksum = AscW("?"c) ' ? em decimal // ascW -> char to wide
        Form1.Horustech.Buff_tx(0) = ">"c
        Form1.Horustech.Buff_tx(1) = "?"c '> não entra no checksum
        Tx_Len = 2
    End Sub

    Private Function ByteArrayToHex(ByRef ByteArray() As Byte) As String
        Dim lb As Long, ub As Long
        Dim l As Long, strRet As String
        Dim lonRetLen As Long, lonPos As Long
        Dim strHex As String, lonLenHex As Long

        lb = LBound(ByteArray)
        ub = UBound(ByteArray)
        lonRetLen = ((ub - lb) + 1) * 3
        strRet = Space$(lonRetLen)
        lonPos = 1

        For l = lb To ub
            strHex = Hex$(ByteArray(l))
            If Len(strHex) = 1 Then strHex = "0" & strHex
            If l <> ub Then
                Mid$(strRet, lonPos, 3) = strHex & " "
                lonPos = lonPos + 3
            Else
                Mid$(strRet, lonPos, 3) = strHex
            End If
        Next l
        Return strHex
    End Function

    Private Sub HrsFlush()
        Dim tam As String = Tx_Len - 2 'não conta os marcadores nem o próprio campo
        Dim len As String = Ajust(Hex(tam), 4)

        For count As Integer = 2 To 5 Step 1
            Dim val As Char = len(count - 2) 'char to byte
            Form1.Horustech.Buff_tx(count) = val
            Tx_Checksum += Convert.ToByte(val)
        Next
        Tx_Len += 4

        Dim cki As String = Hex(Tx_Checksum)
        Dim ck As String = Mid(cki, cki.Length - 1, 2)

        For count As Integer = 0 To 1 Step 1
            Dim val As Char = ck(count) 'char to byte
            Form1.Horustech.Buff_tx(Tx_Len + count) = val
        Next
        Tx_Len += 2
        Form1.Horustech.Buff_tx(Tx_Len) = Chr(0)
        Form1.Horustech.Buff_tcp = New String(Form1.Horustech.Buff_tx)

    End Sub

    Private Sub HrsPutdata(cmd As String)
        Dim len As Integer = cmd.Length

        For count As Integer = 0 To len - 1 Step 1
            Dim val As Char = cmd(count) 'char to byte
            Form1.Horustech.Buff_tx(Tx_Len + 4 + count) = val
            Tx_Checksum += Convert.ToByte(val)
        Next
        Tx_Len += len

    End Sub

    Public Sub HrsPut(Cmd As String)
        If Form1.Connect.Connected Then
            HrsBegin()
            HrsPutdata(Cmd)
            HrsFlush()
            Form1.Connect.tcpClient.is_busy = True
        End If
    End Sub

End Class


Public Class Grid
    Public Grd As DataGridView

    Sub New()
        Grd = New DataGridView()

        Grd.ColumnCount = 5

        With Grd.ColumnHeadersDefaultCellStyle
            .BackColor = Color.LightGray
            .ForeColor = Color.White
            .Font = New Font(Grd.Font, FontStyle.Bold)
        End With

        With Grd
            .Name = "Grade"
            .Location = New Point(270, 2)
            .Size = New Size(500, 460)
            .AutoSizeRowsMode = _
                DataGridViewAutoSizeRowsMode.DisplayedCellsExceptHeaders
            .ColumnHeadersBorderStyle = DataGridViewHeaderBorderStyle.Single
            .CellBorderStyle = DataGridViewCellBorderStyle.Single
            .GridColor = Color.Ivory
            .RowHeadersVisible = False

            .Columns(0).Name = "Idx"
            .Columns(0).Width = 30
            .Columns(1).Name = "Cmd"
            .Columns(1).Width = 70
            .Columns(2).Name = "Cmd1"
            .Columns(2).Width = 500
            .Columns(3).Name = "Cmd2"
            .Columns(4).Name = "Cmd3"
            .Columns(4).DefaultCellStyle.Font = _
                New Font(.DefaultCellStyle.Font, FontStyle.Italic)

            .SelectionMode = DataGridViewSelectionMode.FullRowSelect
            .MultiSelect = False
            '.Dock = DockStyle.Fill coloca a grade em tela cheia
        End With
    End Sub

    Public Sub Write(idx As String, Cmd As String, Cmd1 As String, Cmd2 As String, Cmd3 As String)
        Grd.Rows.Add(idx, Cmd, Cmd1, Cmd2, Cmd3)
        Grd.FirstDisplayedScrollingRowIndex = Grd.RowCount - 1
    End Sub

End Class

Public Class Tick
    Public Val As Integer

    Function GetTick() As Integer
        Return Val
    End Function

    Function TickCompare(value As Integer) As Boolean
        If (value - GetTick() <= 0) Then
            Return True
        Else
            Return False
        End If

    End Function

End Class


Public Class Connection

    Public Grade As Grid
    Public tcpClient As Tcp
    Private is_Reconnecting As Boolean
    Public Sm, TimetoConnection As Integer

    Enum Sm_States
        Connect
        Reconnect
        Disconnect
        Wait
    End Enum

    Sub New()
        Sm = Sm_States.Wait
        Grade = New Grid()
        is_Reconnecting = False
    End Sub

    Function Connected() As Boolean
        If Not IsNothing(tcpClient) Then
            If tcpClient.Connected <> Nothing Then
                Return tcpClient.Connected
            Else
                Return False
            End If

        Else
            Return False
        End If
    End Function

    Public Sub Task()
        Select Case Sm

            Case Sm_States.Connect
                If Form1.Tout.TickCompare(TimetoConnection) Then

                    Form1.Tout = New Tick()
                    Form1.Horustech = New Hrs()
                    Form1.Term = New TWC()
                    TimetoConnection = Form1.Tout.GetTick() + Form1.TimetoConnect
                    tcpClient = New Tcp(Form1.TextBox1.Text, Form1.ComboBox1.Text)
                    Dim ar As IAsyncResult = tcpClient.Connect()
                    Dim wh As System.Threading.WaitHandle = ar.AsyncWaitHandle

                    Try
                        If Not ar.AsyncWaitHandle.WaitOne(Form1.TimetoConnect, False) Then
                            Grade.Write("Info", "Não Conectou", tcpClient.Get_Ip(), tcpClient.Get_Port().ToString, "")
                            tcpClient.Inc_Port()
                            Form1.Button1.Text = "Parar"
                            tcpClient.Close()
                            Return
                        End If
                        tcpClient.EndConnect(ar)
                    Catch ex As Exception

                    Finally
                        wh.Close()
                    End Try

                    If tcpClient.Connected Then
                        Grade.Write("Info", "Conectado", tcpClient.Get_Ip(), tcpClient.Get_Port().ToString, "")
                        Form1.Connect.tcpClient.SetNetwork()
                        Form1.Button1.Text = "Desconectar"
                        is_Reconnecting = False
                        Sm = Sm_States.Wait
                    Else
                        If is_Reconnecting Then
                            Sm = Sm_States.Disconnect
                        End If
                        tcpClient.Inc_Port()
                        Form1.Button1.Text = "Parar"
                        Grade.Write("Info", "Não Conectou", tcpClient.Get_Ip(), tcpClient.Get_Port().ToString, "")
                    End If
                End If

            Case Sm_States.Reconnect
                is_Reconnecting = True
                Sm = Sm_States.Disconnect
            Case Sm_States.Disconnect
                tcpClient.Disconnect()

                Grade.Write("Info", "Desconectado", tcpClient.Get_Ip(), tcpClient.Get_Port().ToString, "")
                Form1.Button1.Text = "Conectar"

                If Not is_Reconnecting Then
                    Sm = Sm_States.Wait
                Else
                    Sm = Sm_States.Connect
                    TimetoConnection = Form1.Tout.GetTick()
                End If

            Case Sm_States.Wait

        End Select


    End Sub
End Class


Public Class Tcp

    Private Connection As TcpClient
    Private Port_Host As Integer
    Private Ip_Host As IPAddress
    Public is_busy As Boolean
    Private networkStream As NetworkStream

    Sub New()
        is_busy = False
    End Sub

    Public Sub Inc_Port()
        If Form1.ComboBox1.SelectedIndex < 3 Then
            Form1.ComboBox1.SelectedIndex += 1
        Else
            Form1.ComboBox1.SelectedIndex = 0
        End If
        Port_Host = Convert.ToDecimal(Form1.ComboBox1.Text)
    End Sub

    Function Get_Ip() As String
        Return Port_Host
    End Function

    Function Get_Port() As Integer
        Return Ip_Host.ToString
    End Function

    Public ReadOnly Property Connected() As Boolean
        Get
            If Not IsNothing(Connection) Then
                Try
                    Return Connection.Connected
                Catch ex As Exception
                    Return False
                End Try
            Else
                Return False
            End If
        End Get
    End Property

    Function Connect() As IAsyncResult
        Dim loc As System.AsyncCallback
        Return Connection.BeginConnect(Ip_Host, Port_Host, loc, 0)
    End Function

    Public Sub SetNetwork()
        networkStream = Connection.GetStream()
    End Sub

    Public Sub StreamClose()
        networkStream.Close()
    End Sub

    Public Sub EndConnect(ar As IAsyncResult)
        Connection.EndConnect(ar)
    End Sub

    Public Sub Close()
        Connection.Close()
    End Sub

    Public Sub Disconnect()
        Connection.Close()

    End Sub

    Function IPtoStr(ip As String) As IPAddress
        Dim address As IPAddress = IPAddress.Parse(ip)
        Return address
    End Function

    Sub New(ip As String, port As Integer)
        Connection = New TcpClient()
        Ip_Host = IPtoStr(ip)
        Port_Host = port
    End Sub

    Private Function UnicodeStringToBytes(ByVal str As String) As Byte()
        Return System.Text.Encoding.Default.GetBytes(str)
    End Function

    Public Sub Write(buf As Char(), len As Integer)

        Dim str As Byte() = UnicodeStringToBytes(buf)
        networkStream.Write(UnicodeStringToBytes(buf), 0, len)
    End Sub

    Private Function StringToBytes(ByVal str As String) As Byte()
        Return System.Text.Encoding.Unicode.GetBytes(str)
    End Function

    Private Function UnicodeBytesToString(ByVal bytes() As Byte) As String

        Return System.Text.Encoding.ASCII.GetString(bytes)
    End Function

    Function Read(ByRef buf As Char()) As Integer
        If Connected() Then
            If networkStream.DataAvailable Then
                Dim Bufii As Byte()
                ReDim Bufii(200)
                Dim size As Integer = networkStream.Read(Bufii, 0, 200)
                buf = UnicodeBytesToString(Bufii)
                Return size
            Else
                Return 0
            End If
        End If

    End Function

End Class
