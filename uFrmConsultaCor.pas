unit uFrmConsultaCor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, uFrmCadastroCor, uCores, uControllerCores, uDM;

type
  TFrmConsultaCor = class(TFrmConsulta)
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    umFrmCadastroCor: TFrmCadastroCor;
    umacor: Cores;
    umactrlcor: Controllercores;
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
  FrmConsultaCor: TFrmConsultaCor;

implementation

{$R *.dfm}

{ TFrmConsultaCor }

procedure TFrmConsultaCor.Alterar;
begin
  inherited;
  self.umactrlcor.Carregar(umacor);
  self.umFrmCadastroCor.limpaedt;
  self.umFrmCadastroCor.conhecaObj(umacor, umactrlcor);
  self.umFrmCadastroCor.carregaedt;
  self.umFrmCadastroCor.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaCor.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  self.Pesquisar;
end;

procedure TFrmConsultaCor.conhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umacor := Cores(pObj);
  umactrlcor := Controllercores(pctrl);
  self.umFrmCadastroCor.conhecaObj(umacor, umactrlcor);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlcor.getds;
end;

procedure TFrmConsultaCor.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlcor.Carregar(umacor);
  self.umFrmCadastroCor.conhecaObj(umacor, umactrlcor);
  self.umFrmCadastroCor.limpaedt;
  self.umFrmCadastroCor.carregaedt;
  self.umFrmCadastroCor.bloqueiaedt;
  mtitulo := umFrmCadastroCor.btnSalvar.Caption;
  umFrmCadastroCor.btnSalvar.Caption := '&Excluir';
  umFrmCadastroCor.ShowModal;
  self.umFrmCadastroCor.DesbloqueiaEdt;
  umFrmCadastroCor.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultaCor.Novo;
begin
  inherited;
  self.umacor.setcodigo(0);
  self.umacor.setCadastro(Date);
  self.umacor.setUlt_Alt(Date);
  self.umFrmCadastroCor.limpaedt;
  self.umFrmCadastroCor.conhecaObj(umacor, umactrlcor);
  self.umFrmCadastroCor.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaCor.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlcor.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('COR' + self.edtPesquisar.Text + 'N�O ENCONTRADA');
end;

procedure TFrmConsultaCor.Sair;
begin
  inherited;
  if self.btnsair.Caption = 'SELECIONAR' then
    umactrlcor.Carregar(umacor);

end;

procedure TFrmConsultaCor.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umFrmCadastroCor := TFrmCadastroCor(pObj);
end;

end.
