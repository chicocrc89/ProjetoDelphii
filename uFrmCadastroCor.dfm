inherited FrmCadastroCor: TFrmCadastroCor
  Caption = 'Cadastro Cor'
  ClientHeight = 239
  ClientWidth = 702
  ExplicitWidth = 718
  ExplicitHeight = 278
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblDtCadastro: TLabel
    Left = 8
    Top = 191
    ExplicitLeft = 8
    ExplicitTop = 191
  end
  inherited lblDtUlt_alt: TLabel
    Left = 152
    Top = 191
    ExplicitLeft = 152
    ExplicitTop = 191
  end
  inherited btnSalvar: TSpeedButton
    Left = 512
    Top = 188
    ExplicitLeft = 512
    ExplicitTop = 188
  end
  inherited btnSair: TSpeedButton
    Left = 608
    Top = 188
    ExplicitLeft = 608
    ExplicitTop = 188
  end
  inherited Label10: TLabel
    Left = 320
    Top = 191
    ExplicitLeft = 320
    ExplicitTop = 191
  end
  inherited lblobs: TLabel
    Top = 149
    ExplicitTop = 149
  end
  inherited Label23: TLabel
    Top = 149
    ExplicitTop = 149
  end
  object Label3: TLabel [8]
    Left = 8
    Top = 80
    Width = 34
    Height = 18
    Caption = 'COR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [9]
    Left = 48
    Top = 76
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
    Width = 36
    Enabled = False
    ExplicitWidth = 36
  end
  inherited edtCadastro: TEdit
    Left = 8
    Top = 210
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = 210
  end
  inherited edtUlt_alt: TEdit
    Left = 152
    Top = 210
    TabOrder = 3
    ExplicitLeft = 152
    ExplicitTop = 210
  end
  inherited edtcodusuario: TEdit
    Left = 320
    Top = 210
    TabOrder = 4
    ExplicitLeft = 320
    ExplicitTop = 210
  end
  object edtcor: TEdit
    Left = 8
    Top = 104
    Width = 184
    Height = 21
    Alignment = taCenter
    TabOrder = 1
  end
end
