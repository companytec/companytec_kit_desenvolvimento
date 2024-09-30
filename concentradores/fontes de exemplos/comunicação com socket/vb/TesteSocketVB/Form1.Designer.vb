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
        Me.Panel1.SuspendLayout()
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
        Me.Panel1.Location = New System.Drawing.Point(5, 79)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(478, 111)
        Me.Panel1.TabIndex = 15
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
        Me.txtPort.Text = "2001"
        Me.txtPort.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'txtIp
        '
        Me.txtIp.Location = New System.Drawing.Point(47, 12)
        Me.txtIp.Name = "txtIp"
        Me.txtIp.Size = New System.Drawing.Size(133, 20)
        Me.txtIp.TabIndex = 8
        Me.txtIp.Text = "192.168.0.74"
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
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(487, 194)
        Me.Controls.Add(Me.Panel1)
        Me.Controls.Add(Me.ckConected)
        Me.Controls.Add(Me.btnDisconect)
        Me.Controls.Add(Me.btnConect)
        Me.Controls.Add(Me.txtPort)
        Me.Controls.Add(Me.txtIp)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
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
End Class
