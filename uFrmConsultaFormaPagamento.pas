unit uFrmConsultaFormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Data.DB, Vcl.Grids, uDM,
  uFormaPagamentos, uFrmCadastroFormaPagamento,
  uControllerFormaPagamentos, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmConsultaFormaPagamento = class(TFrmConsulta)
  private
    { Private declarations }
  protected
    umFrmCadastroFormaPagamento: TFrmCadastroFormaPagamento;
    umaformapagamento: FormaPagamentos;
    umactrlformapagamento: Controllerformapagamentos;
    umdm: TDM;
    procedure Novo; Override;
    procedure Alterar; Override;
    procedure Excluir; Override;
    procedure Sair; Override;
    procedure Pesquisar; Override;
  public
    procedure conhecaObj(pObj: TObject; pctrl: TObject); Override;
    procedure SetFrmCadastro(pObj: TObject); Override;
  end;

var
  FrmConsultaFormaPagamento: TFrmConsultaFormaPagamento;

implementation

{$R *.dfm}
{ TFrmConsultaFormaPagamento }

procedure TFrmConsultaFormaPagamento.Alterar;
begin
  inherited;
  self.umactrlformapagamento.Carregar(umaformapagamento);
  self.umFrmCadastroFormaPagamento.limpaedt;
  self.umFrmCadastroFormaPagamento.conhecaObj(umaformapagamento,
    umactrlformapagamento);
  self.umFrmCadastroFormaPagamento.carregaedt;
  self.umFrmCadastroFormaPagamento.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaFormaPagamento.conhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umaformapagamento := FormaPagamentos(pObj);
  umactrlformapagamento := Controllerformapagamentos(pctrl);
  self.umFrmCadastroFormaPagamento.conhecaObj(umaformapagamento,
    umactrlformapagamento);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlformapagamento.getds;
end;

procedure TFrmConsultaFormaPagamento.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlformapagamento.Carregar(umaformapagamento);
  self.umFrmCadastroFormaPagamento.conhecaObj(umaformapagamento,
    umactrlformapagamento);
  self.umFrmCadastroFormaPagamento.limpaedt;
  self.umFrmCadastroFormaPagamento.carregaedt;
  self.umFrmCadastroFormaPagamento.bloqueiaedt;
  mtitulo := umFrmCadastroFormaPagamento.btnSalvar.Caption;
  umFrmCadastroFormaPagamento.btnSalvar.Caption := '&Excluir';
  umFrmCadastroFormaPagamento.ShowModal;
  self.umFrmCadastroFormaPagamento.DesbloqueiaEdt;
  umFrmCadastroFormaPagamento.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultaFormaPagamento.Novo;
begin
  inherited;
  self.umaformapagamento.setCodigo(0);
  self.umaformapagamento.setCadastro(Date);
  self.umaformapagamento.setUlt_Alt(Date);
  self.umFrmCadastroFormaPagamento.limpaedt;
  self.umFrmCadastroFormaPagamento.conhecaObj(umaformapagamento,
    umactrlformapagamento);
  self.umFrmCadastroFormaPagamento.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaFormaPagamento.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlformapagamento.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('FORMA DE PAGAMENTO' + self.edtPesquisar.Text +
      'N�O ENCONTRADO');
end;

procedure TFrmConsultaFormaPagamento.Sair;
begin
  if self.btnSair.Caption = 'SELECIONAR' then
    umactrlformapagamento.Carregar(umaformapagamento);
  inherited;

end;

procedure TFrmConsultaFormaPagamento.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umFrmCadastroFormaPagamento := TFrmCadastroFormaPagamento(pObj);
end;

end.
