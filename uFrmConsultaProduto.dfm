inherited FrmConsultaProduto: TFrmConsultaProduto
  Caption = 'Consulta Produto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TDBGrid
    DataSource = DM.dsproduto
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_PRODUTO'
        Title.Caption = 'CODIGO'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_BARRAS'
        Title.Caption = 'COD. BARRAS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTOQUE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO_COMPRA'
        Title.Caption = 'PRECO DE COMPRA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO_VENDA'
        Title.Caption = 'PRECO DE VENDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FABRICANTE'
        Title.Caption = 'COD. FABRICANTE'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FORNECEDOR'
        Title.Caption = 'COD. FORNECEDOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARGEM'
        Title.Caption = '%MARGEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UND'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_PRODUTO'
        Title.Caption = 'TP. PRODUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_GRUPO'
        Title.Caption = 'COD. GRUPO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS_PRODUTO'
        Title.Caption = 'OBS DO PRODUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTO_PRODUTO'
        Title.Caption = 'CUSTO DO PRODUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CADASTRO'
        Title.Caption = 'DATA CADASTRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULTIMA_ALTERACAO'
        Title.Caption = 'ULTIMA ALTERACAO'
        Visible = True
      end>
  end
end
