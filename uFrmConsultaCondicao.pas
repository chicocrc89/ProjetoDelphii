unit uFrmConsultaCondicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, uFrmCadastroCondicao, uCondicoes, uControllerCondicoes, uDM, uColecaoParcelas;

type
  TFrmConsultaCondicao = class(TFrmConsulta)
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
    umFrmCadastroCondicao: TFrmCadastroCondicao;
    umaCondicao: Condicoes;
    umactrlcondicao: ControllerCondicoes;
    umdm: TDM;
  protected
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
  FrmConsultaCondicao: TFrmConsultaCondicao;

implementation

{$R *.dfm}

{ TFrmConsultaCondicao }

procedure TFrmConsultaCondicao.Alterar;
begin
  inherited;
  self.umactrlcondicao.Carregar(umacondicao);
  self.umFrmCadastroCondicao.conhecaObj(umacondicao, umactrlcondicao);
  self.umFrmCadastroCondicao.CarregaEdt;
  self.umFrmCadastroCondicao.carregaLV;
  self.umFrmCadastroCondicao.spinedtparcela.Enabled := false;
  umFrmCadastroCondicao.ShowModal;
  self.umFrmCadastroCondicao.spinedtparcela.Enabled := true;
  self.Pesquisar;
end;

procedure TFrmConsultaCondicao.btnNovoClick(Sender: TObject);
begin
  inherited;
  umfrmcadastrocondicao.ShowModal;
  self.umFrmCadastroCondicao.ListView1.Clear;
end;

procedure TFrmConsultaCondicao.conhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umacondicao := Condicoes(pObj);
  umactrlcondicao := Controllercondicoes(pctrl);
  self.umFrmCadastrocondicao.conhecaObj(umacondicao, umactrlcondicao);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlcondicao.getds;
end;

procedure TFrmConsultaCondicao.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlcondicao.Carregar(umacondicao);
  self.umFrmCadastrocondicao.conhecaObj(umacondicao, umactrlcondicao);
  self.umFrmCadastrocondicao.limpaedt;
  self.umFrmCadastrocondicao.CarregaEdt;
  self.umFrmCadastrocondicao.bloqueiaedt;
  self.umFrmCadastroCondicao.carregaLV;
  mtitulo := umFrmCadastrocondicao.btnSalvar.Caption;
  umFrmCadastrocondicao.btnSalvar.Caption := '&Excluir';
  umFrmCadastrocondicao.ShowModal;
  self.umFrmCadastrocondicao.DesbloqueiaEdt;
  umFrmCadastrocondicao.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultaCondicao.Novo;
begin
  inherited;
  self.umacondicao.setcodigo(0);
  self.umaCondicao.getumacolecaop.setQtd(0);
  self.umacondicao.setCadastro(Date);
  self.umacondicao.setUlt_Alt(Date);
  self.umFrmCadastrocondicao.limpaedt;
  self.umFrmCadastrocondicao.DesbloqueiaEdt;
  self.umFrmCadastroCondicao.btnSalvar.Enabled := false;
  self.umFrmCadastroCondicao.btnadicionar.Enabled := false;
  self.umFrmCadastrocondicao.conhecaObj(umacondicao, umactrlcondicao);
  self.umFrmCadastrocondicao.ShowModal;
  self.Pesquisar;

end;

procedure TFrmConsultaCondicao.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlcondicao.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('CONDICAO ' + self.edtPesquisar.Text + ' N�O ENCONTRADA');
end;

procedure TFrmConsultaCondicao.Sair;
begin
  if self.btnsair.Caption = 'SELECIONAR' then
  umactrlcondicao.Carregar(umacondicao);
  inherited;

end;

procedure TFrmConsultaCondicao.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umfrmcadastrocondicao := TFrmCadastroCondicao (pObj);
end;

end.
