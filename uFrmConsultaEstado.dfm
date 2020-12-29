inherited FrmConsultaEstado: TFrmConsultaEstado
  Caption = 'Consulta Estado'
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnPesquisar: TSpeedButton
    OnClick = btnPesquisarClick
  end
  inherited DBGrid1: TDBGrid
    Left = 8
    DataSource = DM.dsestado
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_ESTADO'
        Title.Caption = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UF'
        Width = 28
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_PAIS'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATA_CADASTRO'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ULTIMA_ALTERACAO'
        Visible = True
      end>
  end
  object mmtableestado: TFDMemTable
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
