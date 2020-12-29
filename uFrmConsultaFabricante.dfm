inherited FrmConsultaFabricante: TFrmConsultaFabricante
  Caption = 'Consulta Fabricante'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TDBGrid
    DataSource = DM.dsfabricante
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_FABRICANTE'
        Title.Caption = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FABRICANTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ'
        Visible = True
      end>
  end
end
