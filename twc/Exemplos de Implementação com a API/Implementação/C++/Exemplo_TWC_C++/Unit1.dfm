object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Aplica'#231#227'o Exemplo para TWC in C++ '#169' Cleber Peter'
  ClientHeight = 609
  ClientWidth = 1150
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 320
    Top = 8
    Width = 822
    Height = 537
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
    ColWidths = (
      64
      62
      632
      56
      45)
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 8
    Width = 289
    Height = 97
    Caption = 'Conex'#227'o'
    TabOrder = 1
    object Label1: TLabel
      Left = 7
      Top = 65
      Width = 26
      Height = 13
      Caption = 'Porta'
    end
    object Label2: TLabel
      Left = 7
      Top = 28
      Width = 10
      Height = 13
      Caption = 'Ip'
    end
    object Button1: TButton
      Left = 167
      Top = 25
      Width = 113
      Height = 58
      Caption = 'Conectar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object ComboBox2: TComboBox
      Left = 39
      Top = 62
      Width = 122
      Height = 21
      TabOrder = 1
      Text = '1771'
    end
    object Edit1: TEdit
      Left = 39
      Top = 25
      Width = 122
      Height = 21
      TabOrder = 2
      Text = '192.168.0.91'
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 226
    Width = 289
    Height = 183
    Caption = 'Abastecimento Frota'
    TabOrder = 2
    object L_F_Placa: TLabeledEdit
      Left = 8
      Top = 36
      Width = 129
      Height = 21
      EditLabel.Width = 25
      EditLabel.Height = 13
      EditLabel.Caption = 'Placa'
      TabOrder = 0
    end
    object L_F_Odo: TLabeledEdit
      Left = 152
      Top = 36
      Width = 128
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = 'Od'#244'metro'
      TabOrder = 1
    end
    object L_F_CPF: TLabeledEdit
      Left = 8
      Top = 92
      Width = 129
      Height = 21
      EditLabel.Width = 19
      EditLabel.Height = 13
      EditLabel.Caption = 'CPF'
      TabOrder = 2
    end
    object L_F_CardF: TLabeledEdit
      Left = 152
      Top = 92
      Width = 129
      Height = 21
      EditLabel.Width = 84
      EditLabel.Height = 13
      EditLabel.Caption = 'Card de Frentista'
      TabOrder = 3
    end
    object L_F_Bico: TLabeledEdit
      Left = 8
      Top = 150
      Width = 129
      Height = 21
      EditLabel.Width = 19
      EditLabel.Height = 13
      EditLabel.Caption = 'Bico'
      TabOrder = 4
    end
    object L_F_Óleo: TLabeledEdit
      Left = 152
      Top = 150
      Width = 128
      Height = 21
      EditLabel.Width = 67
      EditLabel.Height = 13
      EditLabel.Caption = 'Troca de '#211'leo'
      TabOrder = 5
    end
  end
  object GroupBox3: TGroupBox
    Left = 16
    Top = 424
    Width = 289
    Height = 180
    Caption = 'Abastecimento Cliente'
    TabOrder = 3
    object L_C_CardF: TLabeledEdit
      Left = 8
      Top = 36
      Width = 129
      Height = 21
      EditLabel.Width = 69
      EditLabel.Height = 13
      EditLabel.Caption = 'Card Frentista'
      TabOrder = 0
    end
    object L_C_Senha: TLabeledEdit
      Left = 160
      Top = 36
      Width = 121
      Height = 21
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = 'Senha'
      TabOrder = 1
    end
    object L_C_TagV: TLabeledEdit
      Left = 8
      Top = 92
      Width = 129
      Height = 21
      EditLabel.Width = 69
      EditLabel.Height = 13
      EditLabel.Caption = 'Tag do Ve'#237'culo'
      TabOrder = 2
    end
    object L_C_CardC: TLabeledEdit
      Left = 160
      Top = 92
      Width = 120
      Height = 21
      EditLabel.Width = 74
      EditLabel.Height = 13
      EditLabel.Caption = 'Card de Cliente'
      TabOrder = 3
    end
    object L_C_Bico: TLabeledEdit
      Left = 8
      Top = 150
      Width = 129
      Height = 21
      EditLabel.Width = 19
      EditLabel.Height = 13
      EditLabel.Caption = 'Bico'
      TabOrder = 4
    end
    object L_C_Value: TLabeledEdit
      Left = 160
      Top = 150
      Width = 120
      Height = 21
      EditLabel.Width = 85
      EditLabel.Height = 13
      EditLabel.Caption = 'Valor '#224' Abastecer'
      TabOrder = 5
    end
  end
  object B_T_Paused: TButton
    Left = 320
    Top = 558
    Width = 409
    Height = 46
    Caption = 'Parar'
    TabOrder = 4
    OnClick = B_T_PausedClick
  end
  object B_T_Clean: TButton
    Left = 735
    Top = 558
    Width = 407
    Height = 46
    Caption = 'Limpar'
    TabOrder = 5
    OnClick = B_T_CleanClick
  end
  object GroupBox4: TGroupBox
    Left = 16
    Top = 114
    Width = 289
    Height = 105
    Caption = 'Configura'#231#227'o'
    TabOrder = 6
    object Label3: TLabel
      Left = 7
      Top = 21
      Width = 77
      Height = 13
      Caption = 'Vers'#227'o do Menu'
    end
    object Label4: TLabel
      Left = 7
      Top = 48
      Width = 68
      Height = 13
      Caption = 'Timeout de Tx'
    end
    object Label5: TLabel
      Left = 7
      Top = 75
      Width = 69
      Height = 13
      Caption = 'Timeout de Rx'
    end
    object Label6: TLabel
      Left = 162
      Top = 53
      Width = 13
      Height = 13
      Caption = 'ms'
    end
    object Label7: TLabel
      Left = 162
      Top = 80
      Width = 13
      Height = 13
      Caption = 'ms'
    end
    object E_C_Versao: TEdit
      Left = 92
      Top = 18
      Width = 98
      Height = 21
      TabOrder = 0
      Text = '2.0'
    end
    object Button2: TButton
      Left = 200
      Top = 17
      Width = 81
      Height = 79
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object E_TCPOUTTX: TEdit
      Left = 92
      Top = 45
      Width = 64
      Height = 21
      TabOrder = 2
      Text = '3'
    end
    object E_TCPOUTRX: TEdit
      Left = 92
      Top = 72
      Width = 64
      Height = 21
      TabOrder = 3
      Text = '50'
    end
  end
  object T_Task: TTimer
    Interval = 1
    OnTimer = T_TaskTimer
    Left = 720
    Top = 16
  end
end
