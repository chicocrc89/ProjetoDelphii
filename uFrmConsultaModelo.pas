unit uFrmConsultaModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Data.DB, Vcl.Grids,
  uFrmCadastroModelo, uControllerModelos,
  uModelos, uDM, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmConsultaModelo = class(TFrmConsulta)
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    umFrmCadastroModelo: TFrmCadastroModelo;
    ummodelo: Modelos;
    umactrlmodelo: ControllerModelos;
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
  FrmConsultaModelo: TFrmConsultaModelo;

implementation

{$R *.dfm}
{ TFrmConsultaModelo }

procedure TFrmConsultaModelo.Alterar;
begin
  self.umactrlmodelo.Carregar(ummodelo);
  self.umFrmCadastroModelo.limpaedt;
  self.umFrmCadastroModelo.conhecaObj(ummodelo, umactrlmodelo);
  self.umFrmCadastroModelo.carregaedt;
  self.umFrmCadastroModelo.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaModelo.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  self.Pesquisar;
end;

procedure TFrmConsultaModelo.conhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  ummodelo := Modelos(pObj);
  umactrlmodelo := ControllerModelos(pctrl);
  self.umFrmCadastroModelo.conhecaObj(ummodelo, umactrlmodelo);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlmodelo.getds;
end;

procedure TFrmConsultaModelo.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlmodelo.Carregar(ummodelo);
  self.umFrmCadastroModelo.conhecaObj(ummodelo, umactrlmodelo);
  self.umFrmCadastroModelo.limpaedt;
  self.umFrmCadastroModelo.carregaedt;
  self.umFrmCadastroModelo.bloqueiaedt;
  mtitulo := umFrmCadastroModelo.btnSalvar.Caption;
  umFrmCadastroModelo.btnSalvar.Caption := '&Excluir';
  umFrmCadastroModelo.ShowModal;
  self.umFrmCadastroModelo.DesbloqueiaEdt;
  umFrmCadastroModelo.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultaModelo.Novo;
begin
  inherited;
  self.ummodelo.setcodigo(0);
  self.ummodelo.setCadastro(Date);
  self.ummodelo.setUlt_Alt(Date);
  self.umFrmCadastroModelo.limpaedt;
  self.umFrmCadastroModelo.DesbloqueiaEdt;
  self.umFrmCadastroModelo.conhecaObj(ummodelo, umactrlmodelo);
  self.umFrmCadastroModelo.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaModelo.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlmodelo.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('MODELO' + self.edtPesquisar.Text + 'NÃO ENCONTRADO');
end;

procedure TFrmConsultaModelo.Sair;
begin
  if self.btnsair.Caption = 'SELECIONAR' then
    umactrlmodelo.Carregar(ummodelo);
  inherited;
end;

procedure TFrmConsultaModelo.SetFrmCadastro(pObj: TObject);
begin
  umFrmCadastroModelo := TFrmCadastroModelo(pObj);
end;

end.
