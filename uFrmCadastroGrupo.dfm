inherited FrmCadastroGrupo: TFrmCadastroGrupo
  Caption = 'Cadastro Grupo'
  ClientHeight = 234
  ClientWidth = 666
  ExplicitWidth = 682
  ExplicitHeight = 273
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblDtCadastro: TLabel
    Left = 8
    Top = 190
    ExplicitLeft = 8
    ExplicitTop = 190
  end
  inherited lblDtUlt_alt: TLabel
    Left = 152
    Top = 190
    ExplicitLeft = 152
    ExplicitTop = 190
  end
  object Label1: TLabel [3]
    Left = 8
    Top = 80
    Width = 56
    Height = 18
    Caption = 'GRUPO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited btnSalvar: TSpeedButton
    Left = 488
    Top = 190
    ExplicitLeft = 488
    ExplicitTop = 190
  end
  inherited btnSair: TSpeedButton
    Left = 584
    Top = 190
    ExplicitLeft = 584
    ExplicitTop = 190
  end
  inherited Label10: TLabel
    Left = 320
    Top = 190
    ExplicitLeft = 320
    ExplicitTop = 190
  end
  inherited lblobs: TLabel
    Left = 8
    Top = 147
    ExplicitLeft = 8
    ExplicitTop = 147
  end
  inherited Label23: TLabel
    Left = 200
    Top = 147
    ExplicitLeft = 200
    ExplicitTop = 147
  end
  object Label3: TLabel [9]
    Left = 70
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
    Enabled = False
  end
  inherited edtCadastro: TEdit
    Left = 8
    Top = 209
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = 209
  end
  inherited edtUlt_alt: TEdit
    Left = 152
    Top = 209
    TabOrder = 3
    ExplicitLeft = 152
    ExplicitTop = 209
  end
  inherited edtcodusuario: TEdit
    Left = 320
    Top = 209
    TabOrder = 4
    ExplicitLeft = 320
    ExplicitTop = 209
  end
  object edtgrupo: TEdit
    Left = 8
    Top = 99
    Width = 186
    Height = 21
    Alignment = taCenter
    TabOrder = 1
  end
end
