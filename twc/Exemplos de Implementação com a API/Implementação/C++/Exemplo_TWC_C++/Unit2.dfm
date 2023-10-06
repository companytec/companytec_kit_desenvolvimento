object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 441
  Width = 699
  object MySQLConnection: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    GetDriverFunc = 'getSQLDriverMYSQL'
    LibraryName = 'dbxmys.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'HostName=127.0.0.1'
      'Database=Control_Prod'
      'User_Name=root'
      'Password=mocoto,21'
      'ServerCharSet='
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'ConnectTimeout=60')
    VendorLib = 'libmysql.dll'
    Connected = True
    Left = 16
    Top = 16
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from  colaboradores')
    SQLConnection = MySQLConnection
    Left = 96
    Top = 16
    object SQLQuery1Id: TIntegerField
      FieldName = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object SQLQuery1Nome: TStringField
      FieldName = 'Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 45
    end
    object SQLQuery1CodCartao: TStringField
      FieldName = 'CodCartao'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 16
    end
    object SQLQuery1Nivel: TStringField
      FieldName = 'Nivel'
      Required = True
      Size = 1
    end
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'Id'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProvider1'
    Left = 264
    Top = 16
    object ClientDataSet1Id: TIntegerField
      FieldName = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object ClientDataSet1Nome: TStringField
      FieldName = 'Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 45
    end
    object ClientDataSet1CodCartao: TStringField
      FieldName = 'CodCartao'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 16
    end
    object ClientDataSet1Nivel: TStringField
      FieldName = 'Nivel'
      Required = True
      Size = 1
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLQuery1
    UpdateMode = upWhereKeyOnly
    OnGetTableName = DataSetProvider1GetTableName
    Left = 176
    Top = 16
  end
  object SQLQuery2: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'create table tbteste(cod_teste integer not null primary key,nome' +
        '_teste varchar(40))')
    SQLConnection = MySQLConnection
    Left = 16
    Top = 72
    object IntegerField1: TIntegerField
      FieldName = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object StringField1: TStringField
      FieldName = 'Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 45
    end
    object StringField2: TStringField
      FieldName = 'CodCartao'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 16
    end
    object StringField3: TStringField
      FieldName = 'Nivel'
      Required = True
      Size = 1
    end
  end
end
