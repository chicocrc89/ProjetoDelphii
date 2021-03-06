unit uFrmConsultaFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Vcl.ComCtrls,
  Vcl.StdCtrls, uFrmCadastroFornecedor,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, uDM, uControllerFornecedores, uFornecedores;

type
  TFrmConsultaFornecedor = class(TFrmConsulta)
    mmtablefornecedor: TFDMemTable;
  private
    { Private declarations }
  protected
    umFrmCadastrofornecedor: TFrmCadastrofornecedor;
    umdm: TDM;
    umfornecedor: fornecedores;
    umactrlfornecedor: Controllerfornecedores;
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
  FrmConsultafornecedor: TFrmConsultafornecedor;

implementation

{$R *.dfm}
{ TFrmConsultafornecedor }

procedure TFrmConsultafornecedor.Alterar;
begin
  inherited;
  self.umactrlfornecedor.Carregar(umfornecedor);
  self.umFrmCadastrofornecedor.conhecaObj(umfornecedor, umactrlfornecedor);
  self.umFrmCadastrofornecedor.CarregaEdt;
  umFrmCadastrofornecedor.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultafornecedor.conhecaObj(pObj: TObject; pctrl: TObject);
begin
  inherited;
  umfornecedor := fornecedores(pObj);
  umactrlfornecedor := Controllerfornecedores(pctrl);
  self.umFrmCadastrofornecedor.conhecaObj(umfornecedor, umactrlfornecedor);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlfornecedor.getds;
end;

procedure TFrmConsultafornecedor.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlfornecedor.Carregar(umfornecedor);
  self.umFrmCadastrofornecedor.conhecaObj(umfornecedor, umactrlfornecedor);
  self.umFrmCadastrofornecedor.limpaedt;
  self.umFrmCadastrofornecedor.CarregaEdt;
  self.umFrmCadastrofornecedor.bloqueiaedt;
  mtitulo := umFrmCadastrofornecedor.btnSalvar.Caption;
  umFrmCadastrofornecedor.btnSalvar.Caption := '&Excluir';
  umFrmCadastrofornecedor.ShowModal;
  self.umFrmCadastrofornecedor.DesbloqueiaEdt;
  umFrmCadastrofornecedor.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultafornecedor.Novo;
begin
  inherited;
  self.umfornecedor.setcodigo(0);
  self.umfornecedor.setCadastro(Date);
  self.umfornecedor.setUlt_Alt(Date);
  self.umFrmCadastrofornecedor.limpaedt;
  self.umFrmCadastrofornecedor.DesbloqueiaEdt;
  self.umFrmCadastrofornecedor.conhecaObj(umfornecedor, umactrlfornecedor);
  self.umFrmCadastrofornecedor.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultafornecedor.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlfornecedor.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('fornecedor ' + self.edtPesquisar.Text + ' N�O ENCONTRADO');
end;

procedure TFrmConsultafornecedor.Sair;
begin
  inherited;
  if self.btnsair.Caption = 'SELECIONAR' then
    umactrlfornecedor.Carregar(umfornecedor);
end;

procedure TFrmConsultafornecedor.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umFrmCadastrofornecedor := TFrmCadastrofornecedor(pObj);
end;

end.
