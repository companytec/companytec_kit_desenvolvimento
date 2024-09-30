object Form1: TForm1
  Left = 239
  Top = 289
  Width = 1135
  Height = 477
  Caption = 'C_DLLExample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox9: TGroupBox
    Left = 896
    Top = 72
    Width = 177
    Height = 105
    Caption = 'DATA+ HORA'
    TabOrder = 14
  end
  object GroupBox5: TGroupBox
    Left = 712
    Top = 8
    Width = 169
    Height = 129
    Caption = 'Altera'#231#227'o do Pre'#231'o Unit'#225'rio'
    TabOrder = 6
    object Label5: TLabel
      Left = 16
      Top = 16
      Width = 24
      Height = 13
      Caption = 'Bico:'
    end
    object Label6: TLabel
      Left = 16
      Top = 56
      Width = 27
      Height = 13
      Caption = 'Valor:'
    end
  end
  object GroupBox3: TGroupBox
    Left = 344
    Top = 8
    Width = 153
    Height = 129
    Caption = 'Pr'#233'-Set'
    TabOrder = 4
    object Label1: TLabel
      Left = 2
      Top = 15
      Width = 149
      Height = 13
      Align = alTop
      Caption = 'Bico:'
    end
    object Label2: TLabel
      Left = 6
      Top = 56
      Width = 27
      Height = 13
      Caption = 'Valor:'
    end
    object Edit3: TEdit
      Left = 8
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Button5: TButton
      Left = 8
      Top = 96
      Width = 121
      Height = 25
      Caption = 'PreSet Valor'
      TabOrder = 1
      OnClick = Button5Click
    end
    object Edit2: TEdit
      Left = 8
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 184
    Top = 8
    Width = 145
    Height = 129
    Caption = 'Leitura'
    TabOrder = 3
    object Button3: TButton
      Left = 8
      Top = 24
      Width = 121
      Height = 25
      Caption = 'L'#234' Abastecimento'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 8
      Top = 64
      Width = 121
      Height = 25
      Caption = 'Incremento'
      TabOrder = 1
      OnClick = Button4Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 8
    Width = 145
    Height = 129
    Caption = 'Conex'#227'o'
    TabOrder = 2
    object Edit7: TEdit
      Left = 8
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 0
    end
  end
  object ListBox1: TListBox
    Left = 24
    Top = 144
    Width = 857
    Height = 289
    ItemHeight = 13
    TabOrder = 0
  end
  object Button1: TButton
    Left = 32
    Top = 88
    Width = 121
    Height = 25
    Caption = 'Conectar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object GroupBox4: TGroupBox
    Left = 512
    Top = 8
    Width = 185
    Height = 129
    Caption = 'Comando Modo'
    TabOrder = 5
    object Label4: TLabel
      Left = 2
      Top = 15
      Width = 24
      Height = 13
      Caption = 'Bico:'
    end
    object Label3: TLabel
      Left = 0
      Top = 56
      Width = 30
      Height = 13
      Caption = 'Modo:'
    end
    object Button9: TButton
      Left = 16
      Top = 104
      Width = 145
      Height = 17
      Caption = 'Enviar Comando'
      TabOrder = 0
      OnClick = Button9Click
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 72
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
    object Edit4: TEdit
      Left = 16
      Top = 32
      Width = 145
      Height = 21
      TabOrder = 2
    end
  end
  object Edit5: TEdit
    Left = 736
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object Edit6: TEdit
    Left = 736
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object Button2: TButton
    Left = 736
    Top = 104
    Width = 121
    Height = 25
    Caption = 'Altera Pre'#231'o'
    TabOrder = 9
    OnClick = Button2Click
  end
  object GroupBox6: TGroupBox
    Left = 896
    Top = 176
    Width = 177
    Height = 129
    Caption = 'Encerrante Valor'
    TabOrder = 10
    object Label7: TLabel
      Left = 8
      Top = 16
      Width = 24
      Height = 13
      Caption = 'Bico:'
    end
    object Edit1: TEdit
      Left = 24
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Button6: TButton
      Left = 24
      Top = 64
      Width = 121
      Height = 25
      Caption = 'Consulta Encerrante '
      TabOrder = 1
      OnClick = Button6Click
    end
  end
  object GroupBox7: TGroupBox
    Left = 896
    Top = 328
    Width = 177
    Height = 105
    Caption = 'Encerrante Volume'
    TabOrder = 11
    object Edit8: TEdit
      Left = 24
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Button8: TButton
      Left = 24
      Top = 64
      Width = 121
      Height = 25
      Caption = 'Consulta Encerrante'
      TabOrder = 1
      OnClick = Button8Click
    end
  end
  object GroupBox8: TGroupBox
    Left = 896
    Top = 8
    Width = 177
    Height = 65
    Caption = 'STATUS'
    TabOrder = 12
    object Button7: TButton
      Left = 24
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Leitura Status'
      TabOrder = 0
      OnClick = Button7Click
    end
  end
  object Button10: TButton
    Left = 928
    Top = 112
    Width = 105
    Height = 25
    Caption = 'L'#234' calend'#225'rio'
    TabOrder = 13
    OnClick = Button10Click
  end
end
