unit uControllerCompras;

interface
  uses SysUtils, ucontroller, uDM, DB, uDaoCompras, uControllerProdutos, uControllerFornecedores, uCompras, uControllerCondicoes,
  uControllerFormaPagamentos, uItem, uContasPagar, uColecaoContasPagar, uColecaoProdutos;

  type ControllerCompras = class(controller)
   private

  protected
    umadaocompra: Daocompras;
    umactrlcondicao: ControllerCondicoes;
    umactrlfornecedor : ControllerFornecedores;
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
    procedure setctrlfornecedor(pObj: TObject);
    function getctrlfornecedor: ControllerFornecedores;
    procedure setctrlproduto(pObj: TObject);
    function getctrlproduto: ControllerProdutos;
    procedure setctrlformapagamento(pObj : TObject);
    function getctrlformapagamento : ControllerFormaPagamentos;
    function validanotapk(pObj : TObject) : boolean;
  end;

implementation

{ Controllercompras }

function Controllercompras.Carregar(pObj: TObject): string;
var
  mcompra: compras;
  tamanho_contaspagar, tamanho_produto, i : integer;
  mcolecaocontaspagar : ColecaoContasPagar;
  mcolecaoproduto : ColecaoProdutos;
  mcontaspagar : ContasPagar;
  mitem : Item;
begin
  self.umadaocompra.Carregar(pObj);
  mcompra := compras(pObj);
  umactrlcondicao.Pesquisar(inttostr(mcompra.getumacondicao.getcodigo));
  self.umactrlcondicao.Carregar(mcompra.getumacondicao);
  umactrlfornecedor.Pesquisar(inttostr(mcompra.getumfornecedor.getCodigo));
  self.umactrlfornecedor.Carregar(mcompra.getumfornecedor);
  tamanho_contaspagar := mcompra.getumacolecaocontaspagar.getQtd;
  tamanho_produto     := mcompra.getumacolecaoproduto.getQtd;
  for i := 1 to tamanho_contaspagar do
  begin
    mcolecaocontaspagar := ColecaoContasPagar (mcompra.getumacolecaocontaspagar);
    mcontaspagar := ContasPagar (mcolecaocontaspagar.Carrega(I));
    self.umactrlformapagamento.Pesquisar(inttostr(mcontaspagar.getumaformapagamento.getCodigo));
    self.umactrlformapagamento.Carregar(mcontaspagar.getumaformapagamento);
  end;
  for i := 1 to tamanho_produto do
  begin
    mcolecaoproduto := ColecaoProdutos (mcompra.getumacolecaoproduto);
    mitem := Item (mcolecaoproduto.Carrega(I));
    self.umactrlproduto.Pesquisar(inttostr(mitem.getumproduto.getCodigo));
    self.umactrlproduto.Carregar(mitem.getumproduto);
  end;
end;

constructor Controllercompras.CrieObj;
begin
  self.umadaocompra := Daocompras.CrieObj;
end;

destructor Controllercompras.Destrua_se;
begin
  self.umadaocompra.Destrua_se;
end;

function Controllercompras.Excluir(pObj: TObject): string;
begin
  self.umadaocompra.Excluir(pObj);
end;

function ControllerCompras.getctrlcondicao: ControllerCondicoes;
begin
  result := umactrlcondicao;
end;

function ControllerCompras.getctrlformapagamento: ControllerFormaPagamentos;
begin
  result := umactrlformapagamento;
end;

function ControllerCompras.getctrlfornecedor: ControllerFornecedores;
begin
  result := umactrlfornecedor
end;

function ControllerCompras.getctrlproduto: ControllerProdutos;
begin
  result := umactrlproduto;
end;

function Controllercompras.getds: Tdatasource;
begin
  result := umadaocompra.getds;
end;

function Controllercompras.Pesquisar(pChave: string): string;
begin
  self.umadaocompra.Pesquisar(pChave);
end;

function Controllercompras.Salvar(pObj: TObject): string;
begin
  self.umadaocompra.Salvar(pObj);
end;

procedure ControllerCompras.setctrlcondicao(pObj: TObject);
begin
  umactrlcondicao := ControllerCondicoes(pObj);
end;

procedure ControllerCompras.setctrlformapagamento(pObj: TObject);
begin
  umactrlformapagamento := ControllerFormaPagamentos(pObj);
end;

procedure ControllerCompras.setctrlfornecedor(pObj: TObject);
begin
  umactrlfornecedor := ControllerFornecedores(pObj);
end;

procedure ControllerCompras.setctrlproduto(pObj: TObject);
begin
  umactrlproduto := ControllerProdutos(pObj);
end;

procedure Controllercompras.setDM(pDM: TDM);
begin
  self.umadaocompra.setDM(pDM);
end;

function ControllerCompras.validanotapk(pObj: TObject): boolean;
begin
  result := self.umadaocompra.validanotapk(pObj);
end;

end.
