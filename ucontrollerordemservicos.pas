unit uControllerordemservicos;

interface

uses SysUtils, ucontroller, uDM, DB, uDaoordemservicos, uControllerClientes, uControllermodelos, uControllercores, uordemservicos, uControllerProdutos,
uControllerUsuarios, uControllerServicos, uControllerCondicoes, uControllerFuncionarios, uColecaoContasReceber, uColecaoProdutos, uColecaoServicos, uItem, uContasReceber,
uControllerVenda_Produtos;

type
  Controllerordemservicos = class(controller)
  private

  protected
    umadaoordemservico: Daoordemservicos;
    umactrlcliente: ControllerClientes;
    umactrlcor : ControllerCores;
    umactrlmodelo : ControllerModelos;
    umactrlusuario : ControllerUsuarios;
    umactrlproduto : ControllerProdutos;
    umactrlservico : ControllerServicos;
    umactrlcondicao : ControllerCondicoes;
    umactrlfuncionario : ControllerFuncionarios;
    umactrlvendaproduto :  ControllerVenda_Produtos;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
    procedure setctrlcliente(pObj: TObject);
    function getctrlcliente: ControllerClientes;
    procedure setctrlCor(pObj: TObject);
    function getctrlCor: ControllerCores;
    procedure setctrlusuario(pObj: TObject);
    function getctrlusuario : ControllerUsuarios;
    procedure setctrlproduto(pObj : TObject);
    function getctrlproduto : ControllerProdutos;
    procedure setctrlmodelo(pObj : TObject);
    function getctrlmodelo : ControllerModelos;
    procedure setctrlservico(pObj : TObject);
    function getctrlservico : ControllerServicos;
    procedure setctrlcondicao(pObj : TObject);
    function getctrlcondicao : ControllerCondicoes;
    procedure setctrlfuncionario (pObj : TObject);
    function getctrlfuncionario : ControllerFuncionarios;
    procedure setctrlvendaproduto (pObj : TObject);
    function getctrlvendaproduto : ControllerVenda_produtos;
  end;

implementation

{ Controllerordemservicos }

function Controllerordemservicos.Carregar(pObj: TObject): string;
var
  mordemservico: ordemservicos;
  tamanho_contasreceber, tamanho_produto, tamanho_servico, i : integer;
  mcolecaocontasreceber : ColecaoContasReceber;
  mcolecaoproduto : ColecaoProdutos;
  mcolecaoservico : ColecaoServicos;
  mcontasreceber : ContasReceber;
  mitem : Item;
begin
  self.umadaoordemservico.Carregar(pObj);
  mordemservico := ordemservicos(pObj);
  umactrlcliente.Pesquisar(inttostr(mordemservico.getumcliente.getcodigo));
  self.umactrlcliente.Carregar(mordemservico.getumcliente);
  umactrlcor.Pesquisar(inttostr(mordemservico.getumacor.getCodigo));
  self.umactrlcor.Carregar(mordemservico.getumacor);
  umactrlusuario.Pesquisar(inttostr(mordemservico.getumusuario.getcodigo));
  self.umactrlusuario.Carregar(mordemservico.getumusuario);
  self.umactrlmodelo.Pesquisar(inttostr(mordemservico.getummodelo.getcodigo));
  self.umactrlmodelo.Carregar(mordemservico.getummodelo);
  self.umactrlmodelo.getctrlmarca.Pesquisar(inttostr(mordemservico.getummodelo.getumamarca.getcodigo));
  self.umactrlmodelo.getctrlmarca.Carregar(mordemservico.getummodelo.getumamarca);
  self.umactrlcondicao.Pesquisar(inttostr(mordemservico.getumacondicao.getCodigo));
  self.umactrlcondicao.Carregar(mordemservico.getumacondicao);
  self.umactrlfuncionario.Pesquisar(inttostr(mordemservico.getumfuncionario.getCodigo));
  self.umactrlfuncionario.Carregar(mordemservico.getumfuncionario);
  tamanho_contasreceber := mordemservico.getumacolecaocontasreceber.getQtd;
  tamanho_produto     := mordemservico.getumacolecaoproduto.getQtd;
  tamanho_servico		:= mordemservico.getumacolecaoservico.getQtd;
  for i := 1 to tamanho_contasreceber do
  begin
    mcolecaocontasreceber := Colecaocontasreceber (mordemservico.getumacolecaocontasreceber);
    mcontasreceber := contasreceber (mcolecaocontasreceber.Carrega(I));
    self.umactrlcondicao.getctrlformapagamento.Pesquisar(inttostr(mcontasreceber.getumaformapagamento.getCodigo));
    self.umactrlcondicao.getctrlformapagamento.Carregar(mcontasreceber.getumaformapagamento);
  end;
  for i := 1 to tamanho_produto do
  begin
    mcolecaoproduto := ColecaoProdutos (mordemservico.getumacolecaoproduto);
    mitem := Item (mcolecaoproduto.Carrega(I));
    self.umactrlproduto.Pesquisar(inttostr(mitem.getumproduto.getCodigo));
    self.umactrlproduto.Carregar(mitem.getumproduto);
  end;
for i := 1 to tamanho_servico do
  begin
    mcolecaoservico := ColecaoServicos (mordemservico.getumacolecaoservico);
    mitem := Item (mcolecaoservico.Carrega(I));
    self.umactrlservico.Pesquisar(inttostr(mitem.getumproduto.getCodigo));
    self.umactrlservico.Carregar(mitem.getumproduto);
    self.umactrlfuncionario.Pesquisar(inttostr(mitem.getumfuncionario.getCodigo));
    self.umactrlfuncionario.Carregar(mitem.getumfuncionario);
  end;
end;

constructor Controllerordemservicos.CrieObj;
begin
  self.umadaoordemservico := Daoordemservicos.CrieObj;
end;

destructor Controllerordemservicos.Destrua_se;
begin
  self.umadaoordemservico.Destrua_se;
end;

function Controllerordemservicos.Excluir(pObj: TObject): string;
begin
  self.umadaoordemservico.Excluir(pObj);
end;

function Controllerordemservicos.getctrlcliente: ControllerClientes;
begin
  result := umactrlcliente;
end;

function Controllerordemservicos.getctrlcondicao: ControllerCondicoes;
begin
  result := umactrlcondicao;
end;

function Controllerordemservicos.getctrlCor: ControllerCores;
begin
  result := umactrlcor;
end;

function Controllerordemservicos.getctrlfuncionario: ControllerFuncionarios;
begin
  result := umactrlfuncionario;
end;

function Controllerordemservicos.getctrlmodelo: ControllerModelos;
begin
  result := umactrlmodelo;
end;

function Controllerordemservicos.getctrlproduto: ControllerProdutos;
begin
  result := umactrlproduto;
end;

function Controllerordemservicos.getctrlservico: ControllerServicos;
begin
  result := umactrlservico;
end;

function Controllerordemservicos.getctrlusuario: ControllerUsuarios;
begin
  result := umactrlusuario;
end;

function Controllerordemservicos.getctrlvendaproduto: ControllerVenda_produtos;
begin
  result := umactrlvendaproduto;
end;

function Controllerordemservicos.getds: Tdatasource;
begin
  result := umadaoordemservico.getds;
end;

function Controllerordemservicos.Pesquisar(pChave: string): string;
begin
  self.umadaoordemservico.Pesquisar(pChave);
end;

function Controllerordemservicos.Salvar(pObj: TObject): string;
begin
  self.umadaoordemservico.Salvar(pObj);
end;

procedure Controllerordemservicos.setctrlcliente(pObj: TObject);
begin
  umactrlcliente := ControllerClientes(pObj);
end;

procedure Controllerordemservicos.setctrlcondicao(pObj: TObject);
begin
  umactrlcondicao := ControllerCondicoes(pObj);
end;

procedure Controllerordemservicos.setctrlCor(pObj: TObject);
begin
  umactrlcor := ControllerCores(pObj);
end;

procedure Controllerordemservicos.setctrlfuncionario(pObj: TObject);
begin
  umactrlfuncionario := ControllerFuncionarios(pObj);
end;

procedure Controllerordemservicos.setctrlmodelo(pObj: TObject);
begin
  umactrlmodelo := ControllerModelos(pObj);
end;

procedure Controllerordemservicos.setctrlproduto(pObj: TObject);
begin
  umactrlproduto := ControllerProdutos(pObj);
end;

procedure Controllerordemservicos.setctrlservico(pObj: TObject);
begin
  umactrlservico := ControllerServicos(pObj);
end;

procedure Controllerordemservicos.setctrlusuario(pObj: TObject);
begin
  umactrlusuario := ControllerUsuarios(pObj);
end;

procedure Controllerordemservicos.setctrlvendaproduto(pObj: TObject);
begin
  umactrlvendaproduto := ControllerVenda_produtos(pObj);
end;

procedure Controllerordemservicos.setDM(pDM: TDM);
begin
  self.umadaoordemservico.setDM(pDM);
end;

end.
