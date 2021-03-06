object DM: TDM
  OldCreateOrder = False
  Height = 948
  Width = 1333
  object banco: TIBDatabase
    Connected = True
    DatabaseName = 
      'C:\Users\Program\Desktop\Projeto Delphi 2020\db_eletrica\TIBAGI.' +
      'FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1252')
    LoginPrompt = False
    DefaultTransaction = trans
    ServerType = 'IBServer'
    Left = 8
  end
  object dsetpais: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PAIS'
      'where'
      '  ID_PAIS = :OLD_ID_PAIS')
    InsertSQL.Strings = (
      'insert into PAIS'
      '  (PAIS, DDI, SIGLA, DATA_CADASTRO, ULTIMA_ALTERACAO)'
      'values'
      '  (:PAIS, :DDI, :SIGLA, :DATA_CADASTRO, :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PAIS,'
      '  PAIS,'
      '  DDI,'
      '  SIGLA,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from PAIS '
      'where'
      '  ID_PAIS = :ID_PAIS')
    SelectSQL.Strings = (
      'select * from PAIS')
    ModifySQL.Strings = (
      'update PAIS'
      'set'
      '  PAIS = :PAIS,'
      '  DDI = :DDI,'
      '  SIGLA = :SIGLA,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_PAIS = :OLD_ID_PAIS')
    ParamCheck = True
    UniDirectional = False
    Left = 64
    object dsetpaisID_PAIS: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_PAIS'
      Origin = '"PAIS"."ID_PAIS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetpaisPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = '"PAIS"."PAIS"'
      Size = 60
    end
    object dsetpaisDDI: TIBStringField
      FieldName = 'DDI'
      Origin = '"PAIS"."DDI"'
      Size = 3
    end
    object dsetpaisSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = '"PAIS"."SIGLA"'
      Size = 3
    end
    object dsetpaisDATA_CADASTRO: TDateField
      DisplayLabel = 'DATA CADASTRO'
      FieldName = 'DATA_CADASTRO'
      Origin = '"PAIS"."DATA_CADASTRO"'
    end
    object dsetpaisULTIMA_ALTERACAO: TDateField
      DisplayLabel = 'ULT ALTERACAO'
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"PAIS"."ULTIMA_ALTERACAO"'
    end
  end
  object dsetestado: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ESTADO'
      'where'
      '  ID_ESTADO = :OLD_ID_ESTADO')
    InsertSQL.Strings = (
      'insert into ESTADO'
      '  (ESTADO, UF, ID_PAIS, DATA_CADASTRO, ULTIMA_ALTERACAO)'
      'values'
      '  (:ESTADO, :UF, :ID_PAIS, :DATA_CADASTRO, :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_ESTADO,'
      '  ESTADO,'
      '  UF,'
      '  ID_PAIS,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from ESTADO '
      'where'
      '  ID_ESTADO = :ID_ESTADO')
    SelectSQL.Strings = (
      'select * from ESTADO')
    ModifySQL.Strings = (
      'update ESTADO'
      'set'
      '  ESTADO = :ESTADO,'
      '  UF = :UF,'
      '  ID_PAIS = :ID_PAIS,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_ESTADO = :OLD_ID_ESTADO')
    ParamCheck = True
    UniDirectional = False
    Left = 64
    Top = 56
    object dsetestadoID_ESTADO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_ESTADO'
      Origin = '"ESTADO"."ID_ESTADO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetestadoESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = '"ESTADO"."ESTADO"'
      Size = 60
    end
    object dsetestadoUF: TIBStringField
      FieldName = 'UF'
      Origin = '"ESTADO"."UF"'
      Size = 2
    end
    object dsetestadoID_PAIS: TIntegerField
      DisplayLabel = 'ID PAIS'
      FieldName = 'ID_PAIS'
      Origin = '"ESTADO"."ID_PAIS"'
    end
    object dsetestadoDATA_CADASTRO: TDateField
      DisplayLabel = 'DATA CADASTRO'
      FieldName = 'DATA_CADASTRO'
      Origin = '"ESTADO"."DATA_CADASTRO"'
    end
    object dsetestadoULTIMA_ALTERACAO: TDateField
      DisplayLabel = 'ULT ALTERACAO'
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"ESTADO"."ULTIMA_ALTERACAO"'
    end
  end
  object dspais: TDataSource
    DataSet = dsetpais
    Left = 167
  end
  object dsestado: TDataSource
    DataSet = dsetestado
    Left = 167
    Top = 56
  end
  object dscidade: TDataSource
    DataSet = view_cidade
    Left = 167
    Top = 112
  end
  object dsetmarca: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from MARCA'
      'where'
      '  ID_MARCA = :OLD_ID_MARCA')
    InsertSQL.Strings = (
      'insert into MARCA'
      '  (MARCA, DATA_CADASTRO, ULTIMA_ALTERACAO)'
      'values'
      '  (:MARCA, :DATA_CADASTRO, :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_MARCA,'
      '  MARCA,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from MARCA '
      'where'
      '  ID_MARCA = :ID_MARCA')
    SelectSQL.Strings = (
      'select * from MARCA')
    ModifySQL.Strings = (
      'update MARCA'
      'set'
      '  MARCA = :MARCA,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_MARCA = :OLD_ID_MARCA')
    ParamCheck = True
    UniDirectional = False
    Left = 64
    Top = 168
    object dsetmarcaID_MARCA: TIntegerField
      FieldName = 'ID_MARCA'
      Origin = '"MARCA"."ID_MARCA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetmarcaMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = '"MARCA"."MARCA"'
      Size = 25
    end
    object dsetmarcaDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"MARCA"."DATA_CADASTRO"'
    end
    object dsetmarcaULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"MARCA"."ULTIMA_ALTERACAO"'
    end
  end
  object dsmarca: TDataSource
    DataSet = dsetmarca
    Left = 167
    Top = 168
  end
  object dsmodelo: TDataSource
    DataSet = dsetmodelo
    Left = 167
    Top = 224
  end
  object dsveiculo: TDataSource
    DataSet = dsetveiculo
    Left = 167
    Top = 280
  end
  object dsfuncionario: TDataSource
    DataSet = dsetfuncionario
    Left = 167
    Top = 336
  end
  object dsetfuncionario: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from FUNCIONARIO'
      'where'
      '  ID_FUNCIONARIO = :OLD_ID_FUNCIONARIO')
    InsertSQL.Strings = (
      'insert into FUNCIONARIO'
      
        '  (NOME, CARGO, SEXO, TELEFONE, CELULAR, NASCIMENTO, EMAIL, COMI' +
        'SSAO, ENDERECO, '
      
        '   NUMERO, BAIRRO, ID_CIDADE, STATUS, CPF, DATA_CADASTRO, ULTIMA' +
        '_ALTERACAO)'
      'values'
      
        '  (:NOME, :CARGO, :SEXO, :TELEFONE, :CELULAR, :NASCIMENTO, :EMAI' +
        'L, :COMISSAO, '
      
        '   :ENDERECO, :NUMERO, :BAIRRO, :ID_CIDADE, :STATUS, :CPF, :DATA' +
        '_CADASTRO, '
      '   :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_FUNCIONARIO,'
      '  NOME,'
      '  CARGO,'
      '  SEXO,'
      '  TELEFONE,'
      '  CELULAR,'
      '  NASCIMENTO,'
      '  EMAIL,'
      '  COMISSAO,'
      '  ENDERECO,'
      '  NUMERO,'
      '  BAIRRO,'
      '  ID_CIDADE,'
      '  STATUS,'
      '  CPF,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from FUNCIONARIO '
      'where'
      '  ID_FUNCIONARIO = :ID_FUNCIONARIO')
    SelectSQL.Strings = (
      'select * from FUNCIONARIO')
    ModifySQL.Strings = (
      'update FUNCIONARIO'
      'set'
      '  NOME = :NOME,'
      '  CARGO = :CARGO,'
      '  SEXO = :SEXO,'
      '  TELEFONE = :TELEFONE,'
      '  CELULAR = :CELULAR,'
      '  NASCIMENTO = :NASCIMENTO,'
      '  EMAIL = :EMAIL,'
      '  COMISSAO = :COMISSAO,'
      '  ENDERECO = :ENDERECO,'
      '  NUMERO = :NUMERO,'
      '  BAIRRO = :BAIRRO,'
      '  ID_CIDADE = :ID_CIDADE,'
      '  STATUS = :STATUS,'
      '  CPF = :CPF,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_FUNCIONARIO = :OLD_ID_FUNCIONARIO')
    ParamCheck = True
    UniDirectional = False
    Left = 64
    Top = 336
    object dsetfuncionarioID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Origin = '"FUNCIONARIO"."ID_FUNCIONARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetfuncionarioNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"FUNCIONARIO"."NOME"'
      Size = 45
    end
    object dsetfuncionarioCARGO: TIBStringField
      FieldName = 'CARGO'
      Origin = '"FUNCIONARIO"."CARGO"'
      Size = 25
    end
    object dsetfuncionarioSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = '"FUNCIONARIO"."SEXO"'
      FixedChar = True
      Size = 1
    end
    object dsetfuncionarioTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = '"FUNCIONARIO"."TELEFONE"'
      Size = 11
    end
    object dsetfuncionarioCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = '"FUNCIONARIO"."CELULAR"'
      Size = 12
    end
    object dsetfuncionarioNASCIMENTO: TDateField
      FieldName = 'NASCIMENTO'
      Origin = '"FUNCIONARIO"."NASCIMENTO"'
    end
    object dsetfuncionarioEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"FUNCIONARIO"."EMAIL"'
      Size = 30
    end
    object dsetfuncionarioCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      Origin = '"FUNCIONARIO"."COMISSAO"'
    end
    object dsetfuncionarioENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = '"FUNCIONARIO"."ENDERECO"'
      Size = 85
    end
    object dsetfuncionarioNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"FUNCIONARIO"."NUMERO"'
    end
    object dsetfuncionarioBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = '"FUNCIONARIO"."BAIRRO"'
      Size = 40
    end
    object dsetfuncionarioID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = '"FUNCIONARIO"."ID_CIDADE"'
    end
    object dsetfuncionarioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = '"FUNCIONARIO"."STATUS"'
      FixedChar = True
      Size = 1
    end
    object dsetfuncionarioCPF: TIBStringField
      FieldName = 'CPF'
      Origin = '"FUNCIONARIO"."CPF"'
      Size = 13
    end
    object dsetfuncionarioDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"FUNCIONARIO"."DATA_CADASTRO"'
    end
    object dsetfuncionarioULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"FUNCIONARIO"."ULTIMA_ALTERACAO"'
    end
  end
  object dscliente: TDataSource
    DataSet = dsetcliente
    Left = 167
    Top = 448
  end
  object dsetusuario: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from USUARIO'
      'where'
      '  ID_USUARIO = :OLD_ID_USUARIO')
    InsertSQL.Strings = (
      'insert into USUARIO'
      
        '  (NOME, USUARIO, SENHA, PERMISSAO, ID_FUNCIONARIO, STATUS, DATA' +
        '_CADASTRO, '
      '   ULTIMA_ALTERACAO, ID_ALTEROU)'
      'values'
      
        '  (:NOME, :USUARIO, :SENHA, :PERMISSAO, :ID_FUNCIONARIO, :STATUS' +
        ', :DATA_CADASTRO, '
      '   :ULTIMA_ALTERACAO, :ID_ALTEROU)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_USUARIO,'
      '  NOME,'
      '  USUARIO,'
      '  SENHA,'
      '  PERMISSAO,'
      '  ID_FUNCIONARIO,'
      '  STATUS,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO,'
      '  ID_ALTEROU'
      'from USUARIO '
      'where'
      '  ID_USUARIO = :ID_USUARIO')
    SelectSQL.Strings = (
      'select * from USUARIO')
    ModifySQL.Strings = (
      'update USUARIO'
      'set'
      '  NOME = :NOME,'
      '  USUARIO = :USUARIO,'
      '  SENHA = :SENHA,'
      '  PERMISSAO = :PERMISSAO,'
      '  ID_FUNCIONARIO = :ID_FUNCIONARIO,'
      '  STATUS = :STATUS,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO,'
      '  ID_ALTEROU = :ID_ALTEROU'
      'where'
      '  ID_USUARIO = :OLD_ID_USUARIO')
    ParamCheck = True
    UniDirectional = False
    Left = 64
    Top = 504
    object dsetusuarioID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = '"USUARIO"."ID_USUARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetusuarioNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"USUARIO"."NOME"'
      Size = 45
    end
    object dsetusuarioUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"USUARIO"."USUARIO"'
      Size = 30
    end
    object dsetusuarioSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = '"USUARIO"."SENHA"'
      Size = 8
    end
    object dsetusuarioPERMISSAO: TIBStringField
      FieldName = 'PERMISSAO'
      Origin = '"USUARIO"."PERMISSAO"'
      Size = 12
    end
    object dsetusuarioID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Origin = '"USUARIO"."ID_FUNCIONARIO"'
    end
    object dsetusuarioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = '"USUARIO"."STATUS"'
      FixedChar = True
      Size = 1
    end
    object dsetusuarioDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"USUARIO"."DATA_CADASTRO"'
    end
    object dsetusuarioULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"USUARIO"."ULTIMA_ALTERACAO"'
    end
    object dsetusuarioID_ALTEROU: TIntegerField
      FieldName = 'ID_ALTEROU'
      Origin = '"USUARIO"."ID_ALTEROU"'
    end
  end
  object dsusuario: TDataSource
    DataSet = dsetusuario
    Left = 167
    Top = 504
  end
  object dsetmodelo: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from MODELO'
      'where'
      '  ID_MODELO = :OLD_ID_MODELO')
    InsertSQL.Strings = (
      'insert into MODELO'
      '  (MODELO, ID_MARCA, DATA_CADASTRO, ULTIMA_ALTERACAO)'
      'values'
      '  (:MODELO, :ID_MARCA, :DATA_CADASTRO, :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_MODELO,'
      '  MODELO,'
      '  ID_MARCA,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from MODELO '
      'where'
      '  ID_MODELO = :ID_MODELO')
    SelectSQL.Strings = (
      'select * from MODELO')
    ModifySQL.Strings = (
      'update MODELO'
      'set'
      '  MODELO = :MODELO,'
      '  ID_MARCA = :ID_MARCA,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_MODELO = :OLD_ID_MODELO')
    ParamCheck = True
    UniDirectional = False
    Left = 64
    Top = 224
    object dsetmodeloID_MODELO: TIntegerField
      FieldName = 'ID_MODELO'
      Origin = '"MODELO"."ID_MODELO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetmodeloMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = '"MODELO"."MODELO"'
      Size = 30
    end
    object dsetmodeloID_MARCA: TIntegerField
      FieldName = 'ID_MARCA'
      Origin = '"MODELO"."ID_MARCA"'
    end
    object dsetmodeloDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"MODELO"."DATA_CADASTRO"'
    end
    object dsetmodeloULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"MODELO"."ULTIMA_ALTERACAO"'
    end
  end
  object dsetfabricante: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from FABRICANTE'
      'where'
      '  ID_FABRICANTE = :OLD_ID_FABRICANTE')
    InsertSQL.Strings = (
      'insert into FABRICANTE'
      '  (FABRICANTE, CNPJ, DATA_CADASTRO, ULTIMA_ALTERACAO)'
      'values'
      '  (:FABRICANTE, :CNPJ, :DATA_CADASTRO, :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_FABRICANTE,'
      '  FABRICANTE,'
      '  CNPJ,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from FABRICANTE '
      'where'
      '  ID_FABRICANTE = :ID_FABRICANTE')
    SelectSQL.Strings = (
      'select * from FABRICANTE')
    ModifySQL.Strings = (
      'update FABRICANTE'
      'set'
      '  FABRICANTE = :FABRICANTE,'
      '  CNPJ = :CNPJ,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_FABRICANTE = :OLD_ID_FABRICANTE')
    ParamCheck = True
    UniDirectional = False
    Left = 64
    Top = 560
    object dsetfabricanteID_FABRICANTE: TIntegerField
      FieldName = 'ID_FABRICANTE'
      Origin = '"FABRICANTE"."ID_FABRICANTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetfabricanteFABRICANTE: TIBStringField
      FieldName = 'FABRICANTE'
      Origin = '"FABRICANTE"."FABRICANTE"'
      Size = 55
    end
    object dsetfabricanteCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = '"FABRICANTE"."CNPJ"'
      Size = 18
    end
    object dsetfabricanteDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"FABRICANTE"."DATA_CADASTRO"'
    end
    object dsetfabricanteULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"FABRICANTE"."ULTIMA_ALTERACAO"'
    end
  end
  object dsfabricante: TDataSource
    DataSet = dsetfabricante
    Left = 159
    Top = 560
  end
  object dsformapagamento: TDataSource
    DataSet = dsetformapag
    Left = 167
    Top = 392
  end
  object dsetformapag: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from FORMA_PAGAMENTO'
      'where'
      '  ID_FORMAPAGAMENTO = :OLD_ID_FORMAPAGAMENTO')
    InsertSQL.Strings = (
      'insert into FORMA_PAGAMENTO'
      '  (FORMA_PAGAMENTO, DATA_CADASTRO, ULTIMA_ALTERACAO)'
      'values'
      '  (:FORMA_PAGAMENTO, :DATA_CADASTRO, :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_FORMAPAGAMENTO,'
      '  FORMA_PAGAMENTO,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from FORMA_PAGAMENTO '
      'where'
      '  ID_FORMAPAGAMENTO = :ID_FORMAPAGAMENTO')
    SelectSQL.Strings = (
      'select * from FORMA_PAGAMENTO')
    ModifySQL.Strings = (
      'update FORMA_PAGAMENTO'
      'set'
      '  FORMA_PAGAMENTO = :FORMA_PAGAMENTO,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_FORMAPAGAMENTO = :OLD_ID_FORMAPAGAMENTO')
    ParamCheck = True
    UniDirectional = False
    Left = 64
    Top = 392
    object dsetformapagID_FORMAPAGAMENTO: TIntegerField
      FieldName = 'ID_FORMAPAGAMENTO'
      Origin = '"FORMA_PAGAMENTO"."ID_FORMAPAGAMENTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetformapagFORMA_PAGAMENTO: TIBStringField
      FieldName = 'FORMA_PAGAMENTO'
      Origin = '"FORMA_PAGAMENTO"."FORMA_PAGAMENTO"'
      Size = 25
    end
    object dsetformapagDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"FORMA_PAGAMENTO"."DATA_CADASTRO"'
    end
    object dsetformapagULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"FORMA_PAGAMENTO"."ULTIMA_ALTERACAO"'
    end
  end
  object dsetgrupo: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  ID_GRUPO = :OLD_ID_GRUPO')
    InsertSQL.Strings = (
      'insert into GRUPO'
      '  (GRUPO, DATA_CADASTRO, ULTIMA_ALTERACAO)'
      'values'
      '  (:GRUPO, :DATA_CADASTRO, :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_GRUPO,'
      '  GRUPO,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from GRUPO '
      'where'
      '  ID_GRUPO = :ID_GRUPO')
    SelectSQL.Strings = (
      'select * from GRUPO')
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  GRUPO = :GRUPO,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_GRUPO = :OLD_ID_GRUPO')
    ParamCheck = True
    UniDirectional = False
    Left = 272
    Top = 112
    object dsetgrupoID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
      Origin = '"GRUPO"."ID_GRUPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetgrupoGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Origin = '"GRUPO"."GRUPO"'
      Size = 40
    end
    object dsetgrupoDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"GRUPO"."DATA_CADASTRO"'
    end
    object dsetgrupoULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"GRUPO"."ULTIMA_ALTERACAO"'
    end
  end
  object dsgrupo: TDataSource
    DataSet = dsetgrupo
    Left = 351
    Top = 112
  end
  object dscor: TDataSource
    DataSet = dsetcor
    Left = 159
    Top = 680
  end
  object dsetcor: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from COR'
      'where'
      '  ID_COR = :OLD_ID_COR')
    InsertSQL.Strings = (
      'insert into COR'
      '  (COR, DATA_CADASTRO, ULTIMA_ALTERACAO)'
      'values'
      '  (:COR, :DATA_CADASTRO, :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_COR,'
      '  COR,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from COR '
      'where'
      '  ID_COR = :ID_COR')
    SelectSQL.Strings = (
      'select * from COR')
    ModifySQL.Strings = (
      'update COR'
      'set'
      '  COR = :COR,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_COR = :OLD_ID_COR')
    ParamCheck = True
    UniDirectional = False
    Left = 64
    Top = 680
    object dsetcorID_COR: TIntegerField
      FieldName = 'ID_COR'
      Origin = '"COR"."ID_COR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetcorCOR: TIBStringField
      FieldName = 'COR'
      Origin = '"COR"."COR"'
    end
    object dsetcorDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"COR"."DATA_CADASTRO"'
    end
    object dsetcorULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"COR"."ULTIMA_ALTERACAO"'
    end
  end
  object dscombustivel: TDataSource
    DataSet = dsetcombustivel
    Left = 351
    Top = 176
  end
  object dsetcombustivel: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from COMBUSTIVEL'
      'where'
      '  ID_COMBUSTIVEL = :OLD_ID_COMBUSTIVEL')
    InsertSQL.Strings = (
      'insert into COMBUSTIVEL'
      '  (COMBUSTIVEL, DATA_CADASTRO, ULTIMA_ALTERACAO)'
      'values'
      '  (:COMBUSTIVEL, :DATA_CADASTRO, :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_COMBUSTIVEL,'
      '  COMBUSTIVEL,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from COMBUSTIVEL '
      'where'
      '  ID_COMBUSTIVEL = :ID_COMBUSTIVEL')
    SelectSQL.Strings = (
      'select * from COMBUSTIVEL')
    ModifySQL.Strings = (
      'update COMBUSTIVEL'
      'set'
      '  COMBUSTIVEL = :COMBUSTIVEL,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_COMBUSTIVEL = :OLD_ID_COMBUSTIVEL')
    ParamCheck = True
    UniDirectional = False
    Left = 272
    Top = 176
    object dsetcombustivelID_COMBUSTIVEL: TIntegerField
      FieldName = 'ID_COMBUSTIVEL'
      Origin = '"COMBUSTIVEL"."ID_COMBUSTIVEL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetcombustivelCOMBUSTIVEL: TIBStringField
      FieldName = 'COMBUSTIVEL'
      Origin = '"COMBUSTIVEL"."COMBUSTIVEL"'
      Size = 40
    end
    object dsetcombustivelDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"COMBUSTIVEL"."DATA_CADASTRO"'
    end
    object dsetcombustivelULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"COMBUSTIVEL"."ULTIMA_ALTERACAO"'
    end
  end
  object view_cidade: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      'Select '
      '  ID_CIDADE,'
      '  CIDADE01,'
      '  DDD,'
      '  ID_ESTADO,'
      '  ESTADO01,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from DADOS_CIDADE '
      'where'
      '  ID_CIDADE = :ID_CIDADE')
    SelectSQL.Strings = (
      'select * from DADOS_CIDADE')
    ParamCheck = True
    UniDirectional = False
    Left = 272
    Top = 240
    object view_cidadeID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = '"DADOS_CIDADE"."ID_CIDADE"'
    end
    object view_cidadeCIDADE01: TIBStringField
      FieldName = 'CIDADE01'
      Origin = '"DADOS_CIDADE"."CIDADE01"'
      Size = 60
    end
    object view_cidadeDDD: TIBStringField
      FieldName = 'DDD'
      Origin = '"DADOS_CIDADE"."DDD"'
      Size = 3
    end
    object view_cidadeID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = '"DADOS_CIDADE"."ID_ESTADO"'
    end
    object view_cidadeESTADO01: TIBStringField
      FieldName = 'ESTADO01'
      Origin = '"DADOS_CIDADE"."ESTADO01"'
      Size = 60
    end
    object view_cidadeDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"DADOS_CIDADE"."DATA_CADASTRO"'
    end
    object view_cidadeULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"DADOS_CIDADE"."ULTIMA_ALTERACAO"'
    end
  end
  object dsetcidade: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CIDADE'
      'where'
      '  ID_CIDADE = :OLD_ID_CIDADE')
    InsertSQL.Strings = (
      'insert into CIDADE'
      '  (CIDADE, DDD, ID_ESTADO, DATA_CADASTRO, ULTIMA_ALTERACAO)'
      'values'
      '  (:CIDADE, :DDD, :ID_ESTADO, :DATA_CADASTRO, :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_CIDADE,'
      '  CIDADE,'
      '  DDD,'
      '  ID_ESTADO,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from CIDADE '
      'where'
      '  ID_CIDADE = :ID_CIDADE')
    SelectSQL.Strings = (
      'select * from CIDADE')
    ModifySQL.Strings = (
      'update CIDADE'
      'set'
      '  CIDADE = :CIDADE,'
      '  DDD = :DDD,'
      '  ID_ESTADO = :ID_ESTADO,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_CIDADE = :OLD_ID_CIDADE')
    ParamCheck = True
    UniDirectional = False
    Left = 64
    Top = 112
    object dsetcidadeID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = '"CIDADE"."ID_CIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetcidadeCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = '"CIDADE"."CIDADE"'
      Size = 60
    end
    object dsetcidadeDDD: TIBStringField
      FieldName = 'DDD'
      Origin = '"CIDADE"."DDD"'
      Size = 3
    end
    object dsetcidadeID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = '"CIDADE"."ID_ESTADO"'
    end
    object dsetcidadeDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"CIDADE"."DATA_CADASTRO"'
    end
    object dsetcidadeULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"CIDADE"."ULTIMA_ALTERACAO"'
    end
  end
  object dsfornecedor: TDataSource
    DataSet = dsetfornecedor
    Left = 350
  end
  object dsetproduto: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PRODUTO'
      'where'
      '  ID_PRODUTO = :OLD_ID_PRODUTO')
    InsertSQL.Strings = (
      'insert into PRODUTO'
      
        '  (PRODUTO, COD_BARRAS, ID_FABRICANTE, ID_FORNECEDOR, STATUS, MA' +
        'RGEM, UND, '
      
        '   ESTOQUE, TIPO_PRODUTO, ID_GRUPO, OBS_PRODUTO, DATA_CADASTRO, ' +
        'ULTIMA_ALTERACAO, '
      '   PRECO_COMPRA, PRECO_VENDA, CUSTO_PRODUTO)'
      'values'
      
        '  (:PRODUTO, :COD_BARRAS, :ID_FABRICANTE, :ID_FORNECEDOR, :STATU' +
        'S, :MARGEM, '
      
        '   :UND, :ESTOQUE, :TIPO_PRODUTO, :ID_GRUPO, :OBS_PRODUTO, :DATA' +
        '_CADASTRO, '
      
        '   :ULTIMA_ALTERACAO, :PRECO_COMPRA, :PRECO_VENDA, :CUSTO_PRODUT' +
        'O)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PRODUTO,'
      '  PRODUTO,'
      '  COD_BARRAS,'
      '  ID_FABRICANTE,'
      '  ID_FORNECEDOR,'
      '  STATUS,'
      '  MARGEM,'
      '  UND,'
      '  ESTOQUE,'
      '  TIPO_PRODUTO,'
      '  ID_GRUPO,'
      '  OBS_PRODUTO,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO,'
      '  PRECO_COMPRA,'
      '  PRECO_VENDA,'
      '  CUSTO_PRODUTO'
      'from PRODUTO '
      'where'
      '  ID_PRODUTO = :ID_PRODUTO')
    SelectSQL.Strings = (
      'select * from PRODUTO')
    ModifySQL.Strings = (
      'update PRODUTO'
      'set'
      '  PRODUTO = :PRODUTO,'
      '  COD_BARRAS = :COD_BARRAS,'
      '  ID_FABRICANTE = :ID_FABRICANTE,'
      '  ID_FORNECEDOR = :ID_FORNECEDOR,'
      '  STATUS = :STATUS,'
      '  MARGEM = :MARGEM,'
      '  UND = :UND,'
      '  ESTOQUE = :ESTOQUE,'
      '  TIPO_PRODUTO = :TIPO_PRODUTO,'
      '  ID_GRUPO = :ID_GRUPO,'
      '  OBS_PRODUTO = :OBS_PRODUTO,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO,'
      '  PRECO_COMPRA = :PRECO_COMPRA,'
      '  PRECO_VENDA = :PRECO_VENDA,'
      '  CUSTO_PRODUTO = :CUSTO_PRODUTO'
      'where'
      '  ID_PRODUTO = :OLD_ID_PRODUTO')
    ParamCheck = True
    UniDirectional = False
    Left = 272
    Top = 296
    object dsetprodutoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = '"PRODUTO"."ID_PRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetprodutoPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      Origin = '"PRODUTO"."PRODUTO"'
      Size = 70
    end
    object dsetprodutoCOD_BARRAS: TIBStringField
      FieldName = 'COD_BARRAS'
      Origin = '"PRODUTO"."COD_BARRAS"'
      Size = 22
    end
    object dsetprodutoID_FABRICANTE: TIntegerField
      FieldName = 'ID_FABRICANTE'
      Origin = '"PRODUTO"."ID_FABRICANTE"'
    end
    object dsetprodutoID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = '"PRODUTO"."ID_FORNECEDOR"'
    end
    object dsetprodutoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = '"PRODUTO"."STATUS"'
      FixedChar = True
      Size = 1
    end
    object dsetprodutoMARGEM: TFloatField
      FieldName = 'MARGEM'
      Origin = '"PRODUTO"."MARGEM"'
    end
    object dsetprodutoUND: TIBStringField
      FieldName = 'UND'
      Origin = '"PRODUTO"."UND"'
      Size = 10
    end
    object dsetprodutoESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      Origin = '"PRODUTO"."ESTOQUE"'
    end
    object dsetprodutoTIPO_PRODUTO: TIBStringField
      FieldName = 'TIPO_PRODUTO'
      Origin = '"PRODUTO"."TIPO_PRODUTO"'
      Size = 10
    end
    object dsetprodutoID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
      Origin = '"PRODUTO"."ID_GRUPO"'
    end
    object dsetprodutoOBS_PRODUTO: TIBStringField
      FieldName = 'OBS_PRODUTO'
      Origin = '"PRODUTO"."OBS_PRODUTO"'
      Size = 200
    end
    object dsetprodutoDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"PRODUTO"."DATA_CADASTRO"'
    end
    object dsetprodutoULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"PRODUTO"."ULTIMA_ALTERACAO"'
    end
    object dsetprodutoPRECO_COMPRA: TIBBCDField
      FieldName = 'PRECO_COMPRA'
      Origin = '"PRODUTO"."PRECO_COMPRA"'
      Precision = 18
      Size = 2
    end
    object dsetprodutoPRECO_VENDA: TIBBCDField
      FieldName = 'PRECO_VENDA'
      Origin = '"PRODUTO"."PRECO_VENDA"'
      Precision = 18
      Size = 2
    end
    object dsetprodutoCUSTO_PRODUTO: TIBBCDField
      FieldName = 'CUSTO_PRODUTO'
      Origin = '"PRODUTO"."CUSTO_PRODUTO"'
      Precision = 18
      Size = 2
    end
  end
  object dsproduto: TDataSource
    DataSet = dsetproduto
    Left = 352
    Top = 296
  end
  object trans: TIBTransaction
    DefaultDatabase = banco
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 115
  end
  object dsetparcela: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PARCELA'
      'where'
      '  NUM_PARCELA = :OLD_NUM_PARCELA and'
      '  ID_CONDICAO = :OLD_ID_CONDICAO')
    InsertSQL.Strings = (
      'insert into PARCELA'
      
        '  (DIAS_PRAZO, ID_FORMAPAGAMENTO, PERCENTUAL, DATA_CADASTRO, DAT' +
        'A_ALTERACAO, '
      '   NUM_PARCELA, ID_CONDICAO)'
      'values'
      
        '  (:DIAS_PRAZO, :ID_FORMAPAGAMENTO, :PERCENTUAL, :DATA_CADASTRO,' +
        ' :DATA_ALTERACAO, '
      '   :NUM_PARCELA, :ID_CONDICAO)')
    RefreshSQL.Strings = (
      'Select '
      '  DIAS_PRAZO,'
      '  ID_FORMAPAGAMENTO,'
      '  PERCENTUAL,'
      '  DATA_CADASTRO,'
      '  DATA_ALTERACAO,'
      '  NUM_PARCELA,'
      '  ID_CONDICAO'
      'from PARCELA '
      'where'
      '  NUM_PARCELA = :NUM_PARCELA and'
      '  ID_CONDICAO = :ID_CONDICAO')
    SelectSQL.Strings = (
      'select * from PARCELA')
    ModifySQL.Strings = (
      'update PARCELA'
      'set'
      '  DIAS_PRAZO = :DIAS_PRAZO,'
      '  ID_FORMAPAGAMENTO = :ID_FORMAPAGAMENTO,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  DATA_ALTERACAO = :DATA_ALTERACAO,'
      '  NUM_PARCELA = :NUM_PARCELA,'
      '  ID_CONDICAO = :ID_CONDICAO'
      'where'
      '  NUM_PARCELA = :OLD_NUM_PARCELA and'
      '  ID_CONDICAO = :OLD_ID_CONDICAO')
    ParamCheck = True
    UniDirectional = False
    Left = 272
    Top = 56
    object dsetparcelaDIAS_PRAZO: TIntegerField
      FieldName = 'DIAS_PRAZO'
      Origin = '"PARCELA"."DIAS_PRAZO"'
    end
    object dsetparcelaID_FORMAPAGAMENTO: TIntegerField
      FieldName = 'ID_FORMAPAGAMENTO'
      Origin = '"PARCELA"."ID_FORMAPAGAMENTO"'
    end
    object dsetparcelaPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      Origin = '"PARCELA"."PERCENTUAL"'
    end
    object dsetparcelaDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"PARCELA"."DATA_CADASTRO"'
    end
    object dsetparcelaDATA_ALTERACAO: TDateField
      FieldName = 'DATA_ALTERACAO'
      Origin = '"PARCELA"."DATA_ALTERACAO"'
    end
    object dsetparcelaNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
      Origin = '"PARCELA"."NUM_PARCELA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetparcelaID_CONDICAO: TIntegerField
      FieldName = 'ID_CONDICAO'
      Origin = '"PARCELA"."ID_CONDICAO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsparcela: TDataSource
    DataSet = dsetparcela
    Left = 350
    Top = 56
  end
  object dscompra: TDataSource
    DataSet = dsetcompra
    Left = 352
    Top = 352
  end
  object dsetcompra: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from COMPRA'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA and'
      '  ID_FORNECEDOR = :OLD_ID_FORNECEDOR and'
      '  SERIE = :OLD_SERIE and'
      '  MODELO = :OLD_MODELO')
    InsertSQL.Strings = (
      'insert into COMPRA'
      
        '  (NUMERO_NOTA, STATUS, DATA_ENTRADA, DATA_EMISSAO, ID_FORNECEDO' +
        'R, ID_CONDICAO, '
      
        '   DATA_CANCELAMENTO, OUTRAS_DESPESAS, TOTAL_PRODUTOS, TOTAL_COM' +
        'PRA, SEGURO, '
      '   VALOR_FRETE, TOTAL_DESCONTO, SERIE, MODELO)'
      'values'
      
        '  (:NUMERO_NOTA, :STATUS, :DATA_ENTRADA, :DATA_EMISSAO, :ID_FORN' +
        'ECEDOR, '
      
        '   :ID_CONDICAO, :DATA_CANCELAMENTO, :OUTRAS_DESPESAS, :TOTAL_PR' +
        'ODUTOS, '
      
        '   :TOTAL_COMPRA, :SEGURO, :VALOR_FRETE, :TOTAL_DESCONTO, :SERIE' +
        ', :MODELO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_NOTA,'
      '  STATUS,'
      '  DATA_ENTRADA,'
      '  DATA_EMISSAO,'
      '  ID_FORNECEDOR,'
      '  ID_CONDICAO,'
      '  DATA_CANCELAMENTO,'
      '  OUTRAS_DESPESAS,'
      '  TOTAL_PRODUTOS,'
      '  TOTAL_COMPRA,'
      '  SEGURO,'
      '  VALOR_FRETE,'
      '  TOTAL_DESCONTO,'
      '  SERIE,'
      '  MODELO'
      'from COMPRA '
      'where'
      '  NUMERO_NOTA = :NUMERO_NOTA and'
      '  ID_FORNECEDOR = :ID_FORNECEDOR and'
      '  SERIE = :SERIE and'
      '  MODELO = :MODELO')
    SelectSQL.Strings = (
      'select * from COMPRA')
    ModifySQL.Strings = (
      'update COMPRA'
      'set'
      '  NUMERO_NOTA = :NUMERO_NOTA,'
      '  STATUS = :STATUS,'
      '  DATA_ENTRADA = :DATA_ENTRADA,'
      '  DATA_EMISSAO = :DATA_EMISSAO,'
      '  ID_FORNECEDOR = :ID_FORNECEDOR,'
      '  ID_CONDICAO = :ID_CONDICAO,'
      '  DATA_CANCELAMENTO = :DATA_CANCELAMENTO,'
      '  OUTRAS_DESPESAS = :OUTRAS_DESPESAS,'
      '  TOTAL_PRODUTOS = :TOTAL_PRODUTOS,'
      '  TOTAL_COMPRA = :TOTAL_COMPRA,'
      '  SEGURO = :SEGURO,'
      '  VALOR_FRETE = :VALOR_FRETE,'
      '  TOTAL_DESCONTO = :TOTAL_DESCONTO,'
      '  SERIE = :SERIE,'
      '  MODELO = :MODELO'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA and'
      '  ID_FORNECEDOR = :OLD_ID_FORNECEDOR and'
      '  SERIE = :OLD_SERIE and'
      '  MODELO = :OLD_MODELO')
    ParamCheck = True
    UniDirectional = False
    Left = 272
    Top = 352
    object dsetcompraNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = '"COMPRA"."NUMERO_NOTA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetcompraSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = '"COMPRA"."STATUS"'
      Size = 10
    end
    object dsetcompraDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      Origin = '"COMPRA"."DATA_ENTRADA"'
    end
    object dsetcompraDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = '"COMPRA"."DATA_EMISSAO"'
    end
    object dsetcompraID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = '"COMPRA"."ID_FORNECEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetcompraID_CONDICAO: TIntegerField
      FieldName = 'ID_CONDICAO'
      Origin = '"COMPRA"."ID_CONDICAO"'
    end
    object dsetcompraDATA_CANCELAMENTO: TDateField
      FieldName = 'DATA_CANCELAMENTO'
      Origin = '"COMPRA"."DATA_CANCELAMENTO"'
    end
    object dsetcompraOUTRAS_DESPESAS: TIBBCDField
      FieldName = 'OUTRAS_DESPESAS'
      Origin = '"COMPRA"."OUTRAS_DESPESAS"'
      Precision = 18
      Size = 2
    end
    object dsetcompraTOTAL_PRODUTOS: TIBBCDField
      FieldName = 'TOTAL_PRODUTOS'
      Origin = '"COMPRA"."TOTAL_PRODUTOS"'
      Precision = 18
      Size = 2
    end
    object dsetcompraTOTAL_COMPRA: TIBBCDField
      FieldName = 'TOTAL_COMPRA'
      Origin = '"COMPRA"."TOTAL_COMPRA"'
      Precision = 18
      Size = 2
    end
    object dsetcompraSEGURO: TIBBCDField
      FieldName = 'SEGURO'
      Origin = '"COMPRA"."SEGURO"'
      Precision = 18
      Size = 2
    end
    object dsetcompraVALOR_FRETE: TIBBCDField
      FieldName = 'VALOR_FRETE'
      Origin = '"COMPRA"."VALOR_FRETE"'
      Precision = 18
      Size = 2
    end
    object dsetcompraTOTAL_DESCONTO: TIBBCDField
      FieldName = 'TOTAL_DESCONTO'
      Origin = '"COMPRA"."TOTAL_DESCONTO"'
      Precision = 18
      Size = 2
    end
    object dsetcompraSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = '"COMPRA"."SERIE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object dsetcompraMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = '"COMPRA"."MODELO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
  end
  object dscontaspagar: TDataSource
    DataSet = dsetcontaspagar
    Left = 350
    Top = 408
  end
  object dsetcontaspagar: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CONTAS_PAGAR'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA and'
      '  SERIE = :OLD_SERIE and'
      '  MODELO = :OLD_MODELO and'
      '  ID_FORNECEDOR = :OLD_ID_FORNECEDOR and'
      '  NUMERO_PARCELA = :OLD_NUMERO_PARCELA')
    InsertSQL.Strings = (
      'insert into CONTAS_PAGAR'
      
        '  (NUMERO_NOTA, SERIE, MODELO, ID_FORNECEDOR, DATA_EMISSAO, NUME' +
        'RO_PARCELA, '
      
        '   VALOR_PARCELA, DATA_VENCIMENTO, DATA_PAGAMENTO, JUROS, MULTA,' +
        ' VALOR_PAGO, '
      
        '   ID_FORMAPAGAMENTO, DATA_CADASTRO, ULTIMA_ALTERACAO, ID_USUARI' +
        'O, DESCONTO)'
      'values'
      
        '  (:NUMERO_NOTA, :SERIE, :MODELO, :ID_FORNECEDOR, :DATA_EMISSAO,' +
        ' :NUMERO_PARCELA, '
      
        '   :VALOR_PARCELA, :DATA_VENCIMENTO, :DATA_PAGAMENTO, :JUROS, :M' +
        'ULTA, :VALOR_PAGO, '
      
        '   :ID_FORMAPAGAMENTO, :DATA_CADASTRO, :ULTIMA_ALTERACAO, :ID_US' +
        'UARIO, '
      '   :DESCONTO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_NOTA,'
      '  SERIE,'
      '  MODELO,'
      '  ID_FORNECEDOR,'
      '  DATA_EMISSAO,'
      '  NUMERO_PARCELA,'
      '  VALOR_PARCELA,'
      '  DATA_VENCIMENTO,'
      '  DATA_PAGAMENTO,'
      '  JUROS,'
      '  MULTA,'
      '  VALOR_PAGO,'
      '  ID_FORMAPAGAMENTO,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO,'
      '  ID_USUARIO,'
      '  DESCONTO'
      'from CONTAS_PAGAR '
      'where'
      '  NUMERO_NOTA = :NUMERO_NOTA and'
      '  SERIE = :SERIE and'
      '  MODELO = :MODELO and'
      '  ID_FORNECEDOR = :ID_FORNECEDOR and'
      '  NUMERO_PARCELA = :NUMERO_PARCELA')
    SelectSQL.Strings = (
      'select * from CONTAS_PAGAR')
    ModifySQL.Strings = (
      'update CONTAS_PAGAR'
      'set'
      '  NUMERO_NOTA = :NUMERO_NOTA,'
      '  SERIE = :SERIE,'
      '  MODELO = :MODELO,'
      '  ID_FORNECEDOR = :ID_FORNECEDOR,'
      '  DATA_EMISSAO = :DATA_EMISSAO,'
      '  NUMERO_PARCELA = :NUMERO_PARCELA,'
      '  VALOR_PARCELA = :VALOR_PARCELA,'
      '  DATA_VENCIMENTO = :DATA_VENCIMENTO,'
      '  DATA_PAGAMENTO = :DATA_PAGAMENTO,'
      '  JUROS = :JUROS,'
      '  MULTA = :MULTA,'
      '  VALOR_PAGO = :VALOR_PAGO,'
      '  ID_FORMAPAGAMENTO = :ID_FORMAPAGAMENTO,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO,'
      '  ID_USUARIO = :ID_USUARIO,'
      '  DESCONTO = :DESCONTO'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA and'
      '  SERIE = :OLD_SERIE and'
      '  MODELO = :OLD_MODELO and'
      '  ID_FORNECEDOR = :OLD_ID_FORNECEDOR and'
      '  NUMERO_PARCELA = :OLD_NUMERO_PARCELA')
    ParamCheck = True
    UniDirectional = False
    Left = 264
    Top = 408
    object dsetcontaspagarNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = '"CONTAS_PAGAR"."NUMERO_NOTA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetcontaspagarSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = '"CONTAS_PAGAR"."SERIE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dsetcontaspagarMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = '"CONTAS_PAGAR"."MODELO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dsetcontaspagarID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = '"CONTAS_PAGAR"."ID_FORNECEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetcontaspagarDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = '"CONTAS_PAGAR"."DATA_EMISSAO"'
    end
    object dsetcontaspagarNUMERO_PARCELA: TIntegerField
      FieldName = 'NUMERO_PARCELA'
      Origin = '"CONTAS_PAGAR"."NUMERO_PARCELA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetcontaspagarVALOR_PARCELA: TIBBCDField
      FieldName = 'VALOR_PARCELA'
      Origin = '"CONTAS_PAGAR"."VALOR_PARCELA"'
      Precision = 18
      Size = 2
    end
    object dsetcontaspagarDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
      Origin = '"CONTAS_PAGAR"."DATA_VENCIMENTO"'
    end
    object dsetcontaspagarDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
      Origin = '"CONTAS_PAGAR"."DATA_PAGAMENTO"'
    end
    object dsetcontaspagarJUROS: TFloatField
      FieldName = 'JUROS'
      Origin = '"CONTAS_PAGAR"."JUROS"'
    end
    object dsetcontaspagarMULTA: TIBBCDField
      FieldName = 'MULTA'
      Origin = '"CONTAS_PAGAR"."MULTA"'
      Precision = 18
      Size = 2
    end
    object dsetcontaspagarVALOR_PAGO: TIBBCDField
      FieldName = 'VALOR_PAGO'
      Origin = '"CONTAS_PAGAR"."VALOR_PAGO"'
      Precision = 18
      Size = 2
    end
    object dsetcontaspagarID_FORMAPAGAMENTO: TIntegerField
      FieldName = 'ID_FORMAPAGAMENTO'
      Origin = '"CONTAS_PAGAR"."ID_FORMAPAGAMENTO"'
    end
    object dsetcontaspagarDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"CONTAS_PAGAR"."DATA_CADASTRO"'
    end
    object dsetcontaspagarULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"CONTAS_PAGAR"."ULTIMA_ALTERACAO"'
    end
    object dsetcontaspagarID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = '"CONTAS_PAGAR"."ID_USUARIO"'
    end
    object dsetcontaspagarDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = '"CONTAS_PAGAR"."DESCONTO"'
      Precision = 18
      Size = 2
    end
  end
  object dsetitem_compra: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ITEM_COMPRA'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA and'
      '  SERIE = :OLD_SERIE and'
      '  MODELO = :OLD_MODELO and'
      '  ID_FORNECEDOR = :OLD_ID_FORNECEDOR and'
      '  ID_PRODUTO = :OLD_ID_PRODUTO')
    InsertSQL.Strings = (
      'insert into ITEM_COMPRA'
      
        '  (NUMERO_NOTA, SERIE, MODELO, ID_FORNECEDOR, ID_PRODUTO, QTD, V' +
        'ALOR_UNITARIO, '
      '   VALOR_TOTAL, DATA_CADASTRO, ULTIMA_ALTERACAO)'
      'values'
      
        '  (:NUMERO_NOTA, :SERIE, :MODELO, :ID_FORNECEDOR, :ID_PRODUTO, :' +
        'QTD, :VALOR_UNITARIO, '
      '   :VALOR_TOTAL, :DATA_CADASTRO, :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_NOTA,'
      '  SERIE,'
      '  MODELO,'
      '  ID_FORNECEDOR,'
      '  ID_PRODUTO,'
      '  QTD,'
      '  VALOR_UNITARIO,'
      '  VALOR_TOTAL,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from ITEM_COMPRA '
      'where'
      '  NUMERO_NOTA = :NUMERO_NOTA and'
      '  SERIE = :SERIE and'
      '  MODELO = :MODELO and'
      '  ID_FORNECEDOR = :ID_FORNECEDOR and'
      '  ID_PRODUTO = :ID_PRODUTO')
    SelectSQL.Strings = (
      'select * from ITEM_COMPRA')
    ModifySQL.Strings = (
      'update ITEM_COMPRA'
      'set'
      '  NUMERO_NOTA = :NUMERO_NOTA,'
      '  SERIE = :SERIE,'
      '  MODELO = :MODELO,'
      '  ID_FORNECEDOR = :ID_FORNECEDOR,'
      '  ID_PRODUTO = :ID_PRODUTO,'
      '  QTD = :QTD,'
      '  VALOR_UNITARIO = :VALOR_UNITARIO,'
      '  VALOR_TOTAL = :VALOR_TOTAL,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA and'
      '  SERIE = :OLD_SERIE and'
      '  MODELO = :OLD_MODELO and'
      '  ID_FORNECEDOR = :OLD_ID_FORNECEDOR and'
      '  ID_PRODUTO = :OLD_ID_PRODUTO')
    ParamCheck = True
    UniDirectional = False
    Left = 264
    Top = 464
    object dsetitem_compraNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = '"ITEM_COMPRA"."NUMERO_NOTA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetitem_compraSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = '"ITEM_COMPRA"."SERIE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dsetitem_compraMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = '"ITEM_COMPRA"."MODELO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dsetitem_compraID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = '"ITEM_COMPRA"."ID_FORNECEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetitem_compraID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = '"ITEM_COMPRA"."ID_PRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetitem_compraQTD: TIntegerField
      FieldName = 'QTD'
      Origin = '"ITEM_COMPRA"."QTD"'
    end
    object dsetitem_compraVALOR_UNITARIO: TIBBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = '"ITEM_COMPRA"."VALOR_UNITARIO"'
      Precision = 18
      Size = 2
    end
    object dsetitem_compraVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"ITEM_COMPRA"."VALOR_TOTAL"'
      Precision = 18
      Size = 2
    end
    object dsetitem_compraDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"ITEM_COMPRA"."DATA_CADASTRO"'
    end
    object dsetitem_compraULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"ITEM_COMPRA"."ULTIMA_ALTERACAO"'
    end
  end
  object dsitem_compra: TDataSource
    DataSet = dsetitem_compra
    Left = 350
    Top = 464
  end
  object dsordemservico: TDataSource
    DataSet = dsetordemservico
    Left = 350
    Top = 520
  end
  object dsetservico: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from SERVICO'
      'where'
      '  ID_SERVICO = :OLD_ID_SERVICO')
    InsertSQL.Strings = (
      'insert into SERVICO'
      
        '  (DESCRICAO, CUSTO, PRECO_VENDA, OBS, DATA_CADASTRO, ULTIMA_ALT' +
        'ERACAO)'
      'values'
      
        '  (:DESCRICAO, :CUSTO, :PRECO_VENDA, :OBS, :DATA_CADASTRO, :ULTI' +
        'MA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_SERVICO,'
      '  DESCRICAO,'
      '  CUSTO,'
      '  PRECO_VENDA,'
      '  OBS,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from SERVICO '
      'where'
      '  ID_SERVICO = :ID_SERVICO')
    SelectSQL.Strings = (
      'select * from SERVICO')
    ModifySQL.Strings = (
      'update SERVICO'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  CUSTO = :CUSTO,'
      '  PRECO_VENDA = :PRECO_VENDA,'
      '  OBS = :OBS,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_SERVICO = :OLD_ID_SERVICO')
    ParamCheck = True
    UniDirectional = False
    Left = 264
    Top = 576
    object dsetservicoID_SERVICO: TIntegerField
      FieldName = 'ID_SERVICO'
      Origin = '"SERVICO"."ID_SERVICO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetservicoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"SERVICO"."DESCRICAO"'
      Size = 60
    end
    object dsetservicoCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"SERVICO"."CUSTO"'
      Precision = 18
      Size = 2
    end
    object dsetservicoPRECO_VENDA: TIBBCDField
      FieldName = 'PRECO_VENDA'
      Origin = '"SERVICO"."PRECO_VENDA"'
      Precision = 18
      Size = 2
    end
    object dsetservicoOBS: TIBStringField
      FieldName = 'OBS'
      Origin = '"SERVICO"."OBS"'
      Size = 200
    end
    object dsetservicoDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"SERVICO"."DATA_CADASTRO"'
    end
    object dsetservicoULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"SERVICO"."ULTIMA_ALTERACAO"'
    end
  end
  object dsservico: TDataSource
    DataSet = dsetservico
    Left = 350
    Top = 576
  end
  object dsetveiculo: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from VEICULO'
      'where'
      '  ID_VEICULO = :OLD_ID_VEICULO and'
      '  ID_MODELO = :OLD_ID_MODELO and'
      '  CHASSI = :OLD_CHASSI and'
      '  PLACA = :OLD_PLACA and'
      '  ANO = :OLD_ANO and'
      '  QUILOMETRAGEM = :OLD_QUILOMETRAGEM and'
      '  ID_COMBUSTIVEL = :OLD_ID_COMBUSTIVEL and'
      '  ID_COR = :OLD_ID_COR and'
      '  DATA_CADASTRO = :OLD_DATA_CADASTRO and'
      '  ULTIMA_ALTERACAO = :OLD_ULTIMA_ALTERACAO')
    InsertSQL.Strings = (
      'insert into VEICULO'
      
        '  (ID_MODELO, CHASSI, PLACA, ANO, QUILOMETRAGEM, ID_COMBUSTIVEL,' +
        ' ID_COR, '
      '   DATA_CADASTRO, ULTIMA_ALTERACAO)'
      'values'
      
        '  (:ID_MODELO, :CHASSI, :PLACA, :ANO, :QUILOMETRAGEM, :ID_COMBUS' +
        'TIVEL, '
      '   :ID_COR, :DATA_CADASTRO, :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_VEICULO,'
      '  ID_MODELO,'
      '  CHASSI,'
      '  PLACA,'
      '  ANO,'
      '  QUILOMETRAGEM,'
      '  ID_COMBUSTIVEL,'
      '  ID_COR,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from VEICULO '
      'where'
      '  ID_VEICULO = :ID_VEICULO and'
      '  ID_MODELO = :ID_MODELO and'
      '  CHASSI = :CHASSI and'
      '  PLACA = :PLACA and'
      '  ANO = :ANO and'
      '  QUILOMETRAGEM = :QUILOMETRAGEM and'
      '  ID_COMBUSTIVEL = :ID_COMBUSTIVEL and'
      '  ID_COR = :ID_COR and'
      '  DATA_CADASTRO = :DATA_CADASTRO and'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO')
    SelectSQL.Strings = (
      'select * from VEICULO')
    ModifySQL.Strings = (
      'update VEICULO'
      'set'
      '  ID_MODELO = :ID_MODELO,'
      '  CHASSI = :CHASSI,'
      '  PLACA = :PLACA,'
      '  ANO = :ANO,'
      '  QUILOMETRAGEM = :QUILOMETRAGEM,'
      '  ID_COMBUSTIVEL = :ID_COMBUSTIVEL,'
      '  ID_COR = :ID_COR,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_VEICULO = :OLD_ID_VEICULO and'
      '  ID_MODELO = :OLD_ID_MODELO and'
      '  CHASSI = :OLD_CHASSI and'
      '  PLACA = :OLD_PLACA and'
      '  ANO = :OLD_ANO and'
      '  QUILOMETRAGEM = :OLD_QUILOMETRAGEM and'
      '  ID_COMBUSTIVEL = :OLD_ID_COMBUSTIVEL and'
      '  ID_COR = :OLD_ID_COR and'
      '  DATA_CADASTRO = :OLD_DATA_CADASTRO and'
      '  ULTIMA_ALTERACAO = :OLD_ULTIMA_ALTERACAO')
    ParamCheck = True
    UniDirectional = False
    Left = 64
    Top = 280
    object dsetveiculoID_VEICULO: TIntegerField
      FieldName = 'ID_VEICULO'
      Origin = 'VEICULO.ID_VEICULO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetveiculoID_MODELO: TIntegerField
      FieldName = 'ID_MODELO'
      Origin = 'VEICULO.ID_MODELO'
    end
    object dsetveiculoCHASSI: TIBStringField
      FieldName = 'CHASSI'
      Origin = 'VEICULO.CHASSI'
      Size = 12
    end
    object dsetveiculoPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'VEICULO.PLACA'
      Size = 8
    end
    object dsetveiculoANO: TIBStringField
      FieldName = 'ANO'
      Origin = 'VEICULO.ANO'
      Size = 4
    end
    object dsetveiculoQUILOMETRAGEM: TLargeintField
      FieldName = 'QUILOMETRAGEM'
      Origin = 'VEICULO.QUILOMETRAGEM'
    end
    object dsetveiculoID_COMBUSTIVEL: TIntegerField
      FieldName = 'ID_COMBUSTIVEL'
      Origin = 'VEICULO.ID_COMBUSTIVEL'
    end
    object dsetveiculoID_COR: TIntegerField
      FieldName = 'ID_COR'
      Origin = 'VEICULO.ID_COR'
    end
    object dsetveiculoDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'VEICULO.DATA_CADASTRO'
    end
    object dsetveiculoULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = 'VEICULO.ULTIMA_ALTERACAO'
    end
  end
  object dsetcondicao: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CONDICAO'
      'where'
      '  ID_CONDICAO = :OLD_ID_CONDICAO')
    InsertSQL.Strings = (
      'insert into CONDICAO'
      
        '  (CONDICAO, JUROS, QTD_PARCELA, DATA_CADASTRO, ULTIMA_ALTERACAO' +
        ')'
      'values'
      
        '  (:CONDICAO, :JUROS, :QTD_PARCELA, :DATA_CADASTRO, :ULTIMA_ALTE' +
        'RACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_CONDICAO,'
      '  CONDICAO,'
      '  JUROS,'
      '  QTD_PARCELA,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from CONDICAO '
      'where'
      '  ID_CONDICAO = :ID_CONDICAO')
    SelectSQL.Strings = (
      'select * from CONDICAO')
    ModifySQL.Strings = (
      'update CONDICAO'
      'set'
      '  CONDICAO = :CONDICAO,'
      '  JUROS = :JUROS,'
      '  QTD_PARCELA = :QTD_PARCELA,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_CONDICAO = :OLD_ID_CONDICAO')
    ParamCheck = True
    UniDirectional = False
    GeneratorField.Field = 'ID_CONDICAO'
    GeneratorField.Generator = 'GEN_CONDICAO_ID'
    Left = 64
    Top = 616
    object dsetcondicaoID_CONDICAO: TIntegerField
      FieldName = 'ID_CONDICAO'
      Origin = '"CONDICAO"."ID_CONDICAO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetcondicaoCONDICAO: TIBStringField
      FieldName = 'CONDICAO'
      Origin = '"CONDICAO"."CONDICAO"'
      Size = 30
    end
    object dsetcondicaoJUROS: TFloatField
      FieldName = 'JUROS'
      Origin = '"CONDICAO"."JUROS"'
    end
    object dsetcondicaoQTD_PARCELA: TIntegerField
      FieldName = 'QTD_PARCELA'
      Origin = '"CONDICAO"."QTD_PARCELA"'
    end
    object dsetcondicaoDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"CONDICAO"."DATA_CADASTRO"'
    end
    object dsetcondicaoULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"CONDICAO"."ULTIMA_ALTERACAO"'
    end
  end
  object dscondicao: TDataSource
    DataSet = dsetcondicao
    Left = 159
    Top = 616
  end
  object dsetcontasreceber: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CONTAS_RECEBER'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA and'
      '  SERIE = :OLD_SERIE and'
      '  MODELO = :OLD_MODELO and'
      '  ID_CLIENTE = :OLD_ID_CLIENTE and'
      '  NUMERO_PARCELA = :OLD_NUMERO_PARCELA')
    InsertSQL.Strings = (
      'insert into CONTAS_RECEBER'
      
        '  (NUMERO_NOTA, SERIE, MODELO, ID_CLIENTE, DATA_EMISSAO, NUMERO_' +
        'PARCELA, '
      
        '   VALOR_PARCELA, DATA_VENCIMENTO, DATA_PAGAMENTO, JUROS, MULTA,' +
        ' VALOR_PAGO, '
      
        '   ID_FORMAPAGAMENTO, DATA_CADASTRO, ULTIMA_ALTERACAO, ID_USUARI' +
        'O, DESCONTO)'
      'values'
      
        '  (:NUMERO_NOTA, :SERIE, :MODELO, :ID_CLIENTE, :DATA_EMISSAO, :N' +
        'UMERO_PARCELA, '
      
        '   :VALOR_PARCELA, :DATA_VENCIMENTO, :DATA_PAGAMENTO, :JUROS, :M' +
        'ULTA, :VALOR_PAGO, '
      
        '   :ID_FORMAPAGAMENTO, :DATA_CADASTRO, :ULTIMA_ALTERACAO, :ID_US' +
        'UARIO, '
      '   :DESCONTO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_NOTA,'
      '  SERIE,'
      '  MODELO,'
      '  ID_CLIENTE,'
      '  DATA_EMISSAO,'
      '  NUMERO_PARCELA,'
      '  VALOR_PARCELA,'
      '  DATA_VENCIMENTO,'
      '  DATA_PAGAMENTO,'
      '  JUROS,'
      '  MULTA,'
      '  VALOR_PAGO,'
      '  ID_FORMAPAGAMENTO,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO,'
      '  ID_USUARIO,'
      '  DESCONTO'
      'from CONTAS_RECEBER '
      'where'
      '  NUMERO_NOTA = :NUMERO_NOTA and'
      '  SERIE = :SERIE and'
      '  MODELO = :MODELO and'
      '  ID_CLIENTE = :ID_CLIENTE and'
      '  NUMERO_PARCELA = :NUMERO_PARCELA')
    SelectSQL.Strings = (
      'select * from CONTAS_RECEBER')
    ModifySQL.Strings = (
      'update CONTAS_RECEBER'
      'set'
      '  NUMERO_NOTA = :NUMERO_NOTA,'
      '  SERIE = :SERIE,'
      '  MODELO = :MODELO,'
      '  ID_CLIENTE = :ID_CLIENTE,'
      '  DATA_EMISSAO = :DATA_EMISSAO,'
      '  NUMERO_PARCELA = :NUMERO_PARCELA,'
      '  VALOR_PARCELA = :VALOR_PARCELA,'
      '  DATA_VENCIMENTO = :DATA_VENCIMENTO,'
      '  DATA_PAGAMENTO = :DATA_PAGAMENTO,'
      '  JUROS = :JUROS,'
      '  MULTA = :MULTA,'
      '  VALOR_PAGO = :VALOR_PAGO,'
      '  ID_FORMAPAGAMENTO = :ID_FORMAPAGAMENTO,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO,'
      '  ID_USUARIO = :ID_USUARIO,'
      '  DESCONTO = :DESCONTO'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA and'
      '  SERIE = :OLD_SERIE and'
      '  MODELO = :OLD_MODELO and'
      '  ID_CLIENTE = :OLD_ID_CLIENTE and'
      '  NUMERO_PARCELA = :OLD_NUMERO_PARCELA')
    ParamCheck = True
    UniDirectional = False
    Left = 264
    Top = 632
    object dsetcontasreceberNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'CONTAS_RECEBER.NUMERO_NOTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetcontasreceberSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'CONTAS_RECEBER.SERIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dsetcontasreceberMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'CONTAS_RECEBER.MODELO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dsetcontasreceberID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'CONTAS_RECEBER.ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetcontasreceberDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'CONTAS_RECEBER.DATA_EMISSAO'
    end
    object dsetcontasreceberNUMERO_PARCELA: TIntegerField
      FieldName = 'NUMERO_PARCELA'
      Origin = 'CONTAS_RECEBER.NUMERO_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetcontasreceberVALOR_PARCELA: TIBBCDField
      FieldName = 'VALOR_PARCELA'
      Origin = 'CONTAS_RECEBER.VALOR_PARCELA'
      Precision = 18
      Size = 2
    end
    object dsetcontasreceberDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
      Origin = 'CONTAS_RECEBER.DATA_VENCIMENTO'
    end
    object dsetcontasreceberDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
      Origin = 'CONTAS_RECEBER.DATA_PAGAMENTO'
    end
    object dsetcontasreceberJUROS: TFloatField
      FieldName = 'JUROS'
      Origin = 'CONTAS_RECEBER.JUROS'
    end
    object dsetcontasreceberMULTA: TIBBCDField
      FieldName = 'MULTA'
      Origin = 'CONTAS_RECEBER.MULTA'
      Precision = 18
      Size = 2
    end
    object dsetcontasreceberVALOR_PAGO: TIBBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'CONTAS_RECEBER.VALOR_PAGO'
      Precision = 18
      Size = 2
    end
    object dsetcontasreceberID_FORMAPAGAMENTO: TIntegerField
      FieldName = 'ID_FORMAPAGAMENTO'
      Origin = 'CONTAS_RECEBER.ID_FORMAPAGAMENTO'
    end
    object dsetcontasreceberDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'CONTAS_RECEBER.DATA_CADASTRO'
    end
    object dsetcontasreceberULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = 'CONTAS_RECEBER.ULTIMA_ALTERACAO'
    end
    object dsetcontasreceberID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'CONTAS_RECEBER.ID_USUARIO'
    end
    object dsetcontasreceberDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = 'CONTAS_RECEBER.DESCONTO'
      Precision = 18
      Size = 2
    end
  end
  object dsetitem_venda: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ITEM_VENDA'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA and'
      '  SERIE = :OLD_SERIE and'
      '  MODELO = :OLD_MODELO and'
      '  ID_CLIENTE = :OLD_ID_CLIENTE and'
      '  ID_PRODUTO = :OLD_ID_PRODUTO')
    InsertSQL.Strings = (
      'insert into ITEM_VENDA'
      
        '  (NUMERO_NOTA, SERIE, MODELO, ID_CLIENTE, ID_PRODUTO, QTD, VALO' +
        'R_UNITARIO, '
      '   VALOR_TOTAL, DATA_CADASTRO, ULTIMA_ALTERACAO)'
      'values'
      
        '  (:NUMERO_NOTA, :SERIE, :MODELO, :ID_CLIENTE, :ID_PRODUTO, :QTD' +
        ', :VALOR_UNITARIO, '
      '   :VALOR_TOTAL, :DATA_CADASTRO, :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_NOTA,'
      '  SERIE,'
      '  MODELO,'
      '  ID_CLIENTE,'
      '  ID_PRODUTO,'
      '  QTD,'
      '  VALOR_UNITARIO,'
      '  VALOR_TOTAL,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from ITEM_VENDA '
      'where'
      '  NUMERO_NOTA = :NUMERO_NOTA and'
      '  SERIE = :SERIE and'
      '  MODELO = :MODELO and'
      '  ID_CLIENTE = :ID_CLIENTE and'
      '  ID_PRODUTO = :ID_PRODUTO')
    SelectSQL.Strings = (
      'select * from ITEM_VENDA')
    ModifySQL.Strings = (
      'update ITEM_VENDA'
      'set'
      '  NUMERO_NOTA = :NUMERO_NOTA,'
      '  SERIE = :SERIE,'
      '  MODELO = :MODELO,'
      '  ID_CLIENTE = :ID_CLIENTE,'
      '  ID_PRODUTO = :ID_PRODUTO,'
      '  QTD = :QTD,'
      '  VALOR_UNITARIO = :VALOR_UNITARIO,'
      '  VALOR_TOTAL = :VALOR_TOTAL,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA and'
      '  SERIE = :OLD_SERIE and'
      '  MODELO = :OLD_MODELO and'
      '  ID_CLIENTE = :OLD_ID_CLIENTE and'
      '  ID_PRODUTO = :OLD_ID_PRODUTO')
    ParamCheck = True
    UniDirectional = False
    Left = 264
    Top = 696
    object dsetitem_vendaNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'ITEM_VENDA.NUMERO_NOTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetitem_vendaSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'ITEM_VENDA.SERIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dsetitem_vendaMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'ITEM_VENDA.MODELO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dsetitem_vendaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ITEM_VENDA.ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetitem_vendaID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ITEM_VENDA.ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetitem_vendaQTD: TIntegerField
      FieldName = 'QTD'
      Origin = 'ITEM_VENDA.QTD'
    end
    object dsetitem_vendaVALOR_UNITARIO: TIBBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'ITEM_VENDA.VALOR_UNITARIO'
      Precision = 18
      Size = 2
    end
    object dsetitem_vendaVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'ITEM_VENDA.VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object dsetitem_vendaDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'ITEM_VENDA.DATA_CADASTRO'
    end
    object dsetitem_vendaULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = 'ITEM_VENDA.ULTIMA_ALTERACAO'
    end
  end
  object dscontasreceber: TDataSource
    DataSet = dsetcontasreceber
    Left = 352
    Top = 632
  end
  object dsitem_venda: TDataSource
    DataSet = dsetitem_venda
    Left = 352
    Top = 696
  end
  object dsvenda_produto: TDataSource
    DataSet = dsetvenda_produto
    Left = 625
  end
  object dsetservico_venda: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from SERVICO_VENDA'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA and'
      '  SERIE = :OLD_SERIE and'
      '  MODELO = :OLD_MODELO and'
      '  ID_CLIENTE = :OLD_ID_CLIENTE and'
      '  ID_SERVICO = :OLD_ID_SERVICO')
    InsertSQL.Strings = (
      'insert into SERVICO_VENDA'
      
        '  (NUMERO_NOTA, SERIE, MODELO, ID_CLIENTE, ID_SERVICO, QTD, VALO' +
        'R_UNITARIO, '
      '   VALOR_TOTAL, VALOR_DESCONTO, PERC_DESCONTO)'
      'values'
      
        '  (:NUMERO_NOTA, :SERIE, :MODELO, :ID_CLIENTE, :ID_SERVICO, :QTD' +
        ', :VALOR_UNITARIO, '
      '   :VALOR_TOTAL, :VALOR_DESCONTO, :PERC_DESCONTO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_NOTA,'
      '  SERIE,'
      '  MODELO,'
      '  ID_CLIENTE,'
      '  ID_SERVICO,'
      '  QTD,'
      '  VALOR_UNITARIO,'
      '  VALOR_TOTAL,'
      '  VALOR_DESCONTO,'
      '  PERC_DESCONTO'
      'from SERVICO_VENDA '
      'where'
      '  NUMERO_NOTA = :NUMERO_NOTA and'
      '  SERIE = :SERIE and'
      '  MODELO = :MODELO and'
      '  ID_CLIENTE = :ID_CLIENTE and'
      '  ID_SERVICO = :ID_SERVICO')
    SelectSQL.Strings = (
      'select * from SERVICO_VENDA')
    ModifySQL.Strings = (
      'update SERVICO_VENDA'
      'set'
      '  NUMERO_NOTA = :NUMERO_NOTA,'
      '  SERIE = :SERIE,'
      '  MODELO = :MODELO,'
      '  ID_CLIENTE = :ID_CLIENTE,'
      '  ID_SERVICO = :ID_SERVICO,'
      '  QTD = :QTD,'
      '  VALOR_UNITARIO = :VALOR_UNITARIO,'
      '  VALOR_TOTAL = :VALOR_TOTAL,'
      '  VALOR_DESCONTO = :VALOR_DESCONTO,'
      '  PERC_DESCONTO = :PERC_DESCONTO'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA and'
      '  SERIE = :OLD_SERIE and'
      '  MODELO = :OLD_MODELO and'
      '  ID_CLIENTE = :OLD_ID_CLIENTE and'
      '  ID_SERVICO = :OLD_ID_SERVICO')
    ParamCheck = True
    UniDirectional = False
    Left = 488
    Top = 64
    object dsetservico_vendaNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = '"SERVICO_VENDA"."NUMERO_NOTA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetservico_vendaSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = '"SERVICO_VENDA"."SERIE"'
      Size = 10
    end
    object dsetservico_vendaMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = '"SERVICO_VENDA"."MODELO"'
      Size = 10
    end
    object dsetservico_vendaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = '"SERVICO_VENDA"."ID_CLIENTE"'
    end
    object dsetservico_vendaID_SERVICO: TIntegerField
      FieldName = 'ID_SERVICO'
      Origin = '"SERVICO_VENDA"."ID_SERVICO"'
    end
    object dsetservico_vendaQTD: TIntegerField
      FieldName = 'QTD'
      Origin = '"SERVICO_VENDA"."QTD"'
    end
    object dsetservico_vendaVALOR_UNITARIO: TIBBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = '"SERVICO_VENDA"."VALOR_UNITARIO"'
      Precision = 18
      Size = 2
    end
    object dsetservico_vendaVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"SERVICO_VENDA"."VALOR_TOTAL"'
      Precision = 18
      Size = 2
    end
    object dsetservico_vendaVALOR_DESCONTO: TIBBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = '"SERVICO_VENDA"."VALOR_DESCONTO"'
      Precision = 18
      Size = 2
    end
    object dsetservico_vendaPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
      Origin = '"SERVICO_VENDA"."PERC_DESCONTO"'
    end
  end
  object dsservico_venda: TDataSource
    DataSet = dsetservico_venda
    Left = 627
    Top = 64
  end
  object dsetproduto_ordemservico: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PRODUTO_ORDEMSERVICO'
      'where'
      '  NUMERO_OS = :OLD_NUMERO_OS and'
      '  ID_CLIENTE = :OLD_ID_CLIENTE and'
      '  ID_PRODUTO = :OLD_ID_PRODUTO')
    InsertSQL.Strings = (
      'insert into PRODUTO_ORDEMSERVICO'
      
        '  (NUMERO_OS, ID_CLIENTE, ID_PRODUTO, QTD, VALOR_UNITARIO, VALOR' +
        '_TOTAL, '
      
        '   VALOR_DESCONTO, PERC_DESCONTO, DATA_CADASTRO, ULTIMA_ALTERACA' +
        'O)'
      'values'
      
        '  (:NUMERO_OS, :ID_CLIENTE, :ID_PRODUTO, :QTD, :VALOR_UNITARIO, ' +
        ':VALOR_TOTAL, '
      
        '   :VALOR_DESCONTO, :PERC_DESCONTO, :DATA_CADASTRO, :ULTIMA_ALTE' +
        'RACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_OS,'
      '  ID_CLIENTE,'
      '  ID_PRODUTO,'
      '  QTD,'
      '  VALOR_UNITARIO,'
      '  VALOR_TOTAL,'
      '  VALOR_DESCONTO,'
      '  PERC_DESCONTO,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from PRODUTO_ORDEMSERVICO '
      'where'
      '  NUMERO_OS = :NUMERO_OS and'
      '  ID_CLIENTE = :ID_CLIENTE and'
      '  ID_PRODUTO = :ID_PRODUTO')
    SelectSQL.Strings = (
      'select * from PRODUTO_ORDEMSERVICO')
    ModifySQL.Strings = (
      'update PRODUTO_ORDEMSERVICO'
      'set'
      '  NUMERO_OS = :NUMERO_OS,'
      '  ID_CLIENTE = :ID_CLIENTE,'
      '  ID_PRODUTO = :ID_PRODUTO,'
      '  QTD = :QTD,'
      '  VALOR_UNITARIO = :VALOR_UNITARIO,'
      '  VALOR_TOTAL = :VALOR_TOTAL,'
      '  VALOR_DESCONTO = :VALOR_DESCONTO,'
      '  PERC_DESCONTO = :PERC_DESCONTO,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  NUMERO_OS = :OLD_NUMERO_OS and'
      '  ID_CLIENTE = :OLD_ID_CLIENTE and'
      '  ID_PRODUTO = :OLD_ID_PRODUTO')
    ParamCheck = True
    UniDirectional = False
    Left = 488
    Top = 120
    object dsetproduto_ordemservicoNUMERO_OS: TIntegerField
      FieldName = 'NUMERO_OS'
      Origin = '"PRODUTO_ORDEMSERVICO"."NUMERO_OS"'
      Required = True
    end
    object dsetproduto_ordemservicoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = '"PRODUTO_ORDEMSERVICO"."ID_CLIENTE"'
    end
    object dsetproduto_ordemservicoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = '"PRODUTO_ORDEMSERVICO"."ID_PRODUTO"'
    end
    object dsetproduto_ordemservicoQTD: TIntegerField
      FieldName = 'QTD'
      Origin = '"PRODUTO_ORDEMSERVICO"."QTD"'
    end
    object dsetproduto_ordemservicoVALOR_UNITARIO: TIBBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = '"PRODUTO_ORDEMSERVICO"."VALOR_UNITARIO"'
      Precision = 18
      Size = 2
    end
    object dsetproduto_ordemservicoVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"PRODUTO_ORDEMSERVICO"."VALOR_TOTAL"'
      Precision = 18
      Size = 2
    end
    object dsetproduto_ordemservicoVALOR_DESCONTO: TIBBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = '"PRODUTO_ORDEMSERVICO"."VALOR_DESCONTO"'
      Precision = 18
      Size = 2
    end
    object dsetproduto_ordemservicoPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
      Origin = '"PRODUTO_ORDEMSERVICO"."PERC_DESCONTO"'
    end
    object dsetproduto_ordemservicoDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"PRODUTO_ORDEMSERVICO"."DATA_CADASTRO"'
    end
    object dsetproduto_ordemservicoULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"PRODUTO_ORDEMSERVICO"."ULTIMA_ALTERACAO"'
    end
  end
  object dsproduto_ordemservico: TDataSource
    DataSet = dsetproduto_ordemservico
    Left = 632
    Top = 120
  end
  object dsetservico_ordemservico: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from SERVICO_ORDEMSERVICO'
      'where'
      '  NUMERO_OS = :OLD_NUMERO_OS and'
      '  ID_CLIENTE = :OLD_ID_CLIENTE and'
      '  ID_SERVICO = :OLD_ID_SERVICO')
    InsertSQL.Strings = (
      'insert into SERVICO_ORDEMSERVICO'
      
        '  (NUMERO_OS, ID_CLIENTE, ID_SERVICO, QTD, VALOR_UNITARIO, VALOR' +
        '_TOTAL, '
      
        '   VALOR_DESCONTO, PERC_DESCONTO, ID_FUNCIONARIO, DATA_CADASTRO,' +
        ' ULTIMA_ALTERACAO)'
      'values'
      
        '  (:NUMERO_OS, :ID_CLIENTE, :ID_SERVICO, :QTD, :VALOR_UNITARIO, ' +
        ':VALOR_TOTAL, '
      
        '   :VALOR_DESCONTO, :PERC_DESCONTO, :ID_FUNCIONARIO, :DATA_CADAS' +
        'TRO, :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_OS,'
      '  ID_CLIENTE,'
      '  ID_SERVICO,'
      '  QTD,'
      '  VALOR_UNITARIO,'
      '  VALOR_TOTAL,'
      '  VALOR_DESCONTO,'
      '  PERC_DESCONTO,'
      '  ID_FUNCIONARIO,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from SERVICO_ORDEMSERVICO '
      'where'
      '  NUMERO_OS = :NUMERO_OS and'
      '  ID_CLIENTE = :ID_CLIENTE and'
      '  ID_SERVICO = :ID_SERVICO')
    SelectSQL.Strings = (
      'select * from SERVICO_ORDEMSERVICO')
    ModifySQL.Strings = (
      'update SERVICO_ORDEMSERVICO'
      'set'
      '  NUMERO_OS = :NUMERO_OS,'
      '  ID_CLIENTE = :ID_CLIENTE,'
      '  ID_SERVICO = :ID_SERVICO,'
      '  QTD = :QTD,'
      '  VALOR_UNITARIO = :VALOR_UNITARIO,'
      '  VALOR_TOTAL = :VALOR_TOTAL,'
      '  VALOR_DESCONTO = :VALOR_DESCONTO,'
      '  PERC_DESCONTO = :PERC_DESCONTO,'
      '  ID_FUNCIONARIO = :ID_FUNCIONARIO,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  NUMERO_OS = :OLD_NUMERO_OS and'
      '  ID_CLIENTE = :OLD_ID_CLIENTE and'
      '  ID_SERVICO = :OLD_ID_SERVICO')
    ParamCheck = True
    UniDirectional = False
    Left = 480
    Top = 184
    object dsetservico_ordemservicoNUMERO_OS: TIntegerField
      FieldName = 'NUMERO_OS'
      Origin = '"SERVICO_ORDEMSERVICO"."NUMERO_OS"'
    end
    object dsetservico_ordemservicoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = '"SERVICO_ORDEMSERVICO"."ID_CLIENTE"'
    end
    object dsetservico_ordemservicoID_SERVICO: TIntegerField
      FieldName = 'ID_SERVICO'
      Origin = '"SERVICO_ORDEMSERVICO"."ID_SERVICO"'
    end
    object dsetservico_ordemservicoQTD: TIntegerField
      FieldName = 'QTD'
      Origin = '"SERVICO_ORDEMSERVICO"."QTD"'
    end
    object dsetservico_ordemservicoVALOR_UNITARIO: TIBBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = '"SERVICO_ORDEMSERVICO"."VALOR_UNITARIO"'
      Precision = 18
      Size = 2
    end
    object dsetservico_ordemservicoVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"SERVICO_ORDEMSERVICO"."VALOR_TOTAL"'
      Precision = 18
      Size = 2
    end
    object dsetservico_ordemservicoVALOR_DESCONTO: TIBBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = '"SERVICO_ORDEMSERVICO"."VALOR_DESCONTO"'
      Precision = 18
      Size = 2
    end
    object dsetservico_ordemservicoPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
      Origin = '"SERVICO_ORDEMSERVICO"."PERC_DESCONTO"'
    end
    object dsetservico_ordemservicoID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Origin = '"SERVICO_ORDEMSERVICO"."ID_FUNCIONARIO"'
    end
    object dsetservico_ordemservicoDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"SERVICO_ORDEMSERVICO"."DATA_CADASTRO"'
    end
    object dsetservico_ordemservicoULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"SERVICO_ORDEMSERVICO"."ULTIMA_ALTERACAO"'
    end
  end
  object dsservico_ordemservico: TDataSource
    DataSet = dsetservico_ordemservico
    Left = 632
    Top = 184
  end
  object dsetcontasreceber_ordemservico: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CONTAS_RECEBER_ORDEMSERVICO'
      'where'
      '  NUMERO_OS = :OLD_NUMERO_OS and'
      '  ID_CLIENTE = :OLD_ID_CLIENTE and'
      '  NUMERO_PARCELA = :OLD_NUMERO_PARCELA')
    InsertSQL.Strings = (
      'insert into CONTAS_RECEBER_ORDEMSERVICO'
      
        '  (NUMERO_OS, ID_CLIENTE, DATA_EMISSAO, NUMERO_PARCELA, VALOR_PA' +
        'RCELA, '
      
        '   DATA_VENCIMENTO, DATA_PAGAMENTO, JUROS, MULTA, VALOR_PAGO, ID' +
        '_FORMAPAGAMENTO, '
      '   ID_USUARIO, VALOR_DESCONTO, DATA_CADASTRO, ULTIMA_ALTERACAO)'
      'values'
      
        '  (:NUMERO_OS, :ID_CLIENTE, :DATA_EMISSAO, :NUMERO_PARCELA, :VAL' +
        'OR_PARCELA, '
      
        '   :DATA_VENCIMENTO, :DATA_PAGAMENTO, :JUROS, :MULTA, :VALOR_PAG' +
        'O, :ID_FORMAPAGAMENTO, '
      
        '   :ID_USUARIO, :VALOR_DESCONTO, :DATA_CADASTRO, :ULTIMA_ALTERAC' +
        'AO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_OS,'
      '  ID_CLIENTE,'
      '  DATA_EMISSAO,'
      '  NUMERO_PARCELA,'
      '  VALOR_PARCELA,'
      '  DATA_VENCIMENTO,'
      '  DATA_PAGAMENTO,'
      '  JUROS,'
      '  MULTA,'
      '  VALOR_PAGO,'
      '  ID_FORMAPAGAMENTO,'
      '  ID_USUARIO,'
      '  VALOR_DESCONTO,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from CONTAS_RECEBER_ORDEMSERVICO '
      'where'
      '  NUMERO_OS = :NUMERO_OS and'
      '  ID_CLIENTE = :ID_CLIENTE and'
      '  NUMERO_PARCELA = :NUMERO_PARCELA')
    SelectSQL.Strings = (
      'select * from CONTAS_RECEBER_ORDEMSERVICO')
    ModifySQL.Strings = (
      'update CONTAS_RECEBER_ORDEMSERVICO'
      'set'
      '  NUMERO_OS = :NUMERO_OS,'
      '  ID_CLIENTE = :ID_CLIENTE,'
      '  DATA_EMISSAO = :DATA_EMISSAO,'
      '  NUMERO_PARCELA = :NUMERO_PARCELA,'
      '  VALOR_PARCELA = :VALOR_PARCELA,'
      '  DATA_VENCIMENTO = :DATA_VENCIMENTO,'
      '  DATA_PAGAMENTO = :DATA_PAGAMENTO,'
      '  JUROS = :JUROS,'
      '  MULTA = :MULTA,'
      '  VALOR_PAGO = :VALOR_PAGO,'
      '  ID_FORMAPAGAMENTO = :ID_FORMAPAGAMENTO,'
      '  ID_USUARIO = :ID_USUARIO,'
      '  VALOR_DESCONTO = :VALOR_DESCONTO,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  NUMERO_OS = :OLD_NUMERO_OS and'
      '  ID_CLIENTE = :OLD_ID_CLIENTE and'
      '  NUMERO_PARCELA = :OLD_NUMERO_PARCELA')
    ParamCheck = True
    UniDirectional = False
    Left = 480
    Top = 256
    object dsetcontasreceber_ordemservicoNUMERO_OS: TIntegerField
      FieldName = 'NUMERO_OS'
      Origin = '"CONTAS_RECEBER_ORDEMSERVICO"."NUMERO_OS"'
    end
    object dsetcontasreceber_ordemservicoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = '"CONTAS_RECEBER_ORDEMSERVICO"."ID_CLIENTE"'
    end
    object dsetcontasreceber_ordemservicoDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = '"CONTAS_RECEBER_ORDEMSERVICO"."DATA_EMISSAO"'
    end
    object dsetcontasreceber_ordemservicoNUMERO_PARCELA: TIntegerField
      FieldName = 'NUMERO_PARCELA'
      Origin = '"CONTAS_RECEBER_ORDEMSERVICO"."NUMERO_PARCELA"'
    end
    object dsetcontasreceber_ordemservicoVALOR_PARCELA: TIBBCDField
      FieldName = 'VALOR_PARCELA'
      Origin = '"CONTAS_RECEBER_ORDEMSERVICO"."VALOR_PARCELA"'
      Precision = 18
      Size = 2
    end
    object dsetcontasreceber_ordemservicoDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
      Origin = '"CONTAS_RECEBER_ORDEMSERVICO"."DATA_VENCIMENTO"'
    end
    object dsetcontasreceber_ordemservicoDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
      Origin = '"CONTAS_RECEBER_ORDEMSERVICO"."DATA_PAGAMENTO"'
    end
    object dsetcontasreceber_ordemservicoJUROS: TFloatField
      FieldName = 'JUROS'
      Origin = '"CONTAS_RECEBER_ORDEMSERVICO"."JUROS"'
    end
    object dsetcontasreceber_ordemservicoMULTA: TIBBCDField
      FieldName = 'MULTA'
      Origin = '"CONTAS_RECEBER_ORDEMSERVICO"."MULTA"'
      Precision = 18
      Size = 2
    end
    object dsetcontasreceber_ordemservicoVALOR_PAGO: TIBBCDField
      FieldName = 'VALOR_PAGO'
      Origin = '"CONTAS_RECEBER_ORDEMSERVICO"."VALOR_PAGO"'
      Precision = 18
      Size = 2
    end
    object dsetcontasreceber_ordemservicoID_FORMAPAGAMENTO: TIntegerField
      FieldName = 'ID_FORMAPAGAMENTO'
      Origin = '"CONTAS_RECEBER_ORDEMSERVICO"."ID_FORMAPAGAMENTO"'
    end
    object dsetcontasreceber_ordemservicoID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = '"CONTAS_RECEBER_ORDEMSERVICO"."ID_USUARIO"'
    end
    object dsetcontasreceber_ordemservicoVALOR_DESCONTO: TIBBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = '"CONTAS_RECEBER_ORDEMSERVICO"."VALOR_DESCONTO"'
      Precision = 18
      Size = 2
    end
    object dsetcontasreceber_ordemservicoDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"CONTAS_RECEBER_ORDEMSERVICO"."DATA_CADASTRO"'
    end
    object dsetcontasreceber_ordemservicoULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"CONTAS_RECEBER_ORDEMSERVICO"."ULTIMA_ALTERACAO"'
    end
  end
  object dscontasreceber_ordemservico: TDataSource
    DataSet = dsetcontasreceber_ordemservico
    Left = 640
    Top = 256
  end
  object dsetcliente: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CLIENTE'
      'where'
      '  ID_CLIENTE = :OLD_ID_CLIENTE')
    InsertSQL.Strings = (
      'insert into CLIENTE'
      
        '  (NOME, DATA_NASC, SEXO, TPCLIENTE, NACIONALIDADE, CNPJ_CPF, IN' +
        'SCEST_RG, '
      
        '   EMAIL, LIMITE, CELULAR, TELEFONE, PONTO_REF, ENDERECO, NUMERO' +
        ', BAIRRO, '
      
        '   ID_CIDADE, ID_CONDICAO, STATUS, DATA_CADASTRO, ULTIMA_ALTERAC' +
        'AO)'
      'values'
      
        '  (:NOME, :DATA_NASC, :SEXO, :TPCLIENTE, :NACIONALIDADE, :CNPJ_C' +
        'PF, :INSCEST_RG, '
      
        '   :EMAIL, :LIMITE, :CELULAR, :TELEFONE, :PONTO_REF, :ENDERECO, ' +
        ':NUMERO, '
      
        '   :BAIRRO, :ID_CIDADE, :ID_CONDICAO, :STATUS, :DATA_CADASTRO, :' +
        'ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_CLIENTE,'
      '  NOME,'
      '  DATA_NASC,'
      '  SEXO,'
      '  TPCLIENTE,'
      '  NACIONALIDADE,'
      '  CNPJ_CPF,'
      '  INSCEST_RG,'
      '  EMAIL,'
      '  LIMITE,'
      '  CELULAR,'
      '  TELEFONE,'
      '  PONTO_REF,'
      '  ENDERECO,'
      '  NUMERO,'
      '  BAIRRO,'
      '  ID_CIDADE,'
      '  ID_CONDICAO,'
      '  STATUS,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from CLIENTE '
      'where'
      '  ID_CLIENTE = :ID_CLIENTE')
    SelectSQL.Strings = (
      'select * from CLIENTE')
    ModifySQL.Strings = (
      'update CLIENTE'
      'set'
      '  NOME = :NOME,'
      '  DATA_NASC = :DATA_NASC,'
      '  SEXO = :SEXO,'
      '  TPCLIENTE = :TPCLIENTE,'
      '  NACIONALIDADE = :NACIONALIDADE,'
      '  CNPJ_CPF = :CNPJ_CPF,'
      '  INSCEST_RG = :INSCEST_RG,'
      '  EMAIL = :EMAIL,'
      '  LIMITE = :LIMITE,'
      '  CELULAR = :CELULAR,'
      '  TELEFONE = :TELEFONE,'
      '  PONTO_REF = :PONTO_REF,'
      '  ENDERECO = :ENDERECO,'
      '  NUMERO = :NUMERO,'
      '  BAIRRO = :BAIRRO,'
      '  ID_CIDADE = :ID_CIDADE,'
      '  ID_CONDICAO = :ID_CONDICAO,'
      '  STATUS = :STATUS,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_CLIENTE = :OLD_ID_CLIENTE')
    ParamCheck = True
    UniDirectional = False
    Left = 64
    Top = 448
    object dsetclienteID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = '"CLIENTE"."ID_CLIENTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetclienteNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"CLIENTE"."NOME"'
      Size = 60
    end
    object dsetclienteDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
      Origin = '"CLIENTE"."DATA_NASC"'
    end
    object dsetclienteSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = '"CLIENTE"."SEXO"'
      FixedChar = True
      Size = 1
    end
    object dsetclienteTPCLIENTE: TIBStringField
      FieldName = 'TPCLIENTE'
      Origin = '"CLIENTE"."TPCLIENTE"'
      FixedChar = True
      Size = 1
    end
    object dsetclienteNACIONALIDADE: TIBStringField
      FieldName = 'NACIONALIDADE'
      Origin = '"CLIENTE"."NACIONALIDADE"'
      FixedChar = True
      Size = 1
    end
    object dsetclienteCNPJ_CPF: TIBStringField
      FieldName = 'CNPJ_CPF'
      Origin = '"CLIENTE"."CNPJ_CPF"'
      Size = 15
    end
    object dsetclienteINSCEST_RG: TIBStringField
      FieldName = 'INSCEST_RG'
      Origin = '"CLIENTE"."INSCEST_RG"'
      Size = 12
    end
    object dsetclienteEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"CLIENTE"."EMAIL"'
      Size = 35
    end
    object dsetclienteLIMITE: TFloatField
      FieldName = 'LIMITE'
      Origin = '"CLIENTE"."LIMITE"'
    end
    object dsetclienteCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = '"CLIENTE"."CELULAR"'
      Size = 15
    end
    object dsetclienteTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = '"CLIENTE"."TELEFONE"'
      Size = 15
    end
    object dsetclientePONTO_REF: TIBStringField
      FieldName = 'PONTO_REF'
      Origin = '"CLIENTE"."PONTO_REF"'
      Size = 30
    end
    object dsetclienteENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = '"CLIENTE"."ENDERECO"'
      Size = 60
    end
    object dsetclienteNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = '"CLIENTE"."NUMERO"'
      Size = 6
    end
    object dsetclienteBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = '"CLIENTE"."BAIRRO"'
      Size = 35
    end
    object dsetclienteID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = '"CLIENTE"."ID_CIDADE"'
    end
    object dsetclienteID_CONDICAO: TIntegerField
      FieldName = 'ID_CONDICAO'
      Origin = '"CLIENTE"."ID_CONDICAO"'
    end
    object dsetclienteSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = '"CLIENTE"."STATUS"'
      FixedChar = True
      Size = 1
    end
    object dsetclienteDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"CLIENTE"."DATA_CADASTRO"'
    end
    object dsetclienteULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"CLIENTE"."ULTIMA_ALTERACAO"'
    end
  end
  object dsetordemservico: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ORDEM_SERVICO'
      'where'
      '  ID_OS = :OLD_ID_OS')
    InsertSQL.Strings = (
      'insert into ORDEM_SERVICO'
      
        '  (DATA_EMISSAO, HORA, ID_USUARIO, STATUS, ID_CLIENTE, OBS, TOTA' +
        'L_PRODUTOS, '
      
        '   TOTAL_SERVICOS, OUTRAS_DESPESAS, DESCONTO, TOTAL_OS, DATA_CAD' +
        'ASTRO, '
      
        '   ULTIMA_ALTERACAO, ID_COR, ID_MODELO, ANO_VEICULO, PLACA_VEICU' +
        'LO, ID_CONDICAO, '
      '   PROBLEMA_VEICULO)'
      'values'
      
        '  (:DATA_EMISSAO, :HORA, :ID_USUARIO, :STATUS, :ID_CLIENTE, :OBS' +
        ', :TOTAL_PRODUTOS, '
      
        '   :TOTAL_SERVICOS, :OUTRAS_DESPESAS, :DESCONTO, :TOTAL_OS, :DAT' +
        'A_CADASTRO, '
      
        '   :ULTIMA_ALTERACAO, :ID_COR, :ID_MODELO, :ANO_VEICULO, :PLACA_' +
        'VEICULO, '
      '   :ID_CONDICAO, :PROBLEMA_VEICULO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_OS,'
      '  DATA_EMISSAO,'
      '  HORA,'
      '  ID_USUARIO,'
      '  STATUS,'
      '  ID_CLIENTE,'
      '  OBS,'
      '  TOTAL_PRODUTOS,'
      '  TOTAL_SERVICOS,'
      '  OUTRAS_DESPESAS,'
      '  DESCONTO,'
      '  TOTAL_OS,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO,'
      '  ID_COR,'
      '  ID_MODELO,'
      '  ANO_VEICULO,'
      '  PLACA_VEICULO,'
      '  ID_CONDICAO,'
      '  PROBLEMA_VEICULO'
      'from ORDEM_SERVICO '
      'where'
      '  ID_OS = :ID_OS')
    SelectSQL.Strings = (
      'select * from ORDEM_SERVICO')
    ModifySQL.Strings = (
      'update ORDEM_SERVICO'
      'set'
      '  DATA_EMISSAO = :DATA_EMISSAO,'
      '  HORA = :HORA,'
      '  ID_USUARIO = :ID_USUARIO,'
      '  STATUS = :STATUS,'
      '  ID_CLIENTE = :ID_CLIENTE,'
      '  OBS = :OBS,'
      '  TOTAL_PRODUTOS = :TOTAL_PRODUTOS,'
      '  TOTAL_SERVICOS = :TOTAL_SERVICOS,'
      '  OUTRAS_DESPESAS = :OUTRAS_DESPESAS,'
      '  DESCONTO = :DESCONTO,'
      '  TOTAL_OS = :TOTAL_OS,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO,'
      '  ID_COR = :ID_COR,'
      '  ID_MODELO = :ID_MODELO,'
      '  ANO_VEICULO = :ANO_VEICULO,'
      '  PLACA_VEICULO = :PLACA_VEICULO,'
      '  ID_CONDICAO = :ID_CONDICAO,'
      '  PROBLEMA_VEICULO = :PROBLEMA_VEICULO'
      'where'
      '  ID_OS = :OLD_ID_OS')
    ParamCheck = True
    UniDirectional = False
    GeneratorField.Field = 'ID_OS'
    GeneratorField.Generator = 'GEN_ORDEM_SERVICO_ID'
    Left = 264
    Top = 520
    object dsetordemservicoID_OS: TIntegerField
      FieldName = 'ID_OS'
      Origin = '"ORDEM_SERVICO"."ID_OS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetordemservicoDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = '"ORDEM_SERVICO"."DATA_EMISSAO"'
    end
    object dsetordemservicoHORA: TTimeField
      FieldName = 'HORA'
      Origin = '"ORDEM_SERVICO"."HORA"'
    end
    object dsetordemservicoID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = '"ORDEM_SERVICO"."ID_USUARIO"'
    end
    object dsetordemservicoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = '"ORDEM_SERVICO"."STATUS"'
      Size = 30
    end
    object dsetordemservicoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = '"ORDEM_SERVICO"."ID_CLIENTE"'
    end
    object dsetordemservicoOBS: TIBStringField
      FieldName = 'OBS'
      Origin = '"ORDEM_SERVICO"."OBS"'
      Size = 200
    end
    object dsetordemservicoTOTAL_PRODUTOS: TIBBCDField
      FieldName = 'TOTAL_PRODUTOS'
      Origin = '"ORDEM_SERVICO"."TOTAL_PRODUTOS"'
      Precision = 18
      Size = 2
    end
    object dsetordemservicoTOTAL_SERVICOS: TIBBCDField
      FieldName = 'TOTAL_SERVICOS'
      Origin = '"ORDEM_SERVICO"."TOTAL_SERVICOS"'
      Precision = 18
      Size = 2
    end
    object dsetordemservicoOUTRAS_DESPESAS: TIBBCDField
      FieldName = 'OUTRAS_DESPESAS'
      Origin = '"ORDEM_SERVICO"."OUTRAS_DESPESAS"'
      Precision = 18
      Size = 2
    end
    object dsetordemservicoDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = '"ORDEM_SERVICO"."DESCONTO"'
      Precision = 18
      Size = 2
    end
    object dsetordemservicoTOTAL_OS: TIBBCDField
      FieldName = 'TOTAL_OS'
      Origin = '"ORDEM_SERVICO"."TOTAL_OS"'
      Precision = 18
      Size = 2
    end
    object dsetordemservicoDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"ORDEM_SERVICO"."DATA_CADASTRO"'
    end
    object dsetordemservicoULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"ORDEM_SERVICO"."ULTIMA_ALTERACAO"'
    end
    object dsetordemservicoID_COR: TIntegerField
      FieldName = 'ID_COR'
      Origin = '"ORDEM_SERVICO"."ID_COR"'
    end
    object dsetordemservicoID_MODELO: TIntegerField
      FieldName = 'ID_MODELO'
      Origin = '"ORDEM_SERVICO"."ID_MODELO"'
    end
    object dsetordemservicoANO_VEICULO: TIBStringField
      FieldName = 'ANO_VEICULO'
      Origin = '"ORDEM_SERVICO"."ANO_VEICULO"'
      Size = 10
    end
    object dsetordemservicoPLACA_VEICULO: TIBStringField
      FieldName = 'PLACA_VEICULO'
      Origin = '"ORDEM_SERVICO"."PLACA_VEICULO"'
      Size = 10
    end
    object dsetordemservicoID_CONDICAO: TIntegerField
      FieldName = 'ID_CONDICAO'
      Origin = '"ORDEM_SERVICO"."ID_CONDICAO"'
    end
    object dsetordemservicoPROBLEMA_VEICULO: TIBStringField
      FieldName = 'PROBLEMA_VEICULO'
      Origin = '"ORDEM_SERVICO"."PROBLEMA_VEICULO"'
      Size = 200
    end
  end
  object dsetfornecedor: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from FORNECEDOR'
      'where'
      '  ID_FORNECEDOR = :OLD_ID_FORNECEDOR')
    InsertSQL.Strings = (
      'insert into FORNECEDOR'
      
        '  (RAZAO, TIPO_FORNECEDOR, STATUS, FANTASIA, CNPJ, INSC_ESTADUAL' +
        ', CELULAR, '
      
        '   TELEFONE, ENDERECO, NUMERO, BAIRRO, ID_CIDADE, ID_CONDICAO, D' +
        'ATA_CADASTRO, '
      '   ULTIMA_ALTERACAO)'
      'values'
      
        '  (:RAZAO, :TIPO_FORNECEDOR, :STATUS, :FANTASIA, :CNPJ, :INSC_ES' +
        'TADUAL, '
      
        '   :CELULAR, :TELEFONE, :ENDERECO, :NUMERO, :BAIRRO, :ID_CIDADE,' +
        ' :ID_CONDICAO, '
      '   :DATA_CADASTRO, :ULTIMA_ALTERACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_FORNECEDOR,'
      '  RAZAO,'
      '  TIPO_FORNECEDOR,'
      '  STATUS,'
      '  FANTASIA,'
      '  CNPJ,'
      '  INSC_ESTADUAL,'
      '  CELULAR,'
      '  TELEFONE,'
      '  ENDERECO,'
      '  NUMERO,'
      '  BAIRRO,'
      '  ID_CIDADE,'
      '  ID_CONDICAO,'
      '  DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO'
      'from FORNECEDOR '
      'where'
      '  ID_FORNECEDOR = :ID_FORNECEDOR')
    SelectSQL.Strings = (
      'select * from FORNECEDOR')
    ModifySQL.Strings = (
      'update FORNECEDOR'
      'set'
      '  RAZAO = :RAZAO,'
      '  TIPO_FORNECEDOR = :TIPO_FORNECEDOR,'
      '  STATUS = :STATUS,'
      '  FANTASIA = :FANTASIA,'
      '  CNPJ = :CNPJ,'
      '  INSC_ESTADUAL = :INSC_ESTADUAL,'
      '  CELULAR = :CELULAR,'
      '  TELEFONE = :TELEFONE,'
      '  ENDERECO = :ENDERECO,'
      '  NUMERO = :NUMERO,'
      '  BAIRRO = :BAIRRO,'
      '  ID_CIDADE = :ID_CIDADE,'
      '  ID_CONDICAO = :ID_CONDICAO,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO'
      'where'
      '  ID_FORNECEDOR = :OLD_ID_FORNECEDOR')
    ParamCheck = True
    UniDirectional = False
    Left = 272
    Top = 8
    object dsetfornecedorID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = '"FORNECEDOR"."ID_FORNECEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetfornecedorRAZAO: TIBStringField
      FieldName = 'RAZAO'
      Origin = '"FORNECEDOR"."RAZAO"'
      Size = 65
    end
    object dsetfornecedorTIPO_FORNECEDOR: TIBStringField
      FieldName = 'TIPO_FORNECEDOR'
      Origin = '"FORNECEDOR"."TIPO_FORNECEDOR"'
      FixedChar = True
      Size = 1
    end
    object dsetfornecedorSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = '"FORNECEDOR"."STATUS"'
      FixedChar = True
      Size = 1
    end
    object dsetfornecedorFANTASIA: TIBStringField
      FieldName = 'FANTASIA'
      Origin = '"FORNECEDOR"."FANTASIA"'
      Size = 65
    end
    object dsetfornecedorCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = '"FORNECEDOR"."CNPJ"'
      Size = 22
    end
    object dsetfornecedorINSC_ESTADUAL: TIBStringField
      FieldName = 'INSC_ESTADUAL'
      Origin = '"FORNECEDOR"."INSC_ESTADUAL"'
      Size = 22
    end
    object dsetfornecedorCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = '"FORNECEDOR"."CELULAR"'
      Size = 14
    end
    object dsetfornecedorTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = '"FORNECEDOR"."TELEFONE"'
      Size = 14
    end
    object dsetfornecedorENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = '"FORNECEDOR"."ENDERECO"'
      Size = 60
    end
    object dsetfornecedorNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"FORNECEDOR"."NUMERO"'
    end
    object dsetfornecedorBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = '"FORNECEDOR"."BAIRRO"'
      Size = 35
    end
    object dsetfornecedorID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = '"FORNECEDOR"."ID_CIDADE"'
    end
    object dsetfornecedorID_CONDICAO: TIntegerField
      FieldName = 'ID_CONDICAO'
      Origin = '"FORNECEDOR"."ID_CONDICAO"'
    end
    object dsetfornecedorDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"FORNECEDOR"."DATA_CADASTRO"'
    end
    object dsetfornecedorULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"FORNECEDOR"."ULTIMA_ALTERACAO"'
    end
  end
  object dsetvenda_produto: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from VENDA_PRODUTO'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA')
    InsertSQL.Strings = (
      'insert into VENDA_PRODUTO'
      
        '  (SERIE, MODELO, STATUS, DATA_VENDA, HORA_VENDA, DATA_EMISSAO, ' +
        'ID_CLIENTE, '
      
        '   ID_CONDICAO, DATA_CANCELAMENTO, HORA_CANCELAMENTO, TOTAL_PROD' +
        'UTOS, TOTAL_DESCONTO, '
      '   TOTAL_VENDA, ID_USUARIO_CANCELAMENTO)'
      'values'
      
        '  (:SERIE, :MODELO, :STATUS, :DATA_VENDA, :HORA_VENDA, :DATA_EMI' +
        'SSAO, :ID_CLIENTE, '
      
        '   :ID_CONDICAO, :DATA_CANCELAMENTO, :HORA_CANCELAMENTO, :TOTAL_' +
        'PRODUTOS, '
      '   :TOTAL_DESCONTO, :TOTAL_VENDA, :ID_USUARIO_CANCELAMENTO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_NOTA,'
      '  SERIE,'
      '  MODELO,'
      '  STATUS,'
      '  DATA_VENDA,'
      '  HORA_VENDA,'
      '  DATA_EMISSAO,'
      '  ID_CLIENTE,'
      '  ID_CONDICAO,'
      '  DATA_CANCELAMENTO,'
      '  HORA_CANCELAMENTO,'
      '  TOTAL_PRODUTOS,'
      '  TOTAL_DESCONTO,'
      '  TOTAL_VENDA,'
      '  ID_USUARIO_CANCELAMENTO'
      'from VENDA_PRODUTO '
      'where'
      '  NUMERO_NOTA = :NUMERO_NOTA')
    SelectSQL.Strings = (
      'select * from VENDA_PRODUTO')
    ModifySQL.Strings = (
      'update VENDA_PRODUTO'
      'set'
      '  SERIE = :SERIE,'
      '  MODELO = :MODELO,'
      '  STATUS = :STATUS,'
      '  DATA_VENDA = :DATA_VENDA,'
      '  HORA_VENDA = :HORA_VENDA,'
      '  DATA_EMISSAO = :DATA_EMISSAO,'
      '  ID_CLIENTE = :ID_CLIENTE,'
      '  ID_CONDICAO = :ID_CONDICAO,'
      '  DATA_CANCELAMENTO = :DATA_CANCELAMENTO,'
      '  HORA_CANCELAMENTO = :HORA_CANCELAMENTO,'
      '  TOTAL_PRODUTOS = :TOTAL_PRODUTOS,'
      '  TOTAL_DESCONTO = :TOTAL_DESCONTO,'
      '  TOTAL_VENDA = :TOTAL_VENDA,'
      '  ID_USUARIO_CANCELAMENTO = :ID_USUARIO_CANCELAMENTO'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA')
    ParamCheck = True
    UniDirectional = False
    GeneratorField.Field = 'NUMERO_NOTA'
    GeneratorField.Generator = 'GEN_VENDA_PRODUTO_ID'
    Left = 488
    object dsetvenda_produtoNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = '"VENDA_PRODUTO"."NUMERO_NOTA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetvenda_produtoSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = '"VENDA_PRODUTO"."SERIE"'
      Size = 10
    end
    object dsetvenda_produtoMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = '"VENDA_PRODUTO"."MODELO"'
      Size = 10
    end
    object dsetvenda_produtoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = '"VENDA_PRODUTO"."STATUS"'
      Size = 10
    end
    object dsetvenda_produtoDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      Origin = '"VENDA_PRODUTO"."DATA_VENDA"'
    end
    object dsetvenda_produtoHORA_VENDA: TTimeField
      FieldName = 'HORA_VENDA'
      Origin = '"VENDA_PRODUTO"."HORA_VENDA"'
    end
    object dsetvenda_produtoDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = '"VENDA_PRODUTO"."DATA_EMISSAO"'
    end
    object dsetvenda_produtoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = '"VENDA_PRODUTO"."ID_CLIENTE"'
    end
    object dsetvenda_produtoID_CONDICAO: TIntegerField
      FieldName = 'ID_CONDICAO'
      Origin = '"VENDA_PRODUTO"."ID_CONDICAO"'
    end
    object dsetvenda_produtoDATA_CANCELAMENTO: TDateField
      FieldName = 'DATA_CANCELAMENTO'
      Origin = '"VENDA_PRODUTO"."DATA_CANCELAMENTO"'
    end
    object dsetvenda_produtoHORA_CANCELAMENTO: TTimeField
      FieldName = 'HORA_CANCELAMENTO'
      Origin = '"VENDA_PRODUTO"."HORA_CANCELAMENTO"'
    end
    object dsetvenda_produtoTOTAL_PRODUTOS: TIBBCDField
      FieldName = 'TOTAL_PRODUTOS'
      Origin = '"VENDA_PRODUTO"."TOTAL_PRODUTOS"'
      Precision = 18
      Size = 2
    end
    object dsetvenda_produtoTOTAL_DESCONTO: TIBBCDField
      FieldName = 'TOTAL_DESCONTO'
      Origin = '"VENDA_PRODUTO"."TOTAL_DESCONTO"'
      Precision = 18
      Size = 2
    end
    object dsetvenda_produtoTOTAL_VENDA: TIBBCDField
      FieldName = 'TOTAL_VENDA'
      Origin = '"VENDA_PRODUTO"."TOTAL_VENDA"'
      Precision = 18
      Size = 2
    end
    object dsetvenda_produtoID_USUARIO_CANCELAMENTO: TIntegerField
      FieldName = 'ID_USUARIO_CANCELAMENTO'
      Origin = '"VENDA_PRODUTO"."ID_USUARIO_CANCELAMENTO"'
    end
  end
  object dsetvenda_servico: TIBDataSet
    Database = banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from VENDA_SERVICO'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA')
    InsertSQL.Strings = (
      'insert into VENDA_SERVICO'
      
        '  (DATA_VENDA, DATA_EMISSAO, HORA_VENDA, ID_CLIENTE, ID_CONDICAO' +
        ', DATA_CANCELAMENTO, '
      
        '   HORA_CANCELAMENTO, ID_USUARIO_CANCELAMENTO, TOTAL_SERVICOS, T' +
        'OTAL_VENDA, '
      '   TOTAL_DESCONTO, SERIE, MODELO, STATUS)'
      'values'
      
        '  (:DATA_VENDA, :DATA_EMISSAO, :HORA_VENDA, :ID_CLIENTE, :ID_CON' +
        'DICAO, '
      
        '   :DATA_CANCELAMENTO, :HORA_CANCELAMENTO, :ID_USUARIO_CANCELAME' +
        'NTO, :TOTAL_SERVICOS, '
      '   :TOTAL_VENDA, :TOTAL_DESCONTO, :SERIE, :MODELO, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_NOTA,'
      '  DATA_VENDA,'
      '  DATA_EMISSAO,'
      '  HORA_VENDA,'
      '  ID_CLIENTE,'
      '  ID_CONDICAO,'
      '  DATA_CANCELAMENTO,'
      '  HORA_CANCELAMENTO,'
      '  ID_USUARIO_CANCELAMENTO,'
      '  TOTAL_SERVICOS,'
      '  TOTAL_VENDA,'
      '  TOTAL_DESCONTO,'
      '  SERIE,'
      '  MODELO,'
      '  STATUS'
      'from VENDA_SERVICO '
      'where'
      '  NUMERO_NOTA = :NUMERO_NOTA')
    SelectSQL.Strings = (
      'select * from VENDA_SERVICO')
    ModifySQL.Strings = (
      'update VENDA_SERVICO'
      'set'
      '  DATA_VENDA = :DATA_VENDA,'
      '  DATA_EMISSAO = :DATA_EMISSAO,'
      '  HORA_VENDA = :HORA_VENDA,'
      '  ID_CLIENTE = :ID_CLIENTE,'
      '  ID_CONDICAO = :ID_CONDICAO,'
      '  DATA_CANCELAMENTO = :DATA_CANCELAMENTO,'
      '  HORA_CANCELAMENTO = :HORA_CANCELAMENTO,'
      '  ID_USUARIO_CANCELAMENTO = :ID_USUARIO_CANCELAMENTO,'
      '  TOTAL_SERVICOS = :TOTAL_SERVICOS,'
      '  TOTAL_VENDA = :TOTAL_VENDA,'
      '  TOTAL_DESCONTO = :TOTAL_DESCONTO,'
      '  SERIE = :SERIE,'
      '  MODELO = :MODELO,'
      '  STATUS = :STATUS'
      'where'
      '  NUMERO_NOTA = :OLD_NUMERO_NOTA')
    ParamCheck = True
    UniDirectional = False
    GeneratorField.Field = 'NUMERO_NOTA'
    GeneratorField.Generator = 'GEN_VENDA_SERVICO_ID'
    Left = 768
    object dsetvenda_servicoNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = '"VENDA_SERVICO"."NUMERO_NOTA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsetvenda_servicoDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      Origin = '"VENDA_SERVICO"."DATA_VENDA"'
    end
    object dsetvenda_servicoDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = '"VENDA_SERVICO"."DATA_EMISSAO"'
    end
    object dsetvenda_servicoHORA_VENDA: TTimeField
      FieldName = 'HORA_VENDA'
      Origin = '"VENDA_SERVICO"."HORA_VENDA"'
    end
    object dsetvenda_servicoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = '"VENDA_SERVICO"."ID_CLIENTE"'
    end
    object dsetvenda_servicoID_CONDICAO: TIntegerField
      FieldName = 'ID_CONDICAO'
      Origin = '"VENDA_SERVICO"."ID_CONDICAO"'
    end
    object dsetvenda_servicoDATA_CANCELAMENTO: TDateField
      FieldName = 'DATA_CANCELAMENTO'
      Origin = '"VENDA_SERVICO"."DATA_CANCELAMENTO"'
    end
    object dsetvenda_servicoHORA_CANCELAMENTO: TTimeField
      FieldName = 'HORA_CANCELAMENTO'
      Origin = '"VENDA_SERVICO"."HORA_CANCELAMENTO"'
    end
    object dsetvenda_servicoID_USUARIO_CANCELAMENTO: TIntegerField
      FieldName = 'ID_USUARIO_CANCELAMENTO'
      Origin = '"VENDA_SERVICO"."ID_USUARIO_CANCELAMENTO"'
    end
    object dsetvenda_servicoTOTAL_SERVICOS: TIBBCDField
      FieldName = 'TOTAL_SERVICOS'
      Origin = '"VENDA_SERVICO"."TOTAL_SERVICOS"'
      Precision = 18
      Size = 2
    end
    object dsetvenda_servicoTOTAL_VENDA: TIBBCDField
      FieldName = 'TOTAL_VENDA'
      Origin = '"VENDA_SERVICO"."TOTAL_VENDA"'
      Precision = 18
      Size = 2
    end
    object dsetvenda_servicoTOTAL_DESCONTO: TIBBCDField
      FieldName = 'TOTAL_DESCONTO'
      Origin = '"VENDA_SERVICO"."TOTAL_DESCONTO"'
      Precision = 18
      Size = 2
    end
    object dsetvenda_servicoSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = '"VENDA_SERVICO"."SERIE"'
      Size = 6
    end
    object dsetvenda_servicoMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = '"VENDA_SERVICO"."MODELO"'
      Size = 3
    end
    object dsetvenda_servicoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = '"VENDA_SERVICO"."STATUS"'
      Size = 10
    end
  end
  object dsvenda_servico: TDataSource
    DataSet = dsetvenda_servico
    Left = 880
  end
end
