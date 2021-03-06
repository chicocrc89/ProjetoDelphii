unit uFrmConsultaCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, uControllerCombustiveis, uCombustiveis, uFrmCadastroCombustivel, uDM;

type
  TFrmConsultaCombustivel = class(TFrmConsulta)
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    umFrmCadastroCombustivel: TFrmCadastroCombustivel;
    umcombustivel: Combustiveis;
    umactrlcombustivel: Controllercombustiveis;
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
  FrmConsultaCombustivel: TFrmConsultaCombustivel;

implementation

{$R *.dfm}

{ TFrmConsultaCombustivel }

procedure TFrmConsultaCombustivel.Alterar;
begin
  inherited;
  self.umactrlcombustivel.Carregar(umcombustivel);
  self.umFrmCadastroCombustivel.limpaedt;
  self.umFrmCadastroCombustivel.conhecaObj(umcombustivel, umactrlcombustivel);
  self.umFrmCadastroCombustivel.carregaedt;
  self.umFrmCadastroCombustivel.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaCombustivel.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  self.Pesquisar;
end;

procedure TFrmConsultaCombustivel.conhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umcombustivel := Combustiveis(pObj);
  umactrlcombustivel := Controllercombustiveis(pctrl);
  self.umFrmCadastroCombustivel.conhecaObj(umcombustivel, umactrlcombustivel);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlcombustivel.getds;
end;

procedure TFrmConsultaCombustivel.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlcombustivel.Carregar(umcombustivel);
  self.umFrmCadastroCombustivel.conhecaObj(umcombustivel, umactrlcombustivel);
  self.umFrmCadastroCombustivel.limpaedt;
  self.umFrmCadastroCombustivel.carregaedt;
  self.umFrmCadastroCombustivel.bloqueiaedt;
  mtitulo := umFrmCadastroCombustivel.btnSalvar.Caption;
  umFrmCadastroCombustivel.btnSalvar.Caption := '&Excluir';
  umFrmCadastroCombustivel.ShowModal;
  self.umFrmCadastroCombustivel.DesbloqueiaEdt;
  umFrmCadastroCombustivel.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultaCombustivel.Novo;
begin
  inherited;
  self.umcombustivel.setcodigo(0);
  self.umcombustivel.setCadastro(Date);
  self.umcombustivel.setUlt_Alt(Date);
  self.umFrmCadastroCombustivel.limpaedt;
  self.umFrmCadastroCombustivel.conhecaObj(umcombustivel, umactrlcombustivel);
  self.umFrmCadastroCombustivel.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaCombustivel.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlcombustivel.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('COMBUSTIVEL' + self.edtPesquisar.Text + 'N�O ENCONTRADO');
end;

procedure TFrmConsultaCombustivel.Sair;
begin
  inherited;
  if self.btnsair.Caption = 'SELECIONAR' then
    umactrlcombustivel.Carregar(umcombustivel);

end;

procedure TFrmConsultaCombustivel.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umfrmcadastrocombustivel := TFrmCadastroCombustivel (pObj);
end;

end.
