unit uControllerVenda_Produtos;

interface
  uses SysUtils, ucontroller, uDM, DB, uDaovenda_Produtos, uControllerProdutos, uControllerclientes, uvenda_Produtos, uControllerCondicoes,
  uControllerFormaPagamentos, uItem, uContasReceber, uColecaoContasReceber, uColecaoProdutos, uColecaoServicos, uControllerServicos;

  type ControllerVenda_Produtos = class(controller)
   private

  protected
    umadaovendaproduto: Daovenda_Produtos;
    umactrlcondicao: ControllerCondicoes;
    umactrlcliente : Controllerclientes;
    umactrlproduto : ControllerProdutos;
    umactrlformapagamento : ControllerFormaPagamentos;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
    procedure setctrlcondicao(pObj: TObject);
    function getctrlcondicao: ControllerCondicoes;
    procedure setctrlcliente(pObj: TObject);
    function getctrlcliente: Controllerclientes;
    procedure setctrlproduto(pObj: TObject);
    function getctrlproduto: ControllerProdutos;
    procedure setctrlformapagamento(pObj : TObject);
    function getctrlformapagamento : ControllerFormaPagamentos;
  end;

implementation

{ Controllervendas }

function ControllerVenda_Produtos.Carregar(pObj: TObject): string;
var
  mvenda: Venda_Produtos;
  tamanho_contasreceber, tamanho_produto, i : integer;
  mcolecaocontasreceber : ColecaoContasReceber;
  mcolecaoproduto : ColecaoProdutos;
  mcontasreceber : ContasReceber;
  mitem : Item;
begin
  self.umadaovendaproduto.Carregar(pObj);
  mvenda := Venda_Produtos(pObj);
  umactrlcondicao.Pesquisar(inttostr(mvenda.getumacondicao.getcodigo));
  self.umactrlcondicao.Carregar(mvenda.getumacondicao);
  umactrlcliente.Pesquisar(inttostr(mvenda.getumcliente.getCodigo));
  self.umactrlcliente.Carregar(mvenda.getumcliente);
  tamanho_contasreceber := mvenda.getumacolecaocontasreceber.getQtd;
  tamanho_produto     := mvenda.getumacolecaoproduto.getQtd;
  for i := 1 to tamanho_contasreceber do
  begin
    mcolecaocontasreceber := ColecaoContasreceber (mvenda.getumacolecaocontasreceber);
    mcontasreceber := Contasreceber (mcolecaocontasreceber.Carrega(I));
    self.umactrlformapagamento.Pesquisar(inttostr(mcontasreceber.getumaformapagamento.getCodigo));
    self.umactrlformapagamento.Carregar(mcontasreceber.getumaformapagamento);
  end;
  for i := 1 to tamanho_produto do
  begin
    mcolecaoproduto := ColecaoProdutos (mvenda.getumacolecaoproduto);
    mitem := Item (mcolecaoproduto.Carrega(I));
    self.umactrlproduto.Pesquisar(inttostr(mitem.getumproduto.getCodigo));
    self.umactrlproduto.Carregar(mitem.getumproduto);
  end;
end;

constructor ControllerVenda_Produtos.CrieObj;
begin
  self.umadaovendaproduto := Daovenda_Produtos.CrieObj;
end;

destructor ControllerVenda_Produtos.Destrua_se;
begin
  self.umadaovendaproduto.Destrua_se;
end;

function ControllerVenda_Produtos.Excluir(pObj: TObject): string;
begin
  self.umadaovendaproduto.Excluir(pObj);
end;

function ControllerVenda_Produtos.getctrlcondicao: ControllerCondicoes;
begin
  result := umactrlcondicao;
end;

function ControllerVenda_Produtos.getctrlformapagamento: ControllerFormaPagamentos;
begin
  result := umactrlformapagamento;
end;

function ControllerVenda_Produtos.getctrlcliente: Controllerclientes;
begin
  result := umactrlcliente
end;

function ControllerVenda_Produtos.getctrlproduto: ControllerProdutos;
begin
  result := umactrlproduto;
end;

function ControllerVenda_Produtos.getds: Tdatasource;
begin
  result := umadaovendaproduto.getds;
end;

function ControllerVenda_Produtos.Pesquisar(pChave: string): string;
begin
  self.umadaovendaproduto.Pesquisar(pChave);
end;

function ControllerVenda_Produtos.Salvar(pObj: TObject): string;
begin
  self.umadaovendaproduto.Salvar(pObj);
end;

procedure ControllerVenda_Produtos.setctrlcondicao(pObj: TObject);
begin
  umactrlcondicao := ControllerCondicoes(pObj);
end;

procedure ControllerVenda_Produtos.setctrlformapagamento(pObj: TObject);
begin
  umactrlformapagamento := ControllerFormaPagamentos(pObj);
end;

procedure ControllerVenda_Produtos.setctrlcliente(pObj: TObject);
begin
  umactrlcliente := Controllerclientes(pObj);
end;

procedure ControllerVenda_Produtos.setctrlproduto(pObj: TObject);
begin
  umactrlproduto := ControllerProdutos(pObj);
end;

procedure ControllerVenda_Produtos.setDM(pDM: TDM);
begin
  self.umadaovendaproduto.setDM(pDM);
end;

end.
