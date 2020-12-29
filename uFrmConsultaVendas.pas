unit uFrmConsultaVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, uVenda_Produtos, uControllerVenda_Produtos, uFrmCadastroVendas, uDM;

type
  TFrmConsultaVendas = class(TFrmConsulta)
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
private
    { Private declarations }
  protected
    umFrmCadastrovenda: TFrmCadastrovendas;
    umdm: TDM;
    umavendaproduto: Venda_Produtos;
    umactrlvendaproduto: Controllervenda_Produtos;
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
  FrmConsultaVendas: TFrmConsultaVendas;

implementation

{$R *.dfm}

{ TFrmConsultaVendas }

procedure TFrmConsultaVendas.Alterar;
begin
  inherited;
  self.umactrlvendaproduto.Carregar(umavendaproduto);
  self.umFrmCadastrovenda.conhecaObj(umavendaproduto, umactrlvendaproduto);
  self.umFrmCadastrovenda.CarregaEdt;
  self.umFrmCadastrovenda.ListView1.Clear;
  self.umFrmCadastrovenda.carregaLV;
  umFrmCadastrovenda.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaVendas.btnAlterarClick(Sender: TObject);
begin
  inherited;
  self.Alterar;
end;

procedure TFrmConsultaVendas.btnExcluirClick(Sender: TObject);
begin
  inherited;
  self.Excluir;
end;

procedure TFrmConsultaVendas.btnNovoClick(Sender: TObject);
begin
  Novo;
end;

procedure TFrmConsultaVendas.conhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umavendaproduto := Venda_Produtos(pObj);
  umactrlvendaproduto := Controllervenda_Produtos(pctrl);
  self.umFrmCadastrovenda.conhecaObj(umavendaproduto, umactrlvendaproduto);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlvendaproduto.getds;
end;

procedure TFrmConsultaVendas.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlvendaproduto.Carregar(umavendaproduto);
  self.umFrmCadastrovenda.conhecaObj(umavendaproduto, umactrlvendaproduto);
  self.umFrmCadastrovenda.limpaedt;
  self.umFrmCadastrovenda.CarregaEdt;
  self.umFrmCadastrovenda.bloqueiaedt;
  mtitulo := umFrmCadastrovenda.btnSalvar.Caption;
  umFrmCadastrovenda.btnSalvar.Caption := '&Excluir';
  umFrmCadastrovenda.ShowModal;
  self.umFrmCadastrovenda.DesbloqueiaEdt;
  umFrmCadastrovenda.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultaVendas.Novo;
begin
  self.umavendaproduto.setcodigo(0);
  self.umFrmCadastrovenda.edtserie.Text := inttostr(1);
  self.umFrmCadastrovenda.edtmodelo.Text := inttostr(55);
  self.umFrmCadastrovenda.edttotalproduto.Text := floattostr(0.00);
  self.umFrmCadastrovenda.edttotaldesconto.Text := floattostr(0.00);
  self.umFrmCadastrovenda.btnadicionar.Enabled := true;
  self.umFrmCadastrovenda.btnremove.Enabled := true;
  self.umavendaproduto.setData_venda(Date);
  self.umavendaproduto.setData_emissao(Date);
  self.umFrmCadastrovenda.limpaedt;
  self.umFrmCadastrovenda.DesbloqueiaEdt;
  self.umFrmCadastrovenda.conhecaObj(umavendaproduto, umactrlvendaproduto);
  self.umFrmCadastrovenda.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaVendas.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlvendaproduto.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('venda ' + self.edtPesquisar.Text + ' N�O ENCONTRADA');
end;

procedure TFrmConsultaVendas.Sair;
begin
  inherited;
  if self.btnsair.Caption = 'SELECIONAR' then
    umactrlvendaproduto.Carregar(umavendaproduto);
end;

procedure TFrmConsultaVendas.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umFrmCadastrovenda := TFrmCadastrovendas(pObj);
end;

end.
