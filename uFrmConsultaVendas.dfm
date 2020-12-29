inherited FrmConsultaVendas: TFrmConsultaVendas
  Caption = 'Consulta Vendas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TDBGrid
    DataSource = DM.dsvenda_produto
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO_NOTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODELO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_VENDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA_VENDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_EMISSAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_CLIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_CONDICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CANCELAMENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA_CANCELAMENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_PRODUTOS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_DESCONTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_VENDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_USUARIO_CANCELAMENTO'
        Visible = True
      end>
  end
end
