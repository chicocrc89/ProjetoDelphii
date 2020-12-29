inherited FrmConsultaPais: TFrmConsultaPais
  Caption = 'Consulta Pa'#237's'
  ClientHeight = 469
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnPesquisar: TSpeedButton
    OnClick = btnPesquisarClick
  end
  inherited DBGrid1: TDBGrid
    Left = 8
    Top = 45
    Height = 377
    Ctl3D = False
    DataSource = DM.dspais
    Font.Height = -13
    Font.Name = 'Calibri'
    ParentCtl3D = False
    ParentFont = False
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_PAIS'
        Title.Caption = 'CODIGO'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAIS'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DDI'
        Width = 33
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SIGLA'
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
  object mmtablepais: TFDMemTable
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
