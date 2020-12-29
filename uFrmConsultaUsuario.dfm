inherited FrmConsultaUsuario: TFrmConsultaUsuario
  Caption = 'Consulta Usuario'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TDBGrid
    DataSource = DM.dsusuario
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_USUARIO'
        Title.Caption = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SENHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERMISSAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FUNCIONARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CADASTRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULTIMA_ALTERACAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_ALTEROU'
        Visible = True
      end>
  end
  object mmtableusuario: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Top = 424
  end
end
