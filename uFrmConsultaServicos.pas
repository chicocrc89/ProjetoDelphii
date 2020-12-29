unit uFrmConsultaServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, uFrmCadastroServicos, uServicos, uDM, uControllerServicos;

type
  TFrmConsultaServicos = class(TFrmConsulta)
  private
    { Private declarations }
  protected
    umFrmCadastroservico: TFrmCadastroServicos;
    umservico: Servicos;
    umactrlservico: Controllerservicos;
    umdm: TDM;
    procedure Novo; Override;
    procedure Alterar; Override;
    procedure Excluir; Override;
    procedure Sair; Override;
    procedure Pesquisar; Override;
  public
    { Public declarations }
    procedure conhecaObj(pObj: TObject; pctrl: TObject); Override;
    procedure SetFrmCadastro(pObj: TObject); Override;
  end;

var
  FrmConsultaServicos: TFrmConsultaServicos;

implementation

{$R *.dfm}

{ TFrmConsultaServicos }

procedure TFrmConsultaServicos.Alterar;
begin
  inherited;
  self.umactrlservico.Carregar(umservico);
  self.umFrmCadastroservico.limpaedt;
  self.umFrmCadastroservico.conhecaObj(umservico, umactrlservico);
  self.umFrmCadastroservico.carregaedt;
  self.umFrmCadastroservico.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaServicos.conhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umservico := servicos(pObj);
  umactrlservico := Controllerservicos(pctrl);
  self.umFrmCadastroservico.conhecaObj(umservico, umactrlservico);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlservico.getds;
end;

procedure TFrmConsultaServicos.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlservico.Carregar(umservico);
  self.umFrmCadastroservico.conhecaObj(umservico, umactrlservico);
  self.umFrmCadastroservico.limpaedt;
  self.umFrmCadastroservico.carregaedt;
  self.umFrmCadastroservico.bloqueiaedt;
  mtitulo := umFrmCadastroservico.btnSalvar.Caption;
  umFrmCadastroservico.btnSalvar.Caption := '&Excluir';
  umFrmCadastroservico.ShowModal;
  self.umFrmCadastroservico.DesbloqueiaEdt;
  umFrmCadastroservico.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultaServicos.Novo;
begin
  inherited;
  self.umservico.setcodigo(0);
  self.umservico.setCadastro(Date);
  self.umservico.setUlt_Alt(Date);
  self.umFrmCadastroservico.limpaedt;
  self.umFrmCadastroservico.conhecaObj(umservico, umactrlservico);
  self.umFrmCadastroservico.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaServicos.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlservico.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('SERVIÇO' + self.edtPesquisar.Text + 'NÃO ENCONTRADO');
end;

procedure TFrmConsultaServicos.Sair;
begin
  inherited;
  if self.btnSair.Caption = 'SELECIONAR' then
  umactrlservico.Carregar(umservico);
end;

procedure TFrmConsultaServicos.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umfrmcadastroservico := TFrmcadastroServicos(pObj);
end;

end.
