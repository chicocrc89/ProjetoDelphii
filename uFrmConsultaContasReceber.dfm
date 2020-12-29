inherited FrmConsultaContasReceber: TFrmConsultaContasReceber
  Caption = 'Consulta Contas Receber'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TDBGrid
    DataSource = DM.dscontasreceber
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
        FieldName = 'ID_CLIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_EMISSAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_PARCELA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_PARCELA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_VENCIMENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_PAGAMENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUROS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MULTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FORMAPAGAMENTO'
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
      end
      item
        Expanded = False
        FieldName = 'ID_USUARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCONTO'
        Visible = True
      end>
  end
end
