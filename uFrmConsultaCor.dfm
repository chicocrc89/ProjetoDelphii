inherited FrmConsultaCor: TFrmConsultaCor
  Caption = 'Consulta Cor'
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnPesquisar: TSpeedButton
    OnClick = btnPesquisarClick
  end
  inherited DBGrid1: TDBGrid
    DataSource = DM.dscor
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_COR'
        Title.Caption = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COR'
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
      end>
  end
end
