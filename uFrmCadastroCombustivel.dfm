inherited FrmCadastroCombustivel: TFrmCadastroCombustivel
  Caption = 'Cadastro Combustivel'
  ClientHeight = 311
  ClientWidth = 707
  ExplicitWidth = 723
  ExplicitHeight = 350
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblDtCadastro: TLabel
    Left = 8
    Top = 230
    ExplicitLeft = 8
    ExplicitTop = 230
  end
  inherited lblDtUlt_alt: TLabel
    Left = 152
    Top = 230
    ExplicitLeft = 152
    ExplicitTop = 230
  end
  inherited btnSalvar: TSpeedButton
    Left = 512
    Top = 227
    ExplicitLeft = 512
    ExplicitTop = 227
  end
  inherited btnSair: TSpeedButton
    Left = 608
    Top = 227
    ExplicitLeft = 608
    ExplicitTop = 227
  end
  inherited Label10: TLabel
    Left = 320
    Top = 230
    ExplicitLeft = 320
    ExplicitTop = 230
  end
  inherited lblobs: TLabel
    Left = 8
    Top = 178
    ExplicitLeft = 8
    ExplicitTop = 178
  end
  inherited Label23: TLabel
    Left = 194
    Top = 174
    ExplicitLeft = 194
    ExplicitTop = 174
  end
  object Label3: TLabel [8]
    Left = 8
    Top = 80
    Width = 110
    Height = 18
    Caption = 'COMBUST'#205'VEL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [9]
    Left = 124
    Top = 75
    Width = 9
    Height = 23
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited edtCodigo: TEdit
    Top = 24
    Enabled = False
    ExplicitTop = 24
  end
  inherited edtCadastro: TEdit
    Left = 8
    Top = 249
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = 249
  end
  inherited edtUlt_alt: TEdit
    Left = 152
    Top = 249
    TabOrder = 3
    ExplicitLeft = 152
    ExplicitTop = 249
  end
  inherited edtcodusuario: TEdit
    Left = 320
    Top = 249
    TabOrder = 4
    ExplicitLeft = 320
    ExplicitTop = 249
  end
  object edtcombustivel: TEdit
    Left = 8
    Top = 104
    Width = 249
    Height = 21
    Alignment = taCenter
    TabOrder = 1
  end
end
