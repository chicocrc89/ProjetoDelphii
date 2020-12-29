inherited FrmConsultaCliente: TFrmConsultaCliente
  Caption = 'Consulta Cliente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TDBGrid
    DataSource = DM.dscliente
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_CLIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_NASC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEXO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TPCLIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NACIONALIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ_CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSCEST_RG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIMITE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CELULAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PONTO_REF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_CIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FORMAPAGAMENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
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
        FieldName = 'ID_CONDICAO'
        Visible = True
      end>
  end
end
