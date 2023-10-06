Option Strict Off
Option Explicit On
Module Module1
	Declare Function VB_OpenSerial Lib "companytec.dll" (ByVal np As Short) As Short
	Declare Function VB_CloseSerial Lib "companytec.dll" () As Short
	Declare Function VB_SendText Lib "companytec.dll" (ByVal st As String) As Short
	Declare Function VB_ReceiveText Lib "companytec.dll" (ByRef st As String) As Short
	Declare Function VB_OpenSocket Lib "companytec.dll" (ByVal ip As String) As Short
	Declare Function VB_CloseSocket Lib "companytec.dll" () As Short
	Declare Function VB_ReadSale Lib "companytec.dll" (ByRef st As String) As Short
	Declare Function VB_NextSale Lib "companytec.dll" () As Short
	Declare Function VB_SetPrice Lib "companytec.dll" (ByVal bico As String, ByVal preco As String) As Short
	Declare Function VB_ReadState Lib "companytec.dll" (ByRef st As String) As Short
	Declare Function VB_SetState Lib "companytec.dll" (ByVal bico As String, ByVal tipo As String) As Short
	Declare Function VB_BlockPump Lib "companytec.dll" (ByVal bico As String) As Short
	Declare Function VB_FreePump Lib "companytec.dll" (ByVal bico As String) As Short
	Declare Function VB_AutPump Lib "companytec.dll" (ByVal bico As String) As Short
	Declare Function VB_ReadTotalsCash Lib "companytec.dll" (ByVal bico As String) As Short
	Declare Function VB_ReadTotalsVolume Lib "companytec.dll" (ByVal bico As String) As Integer
	Declare Function VB_PresetPump Lib "companytec.dll" (ByVal bico As String, ByVal preco As String) As Short
    Declare Function VB_SendReceiveText Lib "companytec.dll" (ByRef comando As Byte(), ByVal timeout As Short) As Short
End Module