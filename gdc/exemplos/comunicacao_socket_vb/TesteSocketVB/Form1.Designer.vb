<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.btnSend = New System.Windows.Forms.Button()
        Me.txtAnswer = New System.Windows.Forms.TextBox()
        Me.txtCommand = New System.Windows.Forms.TextBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.ckConected = New System.Windows.Forms.CheckBox()
        Me.btnDisconect = New System.Windows.Forms.Button()
        Me.btnConect = New System.Windows.Forms.Button()
        Me.txtPort = New System.Windows.Forms.TextBox()
        Me.txtIp = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.TabControl1 = New System.Windows.Forms.TabControl()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.Label11 = New System.Windows.Forms.Label()
        Me.tb_command_to_send = New System.Windows.Forms.TextBox()
        Me.Label10 = New System.Windows.Forms.Label()
        Me.tb_duration_seconds = New System.Windows.Forms.TextBox()
        Me.tb_ans_command_save_password = New System.Windows.Forms.TextBox()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.btn_send_command_save_password = New System.Windows.Forms.Button()
        Me.tb_times_of_activation = New System.Windows.Forms.TextBox()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.tb_shower = New System.Windows.Forms.TextBox()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.tb_duration_minutes = New System.Windows.Forms.TextBox()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.tb_password = New System.Windows.Forms.TextBox()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.TabPage3 = New System.Windows.Forms.TabPage()
        Me.Label12 = New System.Windows.Forms.Label()
        Me.tb_send_command_status = New System.Windows.Forms.TextBox()
        Me.tb_ans_command_status = New System.Windows.Forms.TextBox()
        Me.Label13 = New System.Windows.Forms.Label()
        Me.btn_send_command_status = New System.Windows.Forms.Button()
        Me.Panel1.SuspendLayout()
        Me.TabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.TabPage3.SuspendLayout()
        Me.SuspendLayout()
        '
        'Panel1
        '
        Me.Panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Panel1.Controls.Add(Me.btnSend)
        Me.Panel1.Controls.Add(Me.txtAnswer)
        Me.Panel1.Controls.Add(Me.txtCommand)
        Me.Panel1.Controls.Add(Me.Label4)
        Me.Panel1.Controls.Add(Me.Label3)
        Me.Panel1.Location = New System.Drawing.Point(9, 393)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(478, 111)
        Me.Panel1.TabIndex = 15
        Me.Panel1.Visible = False
        '
        'btnSend
        '
        Me.btnSend.Location = New System.Drawing.Point(387, 83)
        Me.btnSend.Name = "btnSend"
        Me.btnSend.Size = New System.Drawing.Size(86, 23)
        Me.btnSend.TabIndex = 1
        Me.btnSend.Text = "Enviar"
        Me.btnSend.UseVisualStyleBackColor = True
        '
        'txtAnswer
        '
        Me.txtAnswer.Location = New System.Drawing.Point(11, 57)
        Me.txtAnswer.Name = "txtAnswer"
        Me.txtAnswer.Size = New System.Drawing.Size(462, 20)
        Me.txtAnswer.TabIndex = 2
        Me.txtAnswer.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'txtCommand
        '
        Me.txtCommand.Location = New System.Drawing.Point(340, 17)
        Me.txtCommand.Name = "txtCommand"
        Me.txtCommand.Size = New System.Drawing.Size(133, 20)
        Me.txtCommand.TabIndex = 0
        Me.txtCommand.Text = "(&S)"
        Me.txtCommand.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(8, 41)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(52, 13)
        Me.Label4.TabIndex = 1
        Me.Label4.Text = "Resposta"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(8, 17)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(52, 13)
        Me.Label3.TabIndex = 0
        Me.Label3.Text = "Comando"
        '
        'ckConected
        '
        Me.ckConected.AutoSize = True
        Me.ckConected.Location = New System.Drawing.Point(61, 50)
        Me.ckConected.Name = "ckConected"
        Me.ckConected.Size = New System.Drawing.Size(78, 17)
        Me.ckConected.TabIndex = 14
        Me.ckConected.Text = "Conectado"
        Me.ckConected.UseVisualStyleBackColor = True
        '
        'btnDisconect
        '
        Me.btnDisconect.Location = New System.Drawing.Point(393, 46)
        Me.btnDisconect.Name = "btnDisconect"
        Me.btnDisconect.Size = New System.Drawing.Size(86, 23)
        Me.btnDisconect.TabIndex = 13
        Me.btnDisconect.Text = "Desconectar"
        Me.btnDisconect.UseVisualStyleBackColor = True
        '
        'btnConect
        '
        Me.btnConect.Location = New System.Drawing.Point(271, 46)
        Me.btnConect.Name = "btnConect"
        Me.btnConect.Size = New System.Drawing.Size(86, 23)
        Me.btnConect.TabIndex = 12
        Me.btnConect.Text = "Conectar"
        Me.btnConect.UseVisualStyleBackColor = True
        '
        'txtPort
        '
        Me.txtPort.Location = New System.Drawing.Point(346, 12)
        Me.txtPort.Name = "txtPort"
        Me.txtPort.Size = New System.Drawing.Size(133, 20)
        Me.txtPort.TabIndex = 10
        Me.txtPort.Text = "888"
        Me.txtPort.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'txtIp
        '
        Me.txtIp.Location = New System.Drawing.Point(47, 12)
        Me.txtIp.Name = "txtIp"
        Me.txtIp.Size = New System.Drawing.Size(133, 20)
        Me.txtIp.TabIndex = 8
        Me.txtIp.Text = "192.168.0.95"
        Me.txtIp.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(281, 15)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(32, 13)
        Me.Label2.TabIndex = 11
        Me.Label2.Text = "Porta"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(14, 15)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(17, 13)
        Me.Label1.TabIndex = 9
        Me.Label1.Text = "IP"
        '
        'TabControl1
        '
        Me.TabControl1.Controls.Add(Me.TabPage1)
        Me.TabControl1.Controls.Add(Me.TabPage2)
        Me.TabControl1.Controls.Add(Me.TabPage3)
        Me.TabControl1.Location = New System.Drawing.Point(5, 75)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(478, 312)
        Me.TabControl1.TabIndex = 16
        '
        'TabPage1
        '
        Me.TabPage1.Controls.Add(Me.Label11)
        Me.TabPage1.Controls.Add(Me.tb_command_to_send)
        Me.TabPage1.Controls.Add(Me.Label10)
        Me.TabPage1.Controls.Add(Me.tb_duration_seconds)
        Me.TabPage1.Controls.Add(Me.tb_ans_command_save_password)
        Me.TabPage1.Controls.Add(Me.Label9)
        Me.TabPage1.Controls.Add(Me.btn_send_command_save_password)
        Me.TabPage1.Controls.Add(Me.tb_times_of_activation)
        Me.TabPage1.Controls.Add(Me.Label8)
        Me.TabPage1.Controls.Add(Me.tb_shower)
        Me.TabPage1.Controls.Add(Me.Label7)
        Me.TabPage1.Controls.Add(Me.tb_duration_minutes)
        Me.TabPage1.Controls.Add(Me.Label6)
        Me.TabPage1.Controls.Add(Me.tb_password)
        Me.TabPage1.Controls.Add(Me.Label5)
        Me.TabPage1.Location = New System.Drawing.Point(4, 22)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(470, 286)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "Gravação de senha"
        Me.TabPage1.UseVisualStyleBackColor = True
        '
        'Label11
        '
        Me.Label11.AutoSize = True
        Me.Label11.Location = New System.Drawing.Point(8, 166)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(140, 13)
        Me.Label11.TabIndex = 15
        Me.Label11.Text = "Comando que será enviado:"
        '
        'tb_command_to_send
        '
        Me.tb_command_to_send.Location = New System.Drawing.Point(11, 191)
        Me.tb_command_to_send.Name = "tb_command_to_send"
        Me.tb_command_to_send.Size = New System.Drawing.Size(452, 20)
        Me.tb_command_to_send.TabIndex = 14
        Me.tb_command_to_send.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Label10
        '
        Me.Label10.AutoSize = True
        Me.Label10.Location = New System.Drawing.Point(8, 72)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(138, 13)
        Me.Label10.TabIndex = 13
        Me.Label10.Text = "Duração (ss - 2 caracteres):"
        '
        'tb_duration_seconds
        '
        Me.tb_duration_seconds.Location = New System.Drawing.Point(262, 69)
        Me.tb_duration_seconds.Name = "tb_duration_seconds"
        Me.tb_duration_seconds.Size = New System.Drawing.Size(202, 20)
        Me.tb_duration_seconds.TabIndex = 2
        Me.tb_duration_seconds.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'tb_ans_command_save_password
        '
        Me.tb_ans_command_save_password.Location = New System.Drawing.Point(262, 256)
        Me.tb_ans_command_save_password.Name = "tb_ans_command_save_password"
        Me.tb_ans_command_save_password.Size = New System.Drawing.Size(202, 20)
        Me.tb_ans_command_save_password.TabIndex = 11
        Me.tb_ans_command_save_password.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Location = New System.Drawing.Point(8, 259)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(55, 13)
        Me.Label9.TabIndex = 10
        Me.Label9.Text = "Resposta:"
        '
        'btn_send_command_save_password
        '
        Me.btn_send_command_save_password.Location = New System.Drawing.Point(378, 224)
        Me.btn_send_command_save_password.Name = "btn_send_command_save_password"
        Me.btn_send_command_save_password.Size = New System.Drawing.Size(86, 23)
        Me.btn_send_command_save_password.TabIndex = 5
        Me.btn_send_command_save_password.Text = "Enviar"
        Me.btn_send_command_save_password.UseVisualStyleBackColor = True
        '
        'tb_times_of_activation
        '
        Me.tb_times_of_activation.Location = New System.Drawing.Point(262, 131)
        Me.tb_times_of_activation.Name = "tb_times_of_activation"
        Me.tb_times_of_activation.Size = New System.Drawing.Size(202, 20)
        Me.tb_times_of_activation.TabIndex = 4
        Me.tb_times_of_activation.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Location = New System.Drawing.Point(8, 134)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(152, 13)
        Me.Label8.TabIndex = 8
        Me.Label8.Text = "Vezes (decimal - 2 caracteres):"
        '
        'tb_shower
        '
        Me.tb_shower.Location = New System.Drawing.Point(262, 99)
        Me.tb_shower.Name = "tb_shower"
        Me.tb_shower.Size = New System.Drawing.Size(202, 20)
        Me.tb_shower.TabIndex = 3
        Me.tb_shower.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Location = New System.Drawing.Point(8, 104)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(155, 13)
        Me.Label7.TabIndex = 6
        Me.Label7.Text = "Ducha (decimal - 2 caracteres):"
        '
        'tb_duration_minutes
        '
        Me.tb_duration_minutes.Location = New System.Drawing.Point(262, 40)
        Me.tb_duration_minutes.Name = "tb_duration_minutes"
        Me.tb_duration_minutes.Size = New System.Drawing.Size(202, 20)
        Me.tb_duration_minutes.TabIndex = 1
        Me.tb_duration_minutes.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(8, 43)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(144, 13)
        Me.Label6.TabIndex = 4
        Me.Label6.Text = "Duração (mm - 2 caracteres):"
        '
        'tb_password
        '
        Me.tb_password.Location = New System.Drawing.Point(262, 11)
        Me.tb_password.Name = "tb_password"
        Me.tb_password.Size = New System.Drawing.Size(202, 20)
        Me.tb_password.TabIndex = 0
        Me.tb_password.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(8, 14)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(109, 13)
        Me.Label5.TabIndex = 3
        Me.Label5.Text = "Senha (6 caracteres):"
        '
        'TabPage2
        '
        Me.TabPage2.Location = New System.Drawing.Point(4, 22)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(470, 286)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Gravação tag"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'TabPage3
        '
        Me.TabPage3.Controls.Add(Me.Label12)
        Me.TabPage3.Controls.Add(Me.tb_send_command_status)
        Me.TabPage3.Controls.Add(Me.tb_ans_command_status)
        Me.TabPage3.Controls.Add(Me.Label13)
        Me.TabPage3.Controls.Add(Me.btn_send_command_status)
        Me.TabPage3.Location = New System.Drawing.Point(4, 22)
        Me.TabPage3.Name = "TabPage3"
        Me.TabPage3.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage3.Size = New System.Drawing.Size(470, 286)
        Me.TabPage3.TabIndex = 2
        Me.TabPage3.Text = "Status"
        Me.TabPage3.UseVisualStyleBackColor = True
        '
        'Label12
        '
        Me.Label12.AutoSize = True
        Me.Label12.Location = New System.Drawing.Point(5, 8)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(140, 13)
        Me.Label12.TabIndex = 20
        Me.Label12.Text = "Comando que será enviado:"
        '
        'tb_send_command_status
        '
        Me.tb_send_command_status.Location = New System.Drawing.Point(8, 33)
        Me.tb_send_command_status.Name = "tb_send_command_status"
        Me.tb_send_command_status.ReadOnly = True
        Me.tb_send_command_status.Size = New System.Drawing.Size(452, 20)
        Me.tb_send_command_status.TabIndex = 19
        Me.tb_send_command_status.Text = "{X&7E}"
        Me.tb_send_command_status.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'tb_ans_command_status
        '
        Me.tb_ans_command_status.Location = New System.Drawing.Point(66, 98)
        Me.tb_ans_command_status.Name = "tb_ans_command_status"
        Me.tb_ans_command_status.Size = New System.Drawing.Size(395, 20)
        Me.tb_ans_command_status.TabIndex = 18
        Me.tb_ans_command_status.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Label13
        '
        Me.Label13.AutoSize = True
        Me.Label13.Location = New System.Drawing.Point(5, 101)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(55, 13)
        Me.Label13.TabIndex = 17
        Me.Label13.Text = "Resposta:"
        '
        'btn_send_command_status
        '
        Me.btn_send_command_status.Location = New System.Drawing.Point(375, 66)
        Me.btn_send_command_status.Name = "btn_send_command_status"
        Me.btn_send_command_status.Size = New System.Drawing.Size(86, 23)
        Me.btn_send_command_status.TabIndex = 16
        Me.btn_send_command_status.Text = "Enviar"
        Me.btn_send_command_status.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(487, 516)
        Me.Controls.Add(Me.TabControl1)
        Me.Controls.Add(Me.Panel1)
        Me.Controls.Add(Me.ckConected)
        Me.Controls.Add(Me.btnDisconect)
        Me.Controls.Add(Me.btnConect)
        Me.Controls.Add(Me.txtPort)
        Me.Controls.Add(Me.txtIp)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form1"
        Me.Text = "Comandos GDC"
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
        Me.TabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.TabPage1.PerformLayout()
        Me.TabPage3.ResumeLayout(False)
        Me.TabPage3.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Panel1 As Panel
    Friend WithEvents btnSend As Button
    Friend WithEvents txtAnswer As TextBox
    Friend WithEvents txtCommand As TextBox
    Friend WithEvents Label4 As Label
    Friend WithEvents Label3 As Label
    Friend WithEvents ckConected As CheckBox
    Friend WithEvents btnDisconect As Button
    Friend WithEvents btnConect As Button
    Friend WithEvents txtPort As TextBox
    Friend WithEvents txtIp As TextBox
    Friend WithEvents Label2 As Label
    Friend WithEvents Label1 As Label
    Friend WithEvents TabControl1 As TabControl
    Friend WithEvents TabPage1 As TabPage
    Friend WithEvents Label5 As Label
    Friend WithEvents TabPage2 As TabPage
    Friend WithEvents tb_times_of_activation As TextBox
    Friend WithEvents Label8 As Label
    Friend WithEvents tb_shower As TextBox
    Friend WithEvents Label7 As Label
    Friend WithEvents tb_duration_minutes As TextBox
    Friend WithEvents tb_password As TextBox
    Friend WithEvents tb_ans_command_save_password As TextBox
    Friend WithEvents Label9 As Label
    Friend WithEvents btn_send_command_save_password As Button
    Friend WithEvents Label10 As Label
    Friend WithEvents tb_duration_seconds As TextBox
    Friend WithEvents Label6 As Label
    Friend WithEvents tb_command_to_send As TextBox
    Friend WithEvents Label11 As Label
    Friend WithEvents TabPage3 As TabPage
    Friend WithEvents Label12 As Label
    Friend WithEvents tb_send_command_status As TextBox
    Friend WithEvents tb_ans_command_status As TextBox
    Friend WithEvents Label13 As Label
    Friend WithEvents btn_send_command_status As Button
End Class
