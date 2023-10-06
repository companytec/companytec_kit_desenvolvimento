VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "DLL Companytec x Visual Basic - Companytec©/Desenvolvimento"
   ClientHeight    =   7965
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   12600
   LinkTopic       =   "Form1"
   ScaleHeight     =   7965
   ScaleWidth      =   12600
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame11 
      Caption         =   "VB_SendReceiveText"
      Height          =   1335
      Left            =   60
      TabIndex        =   48
      Top             =   6600
      Width           =   6375
      Begin VB.TextBox Text12 
         Height          =   315
         Left            =   2040
         Locked          =   -1  'True
         TabIndex        =   54
         Top             =   480
         Width           =   4215
      End
      Begin VB.TextBox Text11 
         Height          =   315
         Left            =   120
         TabIndex        =   51
         Text            =   "(&S)"
         Top             =   480
         Width           =   1155
      End
      Begin VB.CommandButton Command12 
         Caption         =   "VB_SendReceiveText"
         Height          =   315
         Left            =   2040
         TabIndex        =   50
         Top             =   900
         Width           =   4215
      End
      Begin VB.TextBox Text10 
         Height          =   315
         Left            =   1320
         TabIndex        =   49
         Text            =   "0"
         Top             =   480
         Width           =   675
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Resposta"
         Height          =   195
         Index           =   4
         Left            =   2040
         TabIndex        =   55
         Top             =   240
         Width           =   675
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Comando"
         Height          =   195
         Index           =   3
         Left            =   120
         TabIndex        =   53
         Top             =   240
         Width           =   675
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Timeout"
         Height          =   195
         Index           =   2
         Left            =   1320
         TabIndex        =   52
         Top             =   240
         Width           =   570
      End
   End
   Begin VB.Frame Agendador 
      Caption         =   "Agendador"
      Height          =   2655
      Left            =   10560
      TabIndex        =   44
      Top             =   5280
      Width           =   1995
      Begin VB.OptionButton Option1 
         Caption         =   "Timer ligado"
         Height          =   195
         Left            =   120
         TabIndex        =   47
         Top             =   2340
         Width           =   1515
      End
      Begin VB.CommandButton Command11 
         Caption         =   "Habilitar Timer"
         Height          =   375
         Left            =   120
         TabIndex        =   46
         Top             =   1800
         Width           =   1755
      End
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Left            =   1320
         Top             =   360
      End
      Begin VB.ListBox List2 
         Height          =   1425
         ItemData        =   "Form1.frx":0000
         Left            =   120
         List            =   "Form1.frx":0007
         TabIndex        =   45
         Top             =   240
         Width           =   1755
      End
   End
   Begin VB.Frame Frame9 
      Caption         =   "Preset"
      Height          =   1335
      Left            =   6480
      TabIndex        =   38
      Top             =   6600
      Width           =   4035
      Begin VB.CommandButton Command8 
         Caption         =   "VB_PresetPump"
         Height          =   315
         Left            =   120
         TabIndex        =   41
         Top             =   900
         Width           =   3795
      End
      Begin VB.TextBox Text9 
         Height          =   315
         Left            =   120
         TabIndex        =   40
         Top             =   480
         Width           =   735
      End
      Begin VB.TextBox Text8 
         Height          =   315
         Left            =   2160
         TabIndex        =   39
         Top             =   480
         Width           =   735
      End
      Begin VB.Label Label8 
         Caption         =   "Bico - 2 Caracteres"
         Height          =   255
         Left            =   120
         TabIndex        =   43
         Top             =   240
         Width           =   1755
      End
      Begin VB.Label Label7 
         Caption         =   "Valor - 6 Caracteres"
         Height          =   255
         Left            =   2160
         TabIndex        =   42
         Top             =   240
         Width           =   1755
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Comandos"
      Height          =   1515
      Left            =   10560
      TabIndex        =   15
      Top             =   3720
      Width           =   1995
      Begin VB.CommandButton Command4 
         Caption         =   "VB_ReadState"
         Height          =   315
         Left            =   120
         TabIndex        =   24
         Top             =   1080
         Width           =   1755
      End
      Begin VB.CommandButton Command2 
         Caption         =   "VB_NextSale"
         Height          =   315
         Left            =   120
         TabIndex        =   17
         Top             =   660
         Width           =   1755
      End
      Begin VB.CommandButton Command1 
         Caption         =   "VB_ReadSale"
         Height          =   315
         Left            =   120
         TabIndex        =   16
         Top             =   240
         Width           =   1755
      End
   End
   Begin VB.Frame Frame8 
      BackColor       =   &H00808080&
      BorderStyle     =   0  'None
      Caption         =   "Frame8"
      Height          =   1215
      Left            =   0
      TabIndex        =   36
      Top             =   0
      Width           =   12675
      Begin VB.Label Label6 
         BackColor       =   &H00808080&
         Caption         =   "Exemplo de integração com DLL Companytec"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   60
         TabIndex        =   37
         Top             =   900
         Width           =   6555
      End
   End
   Begin VB.Frame Frame7 
      Caption         =   "Leitura de encerrantes"
      Height          =   1275
      Left            =   6480
      TabIndex        =   31
      Top             =   5280
      Width           =   4035
      Begin VB.TextBox Text6 
         Height          =   315
         Left            =   120
         TabIndex        =   34
         Top             =   420
         Width           =   735
      End
      Begin VB.CommandButton Command10 
         Caption         =   "VB_ReadTotalsVolume"
         Height          =   315
         Left            =   2040
         TabIndex        =   33
         Top             =   840
         Width           =   1875
      End
      Begin VB.CommandButton Command9 
         Caption         =   "VB_ReadTotalsCash"
         Height          =   315
         Left            =   120
         TabIndex        =   32
         Top             =   840
         Width           =   1875
      End
      Begin VB.Label Label4 
         Caption         =   "Bico - 2 Caracteres"
         Height          =   255
         Left            =   120
         TabIndex        =   35
         Top             =   180
         Width           =   1755
      End
   End
   Begin VB.Frame Frame6 
      Caption         =   "Autorizar/Liberar/Bloquear"
      Height          =   1275
      Left            =   6480
      TabIndex        =   25
      Top             =   3960
      Width           =   4035
      Begin VB.CommandButton Command7 
         Caption         =   "VB_AutPump"
         Height          =   315
         Left            =   120
         TabIndex        =   30
         Top             =   840
         Width           =   1200
      End
      Begin VB.CommandButton Command6 
         Caption         =   "VB_BlockPump"
         Height          =   315
         Left            =   1380
         TabIndex        =   29
         Top             =   840
         Width           =   1260
      End
      Begin VB.CommandButton Command5 
         Caption         =   "VB_FreePump"
         Height          =   315
         Left            =   2700
         TabIndex        =   27
         Top             =   840
         Width           =   1200
      End
      Begin VB.TextBox Text7 
         Height          =   315
         Left            =   120
         TabIndex        =   26
         Top             =   420
         Width           =   735
      End
      Begin VB.Label Label5 
         Caption         =   "Bico - 2 Caracteres"
         Height          =   255
         Left            =   120
         TabIndex        =   28
         Top             =   180
         Width           =   1755
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "Alteração de preço"
      Height          =   1215
      Left            =   6480
      TabIndex        =   18
      Top             =   2700
      Width           =   4035
      Begin VB.TextBox Text5 
         Height          =   315
         Left            =   2160
         TabIndex        =   23
         Top             =   420
         Width           =   735
      End
      Begin VB.TextBox Text4 
         Height          =   315
         Left            =   120
         TabIndex        =   20
         Top             =   420
         Width           =   735
      End
      Begin VB.CommandButton Command3 
         Caption         =   "VB_SetPrice"
         Height          =   315
         Left            =   120
         TabIndex        =   19
         Top             =   780
         Width           =   3795
      End
      Begin VB.Label Label3 
         Caption         =   "Preço - 4 Caracteres"
         Height          =   255
         Left            =   2160
         TabIndex        =   22
         Top             =   180
         Width           =   1755
      End
      Begin VB.Label Label2 
         Caption         =   "Bico - 2 Caracteres"
         Height          =   255
         Left            =   120
         TabIndex        =   21
         Top             =   180
         Width           =   1755
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "VB_SendText"
      Height          =   1395
      Left            =   6480
      TabIndex        =   8
      Top             =   1260
      Width           =   4035
      Begin VB.TextBox Text3 
         Height          =   315
         Left            =   3240
         TabIndex        =   11
         Text            =   "0"
         Top             =   480
         Width           =   675
      End
      Begin VB.CommandButton Bt_SendText 
         Caption         =   "VB_SendText"
         Height          =   315
         Left            =   120
         TabIndex        =   10
         Top             =   960
         Width           =   3795
      End
      Begin VB.TextBox Text2 
         Height          =   315
         Left            =   120
         TabIndex        =   9
         Text            =   "(&S)"
         Top             =   480
         Width           =   3075
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Enviados"
         Height          =   195
         Index           =   1
         Left            =   3240
         TabIndex        =   13
         Top             =   240
         Width           =   660
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Comando"
         Height          =   195
         Index           =   0
         Left            =   120
         TabIndex        =   12
         Top             =   240
         Width           =   675
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "VB_ReceiveText"
      Height          =   5295
      Left            =   60
      TabIndex        =   5
      Top             =   1260
      Width           =   6375
      Begin VB.CommandButton Bt_RecText 
         Caption         =   "VB_ReceiveText"
         Height          =   315
         Left            =   4500
         TabIndex        =   7
         Top             =   4860
         Width           =   1755
      End
      Begin VB.ListBox List1 
         Height          =   4545
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   6135
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Comunicação"
      Height          =   2415
      Left            =   10560
      TabIndex        =   0
      Top             =   1260
      Width           =   1995
      Begin VB.CommandButton Bt_OpenSerial 
         Caption         =   "VB_OpenSerial"
         Height          =   375
         Left            =   120
         TabIndex        =   14
         Top             =   660
         Width           =   1755
      End
      Begin VB.CommandButton Bt_CloseSocket 
         Caption         =   "VB_CloseSocket"
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   1920
         Width           =   1755
      End
      Begin VB.CommandButton Bt_CloseSerial 
         Caption         =   "VB_CloseSerial"
         Height          =   375
         Left            =   120
         TabIndex        =   3
         Top             =   1500
         Width           =   1755
      End
      Begin VB.TextBox Text1 
         Height          =   315
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   1755
      End
      Begin VB.CommandButton Bt_OpenSocket 
         Caption         =   "VB_OpenSocket"
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Top             =   1080
         Width           =   1755
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim indice As Integer
Dim comando As String
Dim send As Boolean
Private Sub Bt_CloseSerial_Click()
Dim rta As Integer
rta = VB_CloseSerial
If rta > 0 Then
    List1.AddItem "Porta serial fechada com sucesso"
Else
    List1.AddItem "Não foi possível fechar a porta serial"
End If
End Sub

Private Sub Bt_CloseSocket_Click()
Dim res As Integer
res = VB_CloseSocket
If res > 0 Then
    List1.AddItem "Socket fechado com sucesso"
Else
    List1.AddItem "Não foi possível fechar o Socket"
End If
End Sub


Private Sub Bt_OpenSerial_Click()
Dim ret As Integer
ret = VB_OpenSerial(Text1.Text)
If ret > 0 Then
    List1.AddItem "Porta serial aberta com sucesso"
Else
    List1.AddItem "Não foi possível abrir a porta serial"
End If
End Sub

Private Sub Bt_OpenSocket_Click()
Dim res As Integer
res = VB_OpenSocket(Text1.Text)
If res > 0 Then
    List1.AddItem "Socket aberto com sucesso"
Else
    List1.AddItem "Não foi possível abrir o socket"
End If
End Sub

Private Sub Bt_RecText_Click()
Dim rta As String
Dim res As Integer
res = VB_ReceiveText(rta)
If res > 0 Then
    List1.AddItem rta
End If
End Sub

Private Sub Bt_SendText_Click()
Dim res As Integer
res = VB_SendText(Text2.Text)
Text3.Text = res
End Sub

Private Sub Command1_Click()
Dim abastecimento As String
Dim rta As Integer
rta = VB_ReadSale(abastecimento)
If rta = 0 Then
    List1.AddItem "Erro"
ElseIf rta = 1 Then
    List1.AddItem abastecimento
ElseIf rta = 2 Then
    List1.AddItem "Sem abastecimentos na memória"
End If
End Sub

Private Sub Command10_Click()
Dim rta As Long
rta = VB_ReadTotalsVolume(Text6.Text)
If rta <> -1 Then
    List1.AddItem "Encerrante Volume: " & rta
Else
    List1.AddItem "Erro ao ler encerrante Volume"
End If
End Sub

Private Sub Command11_Click()
indice = 0
send = True
Timer1.Interval = 3000
Timer1.Enabled = Not Timer1.Enabled
Option1.Value = Timer1.Enabled
End Sub

Private Sub Command12_Click()
Dim res As Integer
Dim dado As String
dado = Text11.Text
res = VB_SendReceiveText(dado, Text10.Text)
If res = 0 Then
    Text12.Text = "SEM RESPOSTA"
Else
    Text12.Text = dado
End If
End Sub

Private Sub Command2_Click()
VB_NextSale
End Sub

Private Sub Command3_Click()
Dim rta As Integer
rta = VB_SetPrice(Text4.Text, Text5.Text)
If rta = 0 Then
    List1.AddItem "Erro alteração de preço"
Else
    List1.AddItem "Preço alterado"
End If
End Sub

Private Sub Command4_Click()
Dim rta As Integer
Dim st As String
rta = VB_ReadState(st)
If rta = 0 Then
    List1.AddItem "Erro leitura de status"
Else
    List1.AddItem st
End If
End Sub

Private Sub Command5_Click()
Dim rta As Integer
rta = VB_FreePump(Text7.Text)
If rta = 0 Then
    List1.AddItem "Erro libera bico"
Else
    List1.AddItem "Bico liberado"
End If
End Sub

Private Sub Command6_Click()
Dim rta As Integer
rta = VB_BlockPump(Text7.Text)
If rta = 0 Then
    List1.AddItem "Erro bloqueia bico"
Else
    List1.AddItem "Bico bloqueado"
End If
End Sub

Private Sub Command7_Click()
Dim rta As Integer
rta = VB_AutPump(Text7.Text)
If rta = 0 Then
    List1.AddItem "Erro Autoriza bico"
Else
    List1.AddItem "Bico autorizado"
End If
End Sub

Private Sub Command8_Click()
Dim rta As Integer
rta = VB_PresetPump(Text9.Text, Text8.Text)
If rta = 0 Then
    List1.AddItem "Erro Preset"
Else
    List1.AddItem "Preset aceito"
End If
End Sub

Private Sub Command9_Click()
Dim rta As Integer
rta = VB_ReadTotalsCash(Text6.Text)
If rta <> -1 Then
    List1.AddItem "Encerrante Cash: " & rta
Else
    List1.AddItem "Erro ao ler encerrante Cash"
End If
End Sub

Private Sub Picture1_Click()

End Sub

Private Sub Timer1_Timer()
Dim res As Integer
Dim st As String
If send Then
    comando = List2.List(indice)
    res = VB_SendText(comando)
    List1.AddItem ("SEND ->" & comando)
    indice = indice + 1
    If List2.List(indice) = "" Then
        indice = 0
    End If
Else
    res = VB_ReceiveText(st)
    List1.AddItem ("RECEIVE ->" & st)
    If comando = "(&A)" And st <> "" And st <> "(0)" Then
        VB_SendText ("(&I)")
        List1.AddItem ("SEND ->(&I)")
    End If
End If
send = Not send
End Sub
