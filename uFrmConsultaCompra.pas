unit uFrmConsultaCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, uFrmCadastroCompra, uCompras, uControllerCompras, uDM;

type
  TFrmConsultaCompra = class(TForm)
    btnNovo: TSpeedButton;
    btnSair: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnPesquisar: TSpeedButton;
    edtPesquisar: TEdit;
    DBGrid1: TDBGrid;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
 private
    { Private declarations }
  protected
    umFrmCadastrocompra: TFrmCadastrocompra;
    umdm: TDM;
    umacompra: compras;
    umactrlcompra: Controllercompras;
    procedure Novo;
    procedure Alterar;
    procedure Excluir;
    procedure Sair;
    procedure Pesquisar;
  public
    { Public declarations }
    procedure conhecaObj(pObj: TObject; pctrl: TObject);
    procedure SetFrmCadastro(pObj: TObject);

  end;

var
  FrmConsultacompra: TFrmConsultacompra;

implementation

{$R *.dfm}
{ TFrmConsultacompra }

procedure TFrmConsultacompra.Alterar;
begin
  inherited;
  self.umactrlcompra.Carregar(umacompra);
  self.umFrmCadastrocompra.conhecaObj(umacompra, umactrlcompra);
  self.umFrmCadastrocompra.CarregaEdt;
  self.umFrmCadastrocompra.ListView1.Clear;
  self.umFrmCadastrocompra.ListView2.Clear;
  self.umFrmCadastrocompra.carregaLV;
  self.umFrmCadastrocompra.carregaLV2;
  umFrmCadastrocompra.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaCompra.btnAlterarClick(Sender: TObject);
begin
  Alterar;
end;

procedure TFrmConsultaCompra.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TFrmConsultaCompra.btnNovoClick(Sender: TObject);
begin
  Novo;
end;

procedure TFrmConsultaCompra.btnPesquisarClick(Sender: TObject);
begin
  self.Pesquisar;
end;

procedure TFrmConsultaCompra.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultacompra.conhecaObj(pObj: TObject; pctrl: TObject);
begin
  inherited;
  umacompra := compras(pObj);
  umactrlcompra := Controllercompras(pctrl);
  self.umFrmCadastrocompra.conhecaObj(umacompra, umactrlcompra);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlcompra.getds;
end;

procedure TFrmConsultacompra.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlcompra.Carregar(umacompra);
  self.umFrmCadastrocompra.conhecaObj(umacompra, umactrlcompra);
  self.umFrmCadastrocompra.limpaedt;
  self.umFrmCadastrocompra.CarregaEdt;
  self.umFrmCadastrocompra.bloqueiaedt;
  mtitulo := umFrmCadastrocompra.btnSalvar.Caption;
  umFrmCadastrocompra.btnSalvar.Caption := '&Excluir';
  umFrmCadastrocompra.ShowModal;
  self.umFrmCadastrocompra.DesbloqueiaEdt;
  umFrmCadastrocompra.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultacompra.Novo;
begin
  inherited;
  //self.umacompra.setcodigo(0);
  self.umFrmCadastrocompra.btnadicionar.Enabled := false;
  self.umFrmCadastrocompra.btnremove.Enabled := false;
  self.umFrmCadastrocompra.btngeraparcela.Enabled := false;
  self.umacompra.setData_entrada(Date);
  self.umacompra.setData_emissao(Date);
  self.umFrmCadastrocompra.limpaedt;
  self.umFrmCadastrocompra.DesbloqueiaEdt;
  self.umFrmCadastrocompra.conhecaObj(umacompra, umactrlcompra);
  self.umFrmCadastrocompra.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultacompra.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlcompra.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('compra ' + self.edtPesquisar.Text + ' N�O ENCONTRADA');
end;

procedure TFrmConsultacompra.Sair;
begin
  inherited;
  if self.btnsair.Caption = 'SELECIONAR' then
    umactrlcompra.Carregar(umacompra);
end;

procedure TFrmConsultacompra.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umFrmCadastrocompra := TFrmCadastrocompra(pObj);
end;

end.
