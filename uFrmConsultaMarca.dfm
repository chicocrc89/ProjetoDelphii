inherited FrmConsultaMarca: TFrmConsultaMarca
  Caption = 'Consulta Marca'
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnPesquisar: TSpeedButton
    OnClick = btnPesquisarClick
  end
  inherited DBGrid1: TDBGrid
    DataSource = DM.dsmarca
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_MARCA'
        Title.Caption = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARCA'
        Visible = True
      end>
  end
end
