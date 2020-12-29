inherited FrmConsultaGrupo: TFrmConsultaGrupo
  Caption = 'Consulta Grupo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TDBGrid
    DataSource = DM.dsgrupo
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_GRUPO'
        Title.Caption = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPO'
        Visible = True
      end>
  end
  object mmtablegrupo: TFDMemTable
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
