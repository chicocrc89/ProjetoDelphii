inherited FrmConsultaServicos: TFrmConsultaServicos
  Caption = 'Consulta Servicos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TDBGrid
    DataSource = DM.dsservico
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_SERVICO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO_VENDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Visible = True
      end>
  end
end
