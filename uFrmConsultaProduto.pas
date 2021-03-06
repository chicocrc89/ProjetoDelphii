unit uFrmConsultaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Vcl.ComCtrls,
  Vcl.StdCtrls, uFrmCadastroProduto,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, uProdutos, uControllerProdutos, uDM;

type
  TFrmConsultaProduto = class(TFrmConsulta)
  private
    { Private declarations }
 protected
    umFrmCadastroproduto: TFrmCadastroproduto;
    umdm: TDM;
    umproduto: produtos;
    umactrlproduto: Controllerprodutos;
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
  FrmConsultaproduto: TFrmConsultaproduto;

implementation

{$R *.dfm}
{ TFrmConsultaproduto }

procedure TFrmConsultaproduto.Alterar;
begin
  inherited;
  self.umactrlproduto.Carregar(umproduto);
  self.umFrmCadastroproduto.conhecaObj(umproduto, umactrlproduto);
  self.umFrmCadastroproduto.CarregaEdt;
  umFrmCadastroproduto.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaproduto.conhecaObj(pObj: TObject; pctrl: TObject);
begin
  inherited;
  umproduto := produtos(pObj);
  umactrlproduto := Controllerprodutos(pctrl);
  self.umFrmCadastroproduto.conhecaObj(umproduto, umactrlproduto);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlproduto.getds;
end;

procedure TFrmConsultaproduto.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlproduto.Carregar(umproduto);
  self.umFrmCadastroproduto.conhecaObj(umproduto, umactrlproduto);
  self.umFrmCadastroproduto.limpaedt;
  self.umFrmCadastroproduto.CarregaEdt;
  self.umFrmCadastroproduto.bloqueiaedt;
  mtitulo := umFrmCadastroproduto.btnSalvar.Caption;
  umFrmCadastroproduto.btnSalvar.Caption := '&Excluir';
  umFrmCadastroproduto.ShowModal;
  self.umFrmCadastroproduto.DesbloqueiaEdt;
  umFrmCadastroproduto.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultaproduto.Novo;
begin
  inherited;
  self.umproduto.setcodigo(0);
  self.umproduto.setmargem(0.00);
  self.umproduto.setCadastro(Date);
  self.umproduto.setUlt_Alt(Date);
  self.umFrmCadastroproduto.limpaedt;
  self.umFrmCadastroproduto.DesbloqueiaEdt;
  self.umFrmCadastroproduto.conhecaObj(umproduto, umactrlproduto);
  self.umFrmCadastroproduto.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaproduto.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlproduto.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('produto ' + self.edtPesquisar.Text + ' N�O ENCONTRADO');
end;

procedure TFrmConsultaproduto.Sair;
begin
  if self.btnsair.Caption = 'SELECIONAR' then
    umactrlproduto.Carregar(umproduto);
  inherited;
end;

procedure TFrmConsultaproduto.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umFrmCadastroproduto := TFrmCadastroproduto(pObj);
end;

end.
