inherited FrmConsultaCidade: TFrmConsultaCidade
  Caption = 'Consulta Cidade'
  ClientHeight = 481
  ClientWidth = 817
  ExplicitWidth = 833
  ExplicitHeight = 520
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnPesquisar: TSpeedButton
    Left = 175
    Top = 29
    Width = 57
    Caption = ''
    OnClick = btnPesquisarClick
    ExplicitLeft = 175
    ExplicitTop = 29
    ExplicitWidth = 57
  end
  inherited btnNovo: TSpeedButton
    Left = 331
    Top = 446
    Width = 118
    ExplicitLeft = 331
    ExplicitTop = 446
    ExplicitWidth = 118
  end
  inherited btnAlterar: TSpeedButton
    Left = 455
    Top = 446
    ExplicitLeft = 455
    ExplicitTop = 446
  end
  inherited btnExcluir: TSpeedButton
    Left = 574
    Top = 446
    ExplicitLeft = 574
    ExplicitTop = 446
  end
  inherited btnSair: TSpeedButton
    Left = 694
    Top = 446
    ExplicitLeft = 694
    ExplicitTop = 446
  end
  object Label1: TLabel [5]
    Left = 8
    Top = 8
    Width = 130
    Height = 18
    Caption = 'CODIGO / CIDADE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited edtPesquisar: TEdit
    Left = 8
    Top = 29
    Width = 161
    ExplicitLeft = 8
    ExplicitTop = 29
    ExplicitWidth = 161
  end
  inherited DBGrid1: TDBGrid
    Left = 8
    Top = 57
    Width = 801
    DataSource = DM.dscidade
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_CIDADE'
        Title.Caption = 'ID'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE01'
        Title.Caption = 'CIDADE'
        Width = 262
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DDD'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_ESTADO'
        Title.Caption = 'ID ESTADO'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO01'
        Title.Caption = 'ESTADO'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CADASTRO'
        Title.Caption = 'DATA CADASTRO'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULTIMA_ALTERACAO'
        Title.Caption = 'ULTIMA ALTERACAO'
        Width = 116
        Visible = True
      end>
  end
end
