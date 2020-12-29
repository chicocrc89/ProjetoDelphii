inherited FrmConsultaFormaPagamento: TFrmConsultaFormaPagamento
  Caption = 'Consulta de Forma de Pagamento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TDBGrid
    DataSource = DM.dsformapagamento
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_FORMAPAGAMENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMA_PAGAMENTO'
        Visible = True
      end>
  end
end
