unit uFrmCadastroContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.Samples.Spin,
  Vcl.ExtCtrls, uContasPagar, uControllerContasPagar, uFrmConsultaFormaPagamento, uFrmConsultaFornecedor;

type
  TFrmCadastroContasPagar = class(TFrmCadastro)
    edtserie: TEdit;
    edtmodelo: TEdit;
    edtdataemissao: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    btnpesquisarfornecedor: TSpeedButton;
    edtcodfornecedor: TEdit;
    edtfornecedor: TEdit;
    Label4: TLabel;
    edtnumparcela: TSpinEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtdatavencimento: TDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    edtcodformapagamento: TEdit;
    Label12: TLabel;
    edtformapagamento: TEdit;
    btnpesquisaformapagamento: TSpeedButton;
    Label13: TLabel;
    Label14: TLabel;
    btnbaixar: TSpeedButton;
    edtvalor: TMaskEdit;
    edtjuros: TMaskEdit;
    edtmulta: TMaskEdit;
    edtdesconto: TMaskEdit;
    edtvalorpago: TMaskEdit;
    edtdatapagamento: TDateTimePicker;
    procedure edtcodfornecedorExit(Sender: TObject);
    procedure edtcodformapagamentoExit(Sender: TObject);
    procedure btnpesquisaformapagamentoClick(Sender: TObject);
    procedure btnpesquisarfornecedorClick(Sender: TObject);
    procedure btnbaixarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    umfrmconsultafornecedor: TFrmConsultaFornecedor;
    umfrmconsultaformapagamento : TFrmconsultaformapagamento;
    umacontapagar : ContasPagar;
    umactrlcontapagar : ControllerContasPagar;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pctrl: TObject); Override;
    procedure Salvar; Override;
    procedure Sair; Override;
    procedure CarregaEdt; Override;
    procedure LimpaEdt; Override;
    procedure BloqueiaEdt; Override;
    procedure bloqueiapagamento;
    procedure liberapagamento;
    procedure DesbloqueiaEdt; Override;
    procedure SetFrmConsultaFornecedor(pObj: TObject);
    procedure SetFrmConsultaFormapagamento(pObj: TObject);
  end;

var
  FrmCadastroContasPagar: TFrmCadastroContasPagar;

implementation

{$R *.dfm}

{ TFrmCadastroContasPagar }

procedure TFrmCadastroContasPagar.BloqueiaEdt;
begin
  inherited;
  self.edtCodigo.Enabled            := false;
  self.edtserie.Enabled             := false;
  self.edtmodelo.Enabled            := false;
  self.edtdataemissao.Enabled       := false;
  self.edtcodfornecedor.Enabled     := false;
  self.edtfornecedor.Enabled        := false;
  self.edtvalor.Enabled             := false;
  self.edtdatavencimento.Enabled    := false;
  self.edtjuros.Enabled             := false;
  self.edtmulta.Enabled             := false;
  self.edtdesconto.Enabled          := false;
  self.edtcodformapagamento.Enabled := false;
  self.edtformapagamento.Enabled    := false;
  self.edtCadastro.Enabled          := false;
  self.edtUlt_alt.Enabled           := false;
  self.edtcodusuario.Enabled        := false;
  self.edtvalorpago.Enabled         := false;
end;

procedure TFrmCadastroContasPagar.bloqueiapagamento;
begin
  self.edtvalorpago.Enabled := false;
  self.edtdatapagamento.Enabled := false;
  self.btnbaixar.Enabled := false;
end;

procedure TFrmCadastroContasPagar.btnbaixarClick(Sender: TObject);
begin
  inherited;
  self.Salvar;
end;

procedure TFrmCadastroContasPagar.btnpesquisaformapagamentoClick(
  Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultaformapagamento.btnSair.Caption;
  umfrmconsultaformapagamento.btnSair.Caption := 'SELECIONAR';
  umfrmconsultaformapagamento.ConhecaObj(umacontapagar.getumaformapagamento,umactrlcontapagar.getctrlformapagamento);
  umfrmconsultaformapagamento.ShowModal;

  umfrmconsultaformapagamento.btnSair.Caption := mbotao;
  self.edtcodformapagamento.Text := inttostr(umacontapagar.getumaformapagamento.getcodigo);
  self.edtformapagamento.Text := umacontapagar.getumaformapagamento.getpagamento;
end;

procedure TFrmCadastroContasPagar.btnpesquisarfornecedorClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultafornecedor.btnSair.Caption;
  umfrmconsultafornecedor.btnSair.Caption := 'SELECIONAR';
  umfrmconsultafornecedor.ConhecaObj(umacontapagar.getumfornecedor, umactrlcontapagar.getctrlfornecedor);
  umfrmconsultafornecedor.ShowModal;

  umfrmconsultafornecedor.btnSair.Caption := mbotao;
  self.edtcodfornecedor.Text := inttostr(umacontapagar.getumfornecedor.getcodigo);
  self.edtfornecedor.Text := umacontapagar.getumfornecedor.getrazao;
end;

procedure TFrmCadastroContasPagar.CarregaEdt;
begin
  inherited;
  self.edtCodigo.Text := inttostr(umacontapagar.getnumero_nota);
  self.edtserie.Text  := umacontapagar.getserie;
  self.edtmodelo.Text := umacontapagar.getmodelo;
  self.edtdataemissao.Date := umacontapagar.getdata_emissao;
  self.edtcodfornecedor.Text := inttostr(umacontapagar.getumfornecedor.getCodigo);
  self.edtfornecedor.Text := umacontapagar.getumfornecedor.getrazao;
  self.edtnumparcela.Text := inttostr(umacontapagar.getnumero_parcela);
  self.edtvalor.Text := Currtostr(umacontapagar.getvalor_parcela);
  self.edtdatavencimento.Date := umacontapagar.getdata_vencimento;
  self.edtjuros.Text := Currtostr(umacontapagar.getjuros);
  self.edtmulta.Text := Currtostr(umacontapagar.getmulta);
  self.edtdesconto.Text := Currtostr(umacontapagar.getdesconto);
  self.edtdesconto.Text := CurrtoStr(umacontapagar.getdesconto);
  self.edtcodformapagamento.Text := inttostr(umacontapagar.getumaformapagamento.getCodigo);
  self.edtformapagamento.Text := umacontapagar.getumaformapagamento.getpagamento;
  self.edtCadastro.Text := DateToStr(umacontapagar.getCadastro);
  self.edtUlt_alt.Text := DateToStr(umacontapagar.getUlt_Alt);
end;

procedure TFrmCadastroContasPagar.ConhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umacontapagar := ContasPagar(pObj);
  umactrlcontapagar := Controllercontaspagar(pctrl);
  self.edtCodigo.Text := inttostr(self.umacontapagar.getnumero_nota);
  self.edtCadastro.Text := DateToStr(self.umacontapagar.getCadastro);
  self.edtUlt_alt.Text := DateToStr(self.umacontapagar.getUlt_Alt);
  self.edtdatapagamento.Date := now;
end;

procedure TFrmCadastroContasPagar.DesbloqueiaEdt;
begin
  inherited;
  self.edtCodigo.Enabled            := true;
  self.edtserie.Enabled             := true;
  self.edtmodelo.Enabled            := true;
  self.edtdataemissao.Enabled       := true;
  self.edtcodfornecedor.Enabled     := true;
  self.edtvalor.Enabled             := true;
  self.edtdatavencimento.Enabled    := true;
  self.edtjuros.Enabled             := true;
  self.edtmulta.Enabled             := true;
  self.edtdesconto.Enabled          := true;
  self.edtcodformapagamento.Enabled := true;
  self.edtformapagamento.Enabled    := true;
  self.edtCadastro.Enabled          := true;
  self.edtUlt_alt.Enabled           := true;
  self.edtcodusuario.Enabled        := true;
  self.edtvalorpago.Enabled         := true;
end;

procedure TFrmCadastroContasPagar.edtcodformapagamentoExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlcontapagar.getctrlformapagamento.Pesquisar(self.edtcodformapagamento.Text);
  umactrlcontapagar.getctrlformapagamento.Carregar(umacontapagar.getumaformapagamento);
  self.edtcodformapagamento.Text := inttostr(umacontapagar.getumaformapagamento.getcodigo);
  self.edtformapagamento.Text := umacontapagar.getumaformapagamento.getpagamento;
  if self.edtcodformapagamento.Text = inttostr(0) then
  begin
    ShowMessage('Forma de Pagamento n�o encontrada');
    self.edtcodformapagamento.SetFocus;
  end;
end;

procedure TFrmCadastroContasPagar.edtcodfornecedorExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlcontapagar.getctrlfornecedor.Pesquisar(self.edtcodfornecedor.Text);
  umactrlcontapagar.getctrlfornecedor.Carregar(umacontapagar.getumfornecedor);
  self.edtcodfornecedor.Text := inttostr(umacontapagar.getumfornecedor.getcodigo);
  self.edtfornecedor.Text := umacontapagar.getumfornecedor.getrazao;
  if self.edtcodfornecedor.Text = inttostr(0) then
  begin
    ShowMessage('Fornecedor n�o encontrado');
    self.edtcodfornecedor.SetFocus;
  end;
end;

procedure TFrmCadastroContasPagar.liberapagamento;
begin
  self.edtvalorpago.Enabled := true;
  self.btnbaixar.Enabled := true;
end;

procedure TFrmCadastroContasPagar.LimpaEdt;
begin
  inherited;
  self.edtCodigo.Clear;
  self.edtserie.Clear;
  self.edtmodelo.Clear;
  self.edtcodfornecedor.Clear;
  self.edtfornecedor.Clear;
  self.edtnumparcela.Clear;
  self.edtvalor.Clear;
  self.edtjuros.Clear;
  self.edtmulta.Clear;
  self.edtdesconto.Clear;
  self.edtcodformapagamento.Clear;
  self.edtformapagamento.Clear;
  self.edtCadastro.Clear;
  self.edtUlt_alt.Clear;
  self.edtcodusuario.Clear;
end;

procedure TFrmCadastroContasPagar.Sair;
begin
  inherited;

end;

procedure TFrmCadastroContasPagar.Salvar;
var mdatapagamento : string;
    mvalorpago : Currency;
begin
  inherited;
  if self.btnSalvar.Caption = '&Excluir' then
  begin
    If Application.MessageBox('Confirma Exclus�o ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.umactrlcontapagar.Excluir(umacontapagar);
      ShowMessage('Excluido com Sucesso!!!');
      self.Sair;
    end;
  end
  else if self.edtCodigo.Text = '' then
  begin
    showmessage('Campo N� Nota precisa ser preenchido!');
    self.edtCodigo.SetFocus;
  end
  else
  begin
      umacontapagar.Setnumero_nota(strtoint(self.edtCodigo.Text));
      umacontapagar.Setserie(self.edtserie.Text);
      umacontapagar.setmodelo(self.edtmodelo.Text);
      umacontapagar.setdata_emissao(self.edtdataemissao.Date);
      umacontapagar.getumfornecedor.setCodigo(strtoint(self.edtcodfornecedor.Text));
      umacontapagar.setnumero_parcela(strtoint(self.edtnumparcela.Text));
      umacontapagar.setvalor_parcela(strtoCurr(self.edtvalor.Text));
      umacontapagar.setdata_vencimento(self.edtdatavencimento.Date);
      umacontapagar.setjuros(strtoCurr(self.edtjuros.Text));
      umacontapagar.setmulta(strtoCurr(self.edtmulta.Text));
      umacontapagar.setdesconto(strtoCurr(self.edtdesconto.Text));
      umacontapagar.getumaformapagamento.setCodigo(strtoint(self.edtcodformapagamento.Text));
      if self.edtdatapagamento.Enabled = false then
      begin
        mvalorpago := 0;
      end
      else
      begin
        umacontapagar.setdata_pagamento(self.edtdatapagamento.Date);
        umacontapagar.setvalor_pago(strtoCurr(self.edtvalorpago.Text));
      end;
      umacontapagar.setCadastro(StrToDate(self.edtCadastro.Text));
      umacontapagar.setUlt_Alt(StrToDate(self.edtUlt_alt.Text));
      umactrlcontapagar.Salvar(umacontapagar.clone);
      ShowMessage('Contas a Pagar Baixado com Sucesso!!!');
      self.Sair;
  end;

end;

procedure TFrmCadastroContasPagar.SetFrmConsultaFormapagamento(pObj: TObject);
begin
  umfrmconsultaformapagamento := TFrmConsultaFormaPagamento(Pobj);
end;

procedure TFrmCadastroContasPagar.SetFrmConsultaFornecedor(pObj: TObject);
begin
  umfrmconsultafornecedor := TFrmConsultaFornecedor(pObj);
end;

end.
