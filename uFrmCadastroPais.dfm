inherited FrmCadastroPais: TFrmCadastroPais
  AlphaBlend = True
  Caption = 'Cadastro Pa'#237's'
  ClientHeight = 363
  ClientWidth = 674
  ExplicitWidth = 690
  ExplicitHeight = 402
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblDtCadastro: TLabel
    Left = 8
    Top = 318
    ExplicitLeft = 8
    ExplicitTop = 318
  end
  inherited lblDtUlt_alt: TLabel
    Left = 152
    Top = 318
    ExplicitLeft = 152
    ExplicitTop = 318
  end
  object Label1: TLabel [3]
    Left = 8
    Top = 72
    Width = 32
    Height = 18
    Caption = 'PA'#205'S'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [4]
    Left = 8
    Top = 128
    Width = 26
    Height = 18
    Caption = 'DDI'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [5]
    Left = 8
    Top = 184
    Width = 44
    Height = 18
    Caption = 'SIGLA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited btnSalvar: TSpeedButton
    Left = 488
    Top = 318
    ExplicitLeft = 488
    ExplicitTop = 318
  end
  inherited btnSair: TSpeedButton
    Left = 584
    Top = 318
    ExplicitLeft = 584
    ExplicitTop = 318
  end
  inherited Label10: TLabel
    Left = 320
    Top = 318
    ExplicitLeft = 320
    ExplicitTop = 318
  end
  inherited lblobs: TLabel
    Left = 8
    Top = 259
    ExplicitLeft = 8
    ExplicitTop = 259
  end
  inherited Label23: TLabel
    Left = 200
    Top = 259
    ExplicitLeft = 200
    ExplicitTop = 259
  end
  object Label9: TLabel [11]
    Left = 46
    Top = 62
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
  object Label4: TLabel [12]
    Left = 40
    Top = 118
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
  object Label5: TLabel [13]
    Left = 58
    Top = 174
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
    Top = 337
    TabOrder = 4
    ExplicitLeft = 8
    ExplicitTop = 337
  end
  inherited edtUlt_alt: TEdit
    Left = 152
    Top = 337
    TabOrder = 5
    ExplicitLeft = 152
    ExplicitTop = 337
  end
  inherited edtcodusuario: TEdit
    Left = 320
    Top = 337
    TabOrder = 6
    ExplicitLeft = 320
    ExplicitTop = 337
  end
  object edtpais: TEdit
    Left = 8
    Top = 91
    Width = 161
    Height = 21
    TabOrder = 1
  end
  object edtddi: TEdit
    Left = 8
    Top = 147
    Width = 59
    Height = 21
    TabOrder = 2
  end
  object edtsigla: TEdit
    Left = 8
    Top = 203
    Width = 59
    Height = 21
    TabOrder = 3
  end
end
