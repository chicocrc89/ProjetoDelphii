unit uFrmConsultaFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Data.DB, Vcl.Grids, uDM,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, uFrmCadastroFuncionario,
  uFuncionarios, uControllerFuncionarios;

type
  TFrmConsultaFuncionario = class(TFrmConsulta)
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    umFrmCadastrofuncionario: TFrmCadastroFuncionario;
    umdm: TDM;
    umfuncionario: Funcionarios;
    umactrlfuncionario: ControllerFuncionarios;
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
  FrmConsultaFuncionario: TFrmConsultaFuncionario;

implementation

{$R *.dfm}

procedure TFrmConsultaFuncionario.Alterar;
begin
  inherited;
  self.umactrlfuncionario.Carregar(umfuncionario);
  self.umFrmCadastrofuncionario.conhecaObj(umfuncionario, umactrlfuncionario);
  self.umFrmCadastrofuncionario.CarregaEdt;
  self.umFrmCadastrofuncionario.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaFuncionario.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  self.Pesquisar;
end;

procedure TFrmConsultaFuncionario.conhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umfuncionario := Funcionarios(pObj);
  umactrlfuncionario := ControllerFuncionarios(pctrl);
  self.umFrmCadastrofuncionario.conhecaObj(umfuncionario, umactrlfuncionario);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlfuncionario.getds;
end;

procedure TFrmConsultaFuncionario.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlfuncionario.Carregar(umfuncionario);
  self.umFrmCadastrofuncionario.conhecaObj(umfuncionario, umactrlfuncionario);
  self.umFrmCadastrofuncionario.LimpaEdt;
  self.umFrmCadastrofuncionario.CarregaEdt;
  self.umFrmCadastrofuncionario.BloqueiaEdt;
  mtitulo := umFrmCadastrofuncionario.btnSalvar.Caption;
  umFrmCadastrofuncionario.btnSalvar.Caption := '&Excluir';
  umFrmCadastrofuncionario.ShowModal;
  self.umFrmCadastrofuncionario.DesbloqueiaEdt;
  self.umFrmCadastrofuncionario.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultaFuncionario.Novo;
begin
  inherited;
  self.umfuncionario.setCodigo(0);
  self.umfuncionario.setCadastro(Date);
  self.umfuncionario.setUlt_Alt(Date);
  self.umFrmCadastrofuncionario.LimpaEdt;
  self.umFrmCadastrofuncionario.DesbloqueiaEdt;
  self.umFrmCadastrofuncionario.conhecaObj(umfuncionario, umactrlfuncionario);
  self.umFrmCadastrofuncionario.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaFuncionario.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlfuncionario.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('FUNCIONARIO ' + self.edtPesquisar.Text + ' N�O ENCONTRADO');
end;

procedure TFrmConsultaFuncionario.Sair;
begin
  if self.btnsair.Caption = 'SELECIONAR' then
    umactrlfuncionario.Carregar(umfuncionario);
  inherited;

end;

procedure TFrmConsultaFuncionario.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umFrmCadastrofuncionario := TFrmCadastroFuncionario(pObj);
end;

end.
