inherited FrmCadastroFornecedor: TFrmCadastroFornecedor
  Caption = 'Cadastro Fornecedor'
  ClientHeight = 525
  ClientWidth = 692
  OnCreate = FormCreate
  ExplicitWidth = 708
  ExplicitHeight = 564
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblDtCadastro: TLabel
    Left = 8
    Top = 481
    ExplicitLeft = 8
    ExplicitTop = 481
  end
  inherited lblDtUlt_alt: TLabel
    Left = 137
    Top = 481
    Width = 150
    Caption = 'ULTIMA  ALTERA'#199#195'O'
    ExplicitLeft = 137
    ExplicitTop = 481
    ExplicitWidth = 150
  end
  object Label1: TLabel [3]
    Left = 8
    Top = 152
    Width = 108
    Height = 18
    Caption = 'RAZ'#195'O SOCIAL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbltipo: TLabel [4]
    Left = 275
    Top = 152
    Width = 40
    Height = 18
    Caption = 'CNPJ'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [5]
    Left = 459
    Top = 152
    Width = 122
    Height = 18
    Caption = 'INSC. ESTADUAL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel [6]
    Left = 8
    Top = 301
    Width = 38
    Height = 18
    Caption = 'COD.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel [7]
    Left = 52
    Top = 301
    Width = 56
    Height = 18
    Caption = 'CIDADE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel [8]
    Left = 167
    Top = 301
    Width = 33
    Height = 18
    Caption = 'DDD'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel [9]
    Left = 275
    Top = 301
    Width = 86
    Height = 18
    Caption = 'ENDERE'#199'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label15: TLabel [10]
    Left = 471
    Top = 301
    Width = 16
    Height = 18
    Caption = 'N'#186
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label16: TLabel [11]
    Left = 539
    Top = 301
    Width = 58
    Height = 18
    Caption = 'BAIRRO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited btnSalvar: TSpeedButton
    Left = 504
    Top = 478
    ExplicitLeft = 504
    ExplicitTop = 478
  end
  inherited btnSair: TSpeedButton
    Left = 600
    Top = 478
    ExplicitLeft = 600
    ExplicitTop = 478
  end
  object Label2: TLabel [14]
    Left = 356
    Top = 224
    Width = 70
    Height = 18
    Caption = 'CELULAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [15]
    Left = 200
    Top = 224
    Width = 123
    Height = 18
    Caption = 'TEL COMERCIAL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Label10: TLabel
    Left = 296
    Top = 481
    ExplicitLeft = 296
    ExplicitTop = 481
  end
  inherited lblobs: TLabel
    Left = 8
    Top = 443
    ExplicitLeft = 8
    ExplicitTop = 443
  end
  inherited Label23: TLabel
    Left = 200
    Top = 443
    ExplicitLeft = 200
    ExplicitTop = 443
  end
  object Label4: TLabel [19]
    Left = 335
    Top = 67
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
  object Label6: TLabel [20]
    Left = 122
    Top = 142
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
  object Label7: TLabel [21]
    Left = 321
    Top = 148
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
  object Label8: TLabel [22]
    Left = 587
    Top = 142
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
  object Label17: TLabel [23]
    Left = 8
    Top = 224
    Width = 119
    Height = 18
    Caption = 'NOME FANTASIA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnPesquisacidade: TSpeedButton [24]
    Left = 212
    Top = 315
    Width = 45
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
      BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
      2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
      00FFB0857FC09F94C09F96BC988EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF55BDFFB5D6EDBF9D92BB9B8CE7DAC2FFFFE3FFFFE5FDFADAD8C3
      B3B58D85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA795FD
      EEBEFFFFD8FFFFDAFFFFDBFFFFE6FFFFFBEADDDCAE837FFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFC1A091FBDCA8FEF7D0FFFFDBFFFFE3FFFFF8FFFF
      FDFFFFFDC6A99CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1A091FEE3ACF1
      C491FCF2CAFFFFDDFFFFE4FFFFF7FFFFF7FFFFE9EEE5CBB9948CFF00FFFF00FF
      FF00FFFF00FFFF00FFC2A191FFE6AEEEB581F7DCAEFEFDD8FFFFDFFFFFE3FFFF
      E4FFFFE0F3ECD2BB968EFF00FFFF00FFFF00FFFF00FFFF00FFBC978CFBE7B7F4
      C791F2C994F8E5B9FEFCD8FFFFDDFFFFDCFFFFE0E2D2BAB68E86FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFD9C3A9FFFEE5F7DCB8F2C994F5D4A5FAE8BDFDF4
      C9FDFBD6B69089FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58D85E8
      DEDDFFFEF2F9D8A3F4C48CF9D49FFDEAB8D0B49FB89086FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFAD827FC9AA9EEFE0B7EFDFB2E7CEACB890
      86B89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFBA968ABB988CB79188FF00FFFF00FFFF00FFFF00FF}
    ParentFont = False
    OnClick = btnPesquisacidadeClick
  end
  object Label24: TLabel [25]
    Left = 8
    Top = 368
    Width = 38
    Height = 18
    Caption = 'COD.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label25: TLabel [26]
    Left = 53
    Top = 368
    Width = 81
    Height = 18
    Caption = 'CONDI'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label27: TLabel [27]
    Left = 140
    Top = 364
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
  object btnpesquisacondicao: TSpeedButton [28]
    Left = 167
    Top = 382
    Width = 46
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
      BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
      2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
      00FFB0857FC09F94C09F96BC988EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF55BDFFB5D6EDBF9D92BB9B8CE7DAC2FFFFE3FFFFE5FDFADAD8C3
      B3B58D85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA795FD
      EEBEFFFFD8FFFFDAFFFFDBFFFFE6FFFFFBEADDDCAE837FFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFC1A091FBDCA8FEF7D0FFFFDBFFFFE3FFFFF8FFFF
      FDFFFFFDC6A99CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1A091FEE3ACF1
      C491FCF2CAFFFFDDFFFFE4FFFFF7FFFFF7FFFFE9EEE5CBB9948CFF00FFFF00FF
      FF00FFFF00FFFF00FFC2A191FFE6AEEEB581F7DCAEFEFDD8FFFFDFFFFFE3FFFF
      E4FFFFE0F3ECD2BB968EFF00FFFF00FFFF00FFFF00FFFF00FFBC978CFBE7B7F4
      C791F2C994F8E5B9FEFCD8FFFFDDFFFFDCFFFFE0E2D2BAB68E86FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFD9C3A9FFFEE5F7DCB8F2C994F5D4A5FAE8BDFDF4
      C9FDFBD6B69089FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58D85E8
      DEDDFFFEF2F9D8A3F4C48CF9D49FFDEAB8D0B49FB89086FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFAD827FC9AA9EEFE0B7EFDFB2E7CEACB890
      86B89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFBA968ABB988CB79188FF00FFFF00FFFF00FFFF00FF}
    ParentFont = False
    OnClick = btnpesquisacondicaoClick
  end
  object Label18: TLabel [29]
    Left = 114
    Top = 297
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
    Top = 32
    Width = 38
    Enabled = False
    ExplicitTop = 32
    ExplicitWidth = 38
  end
  inherited edtCadastro: TEdit
    Left = 8
    Top = 500
    TabOrder = 13
    ExplicitLeft = 8
    ExplicitTop = 500
  end
  inherited edtUlt_alt: TEdit
    Left = 137
    Top = 500
    Width = 150
    TabOrder = 14
    ExplicitLeft = 137
    ExplicitTop = 500
    ExplicitWidth = 150
  end
  inherited edtcodusuario: TEdit
    Left = 296
    Top = 500
    TabOrder = 17
    ExplicitLeft = 296
    ExplicitTop = 500
  end
  object edtrazaosocial: TEdit
    Left = 8
    Top = 171
    Width = 249
    Height = 21
    TabOrder = 2
  end
  object edtcnpj: TEdit
    Left = 275
    Top = 171
    Width = 166
    Height = 21
    TabOrder = 3
    OnExit = edtcnpjExit
  end
  object edtinscestadual: TEdit
    Left = 459
    Top = 171
    Width = 145
    Height = 21
    TabOrder = 4
  end
  object edtcodcidade: TEdit
    Left = 8
    Top = 320
    Width = 33
    Height = 21
    TabOrder = 8
    OnExit = edtcodcidadeExit
  end
  object edtcidade: TEdit
    Left = 52
    Top = 320
    Width = 109
    Height = 21
    TabOrder = 15
  end
  object edtddd: TEdit
    Left = 167
    Top = 320
    Width = 33
    Height = 21
    TabOrder = 16
  end
  object edtendereco: TEdit
    Left = 275
    Top = 320
    Width = 190
    Height = 21
    TabOrder = 9
  end
  object edtnumero: TEdit
    Left = 471
    Top = 320
    Width = 62
    Height = 21
    TabOrder = 10
  end
  object edtbairro: TEdit
    Left = 539
    Top = 320
    Width = 145
    Height = 21
    TabOrder = 11
  end
  object opcoes: TRadioGroup
    Left = 8
    Top = 67
    Width = 321
    Height = 45
    Caption = 'TIPO DE FORNECEDOR'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Items.Strings = (
      'PESSOA FIS'#205'CA'
      'PESSOA JUR'#205'DICA')
    ParentFont = False
    TabOrder = 1
    OnClick = opcoesClick
  end
  object edtcelular: TEdit
    Left = 356
    Top = 243
    Width = 145
    Height = 21
    TabOrder = 7
  end
  object edttelefone: TEdit
    Left = 200
    Top = 243
    Width = 130
    Height = 21
    TabOrder = 6
  end
  object status: TRadioGroup
    Left = 376
    Top = 74
    Width = 175
    Height = 38
    Caption = 'STATUS'
    Color = clBtnFace
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Items.Strings = (
      'ATIVO'
      'INATIVO')
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 18
  end
  object edtnome_fantasia: TEdit
    Left = 8
    Top = 243
    Width = 169
    Height = 21
    TabOrder = 5
  end
  object edtcodcondicao: TEdit
    Left = 8
    Top = 387
    Width = 33
    Height = 21
    TabOrder = 12
    OnExit = edtcodcondicaoExit
  end
  object edtcondicao: TEdit
    Left = 52
    Top = 387
    Width = 109
    Height = 21
    TabOrder = 19
  end
end
