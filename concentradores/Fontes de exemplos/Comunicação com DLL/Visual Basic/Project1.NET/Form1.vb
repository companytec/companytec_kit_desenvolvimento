Option Strict Off
Option Explicit On
Friend Class Form1
	Inherits System.Windows.Forms.Form
	Dim indice As Short
	Dim comando As String
	Dim send As Boolean
	Private Sub Bt_CloseSerial_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Bt_CloseSerial.Click
		Dim rta As Short
		rta = VB_CloseSerial
		If rta > 0 Then
			List1.Items.Add("Porta serial fechada com sucesso")
		Else
			List1.Items.Add("Não foi possível fechar a porta serial")
		End If
	End Sub
	
	Private Sub Bt_CloseSocket_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Bt_CloseSocket.Click
		Dim res As Short
		res = VB_CloseSocket
		If res > 0 Then
			List1.Items.Add("Socket fechado com sucesso")
		Else
			List1.Items.Add("Não foi possível fechar o Socket")
		End If
	End Sub
	
	
	Private Sub Bt_OpenSerial_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Bt_OpenSerial.Click
		Dim ret As Short
		ret = VB_OpenSerial(CShort(Text1.Text))
		If ret > 0 Then
			List1.Items.Add("Porta serial aberta com sucesso")
		Else
			List1.Items.Add("Não foi possível abrir a porta serial")
		End If
	End Sub
	
	Private Sub Bt_OpenSocket_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Bt_OpenSocket.Click
		Dim res As Short
		res = VB_OpenSocket(Text1.Text)
		If res > 0 Then
			List1.Items.Add("Socket aberto com sucesso")
		Else
			List1.Items.Add("Não foi possível abrir o socket")
		End If
	End Sub
	
	Private Sub Bt_RecText_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Bt_RecText.Click
		Dim rta As String
		Dim res As Short
		res = VB_ReceiveText(rta)
		If res > 0 Then
			List1.Items.Add(rta)
		End If
	End Sub
	
	Private Sub Bt_SendText_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Bt_SendText.Click
		Dim res As Short
		res = VB_SendText(Text2.Text)
		Text3.Text = CStr(res)
	End Sub
	
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		Dim abastecimento As String
		Dim rta As Short
		rta = VB_ReadSale(abastecimento)
		If rta = 0 Then
			List1.Items.Add("Erro")
		ElseIf rta = 1 Then 
			List1.Items.Add(abastecimento)
		ElseIf rta = 2 Then 
			List1.Items.Add("Sem abastecimentos na memória")
		End If
	End Sub
	
	Private Sub Command10_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command10.Click
		Dim rta As Integer
		rta = VB_ReadTotalsVolume(Text6.Text)
		If rta <> -1 Then
			List1.Items.Add("Encerrante Volume: " & rta)
		Else
			List1.Items.Add("Erro ao ler encerrante Volume")
		End If
	End Sub
	
	Private Sub Command11_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command11.Click
		indice = 0
		send = True
		Timer1.Interval = 3000
		Timer1.Enabled = Not Timer1.Enabled
		Option1.Checked = Timer1.Enabled
	End Sub
	
	Private Sub Command12_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command12.Click
		Dim res As Short
        Dim dado As String
        Dim bytedata() As Byte

        dado = Text11.Text
        bytedata = System.Text.Encoding.Default.GetBytes(dado)
        res = VB_SendReceiveText(bytedata, CShort(Text10.Text))
		If res = 0 Then
			Text12.Text = "SEM RESPOSTA"
		Else
			Text12.Text = dado
		End If
	End Sub
	
	Private Sub Command2_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command2.Click
		VB_NextSale()
	End Sub
	
	Private Sub Command3_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command3.Click
		Dim rta As Short
		rta = VB_SetPrice(Text4.Text, Text5.Text)
		If rta = 0 Then
			List1.Items.Add("Erro alteração de preço")
		Else
			List1.Items.Add("Preço alterado")
		End If
	End Sub
	
	Private Sub Command4_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command4.Click
		Dim rta As Short
		Dim st As String
		rta = VB_ReadState(st)
		If rta = 0 Then
			List1.Items.Add("Erro leitura de status")
		Else
			List1.Items.Add(st)
		End If
	End Sub
	
	Private Sub Command5_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command5.Click
		Dim rta As Short
		rta = VB_FreePump(Text7.Text)
		If rta = 0 Then
			List1.Items.Add("Erro libera bico")
		Else
			List1.Items.Add("Bico liberado")
		End If
	End Sub
	
	Private Sub Command6_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command6.Click
		Dim rta As Short
		rta = VB_BlockPump(Text7.Text)
		If rta = 0 Then
			List1.Items.Add("Erro bloqueia bico")
		Else
			List1.Items.Add("Bico bloqueado")
		End If
	End Sub
	
	Private Sub Command7_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command7.Click
		Dim rta As Short
		rta = VB_AutPump(Text7.Text)
		If rta = 0 Then
			List1.Items.Add("Erro Autoriza bico")
		Else
			List1.Items.Add("Bico autorizado")
		End If
	End Sub
	
	Private Sub Command8_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command8.Click
		Dim rta As Short
		rta = VB_PresetPump(Text9.Text, Text8.Text)
		If rta = 0 Then
			List1.Items.Add("Erro Preset")
		Else
			List1.Items.Add("Preset aceito")
		End If
	End Sub
	
	Private Sub Command9_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command9.Click
		Dim rta As Short
		rta = VB_ReadTotalsCash(Text6.Text)
		If rta <> -1 Then
			List1.Items.Add("Encerrante Cash: " & rta)
		Else
			List1.Items.Add("Erro ao ler encerrante Cash")
		End If
	End Sub
	
	Private Sub Picture1_Click()
		
	End Sub
	
	Private Sub Timer1_Tick(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Timer1.Tick
		Dim res As Short
		Dim st As String
		If send Then
			comando = VB6.GetItemString(List2, indice)
			res = VB_SendText(comando)
			List1.Items.Add(("SEND ->" & comando))
			indice = indice + 1
			If VB6.GetItemString(List2, indice) = "" Then
				indice = 0
			End If
		Else
			res = VB_ReceiveText(st)
			List1.Items.Add(("RECEIVE ->" & st))
			If comando = "(&A)" And st <> "" And st <> "(0)" Then
				VB_SendText("(&I)")
				List1.Items.Add(("SEND ->(&I)"))
			End If
		End If
		send = Not send
	End Sub
End Class