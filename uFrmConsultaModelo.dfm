inherited FrmConsultaModelo: TFrmConsultaModelo
  Caption = 'Consulta Modelo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnPesquisar: TSpeedButton
    OnClick = btnPesquisarClick
  end
  inherited DBGrid1: TDBGrid
    DataSource = DM.dsmodelo
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_MODELO'
        Title.Caption = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODELO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARCA'
        Visible = True
      end>
  end
end