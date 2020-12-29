unit uProdutos;

interface

uses uGenerica, uGrupos, uFabricantes, uFornecedores;

type
  Produtos = class(Generica)
  private

  protected
    descricao: string;
    umfabricante: fabricantes;
    umfornecedor : Fornecedores;
    umgrupo: grupos;
    barras: string;
    status : string;
    custo : Currency;
    und : string;
    preco_compra: Currency;
    preco_venda: Currency;
    margem: real;
    estoque: integer;
    tp_produto : string;
    obs : string;
  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setdescricao(pdescricao: string);
    procedure setumfabricante(pfabricante: fabricantes);
    procedure setumgrupo(pgrupo: grupos);
    procedure setumfornecedor(pfornecedor : Fornecedores);
    procedure setbarras(pbarras: string);
    procedure setstatus(pstatus : string);
    procedure setcusto(pcusto : Currency);
    procedure setund(pund : string);
    procedure setpreco_compra(ppreco_compra: Currency);
    procedure setpreco_venda(ppreco_venda: Currency);
    procedure setmargem(pmargem: real);
    procedure setestoque(pestoque: integer);
    procedure settp_produto(ptp_produto : string);
    procedure setobs(pobs : string);
    function getdescricao: string;
    function getumfabricante: fabricantes;
    function getumgrupo: grupos;
    function getumfornecedor : Fornecedores;
    function getbarras: string;
    function getstatus : string;
    function getcusto : Currency;
    function getund : string;
    function getpreco_compra: Currency;
    function getpreco_venda: Currency;
    function getmargem: real;
    function getestoque: integer;
    function gettp_produto : string;
    function getobs : string;
    function clone: Produtos;

  end;

implementation

{ Produto }

function Produtos.clone: Produtos;
begin
  result := Produtos.Crieobj;
  result.setCodigo(codigo);
  result.setdescricao(descricao);
  result.setumfabricante(umfabricante);
  result.setumfornecedor(umfornecedor);
  result.setbarras(barras);
  result.setumgrupo(umgrupo);
  result.setcusto(custo);
  result.setund(und);
  result.setstatus(status);
  result.setpreco_compra(preco_compra);
  result.setpreco_venda(preco_venda);
  result.setmargem(margem);
  result.settp_produto(tp_produto);
  result.setestoque(estoque);
  result.setobs(obs);
  result.setCadastro(Cadastro);
  result.setUlt_Alt(Ult_Alt);
end;

constructor Produtos.Crieobj;
begin
  umgrupo := grupos.Crieobj;
  umfabricante := fabricantes.Crieobj;
  umfornecedor := fornecedores.Crieobj;
end;

destructor Produtos.Destrua_se;
begin
  umgrupo.Destrua_se;
  umfabricante.Destrua_se;
  umfornecedor.Destrua_se;
end;

function Produtos.getbarras: string;
begin
  result := barras;
end;

function Produtos.getcusto: Currency;
begin
  result := custo;
end;

function Produtos.getdescricao: string;
begin
  result := descricao;
end;

function Produtos.getestoque: integer;
begin
  result := estoque
end;

function Produtos.getumfabricante: fabricantes;
begin
  result := umfabricante;
end;

function Produtos.getumfornecedor: Fornecedores;
begin
  result := umfornecedor;
end;

function Produtos.getumgrupo: grupos;
begin
  result := umgrupo;
end;

function Produtos.getund: string;
begin
  result := und;
end;

function Produtos.getmargem: real;
begin
  result := margem;
end;

function Produtos.getobs: string;
begin
  result := obs;
end;

function Produtos.getpreco_compra: Currency;
begin
  result := preco_compra;
end;

function Produtos.getpreco_venda: Currency;
begin
  result := preco_venda;
end;

function Produtos.getstatus: string;
begin
  result := status;
end;

function Produtos.gettp_produto: string;
begin
  result := tp_produto;
end;

procedure Produtos.setbarras(pbarras: string);
begin
  barras := pbarras;
end;

procedure Produtos.setcusto(pcusto: Currency);
begin
  custo := pcusto;
end;

procedure Produtos.setdescricao(pdescricao: string);
begin
  descricao := pdescricao;
end;

procedure Produtos.setestoque(pestoque: integer);
begin
  estoque := pestoque;
end;

procedure Produtos.setumfabricante(pfabricante: fabricantes);
begin
  umfabricante := pfabricante;
end;

procedure Produtos.setumfornecedor(pfornecedor: Fornecedores);
begin
  umfornecedor := pfornecedor;
end;

procedure Produtos.setumgrupo(pgrupo: grupos);
begin
  umgrupo := pgrupo;
end;

procedure Produtos.setund(pund: string);
begin
  und := pund;
end;

procedure Produtos.setmargem(pmargem: real);
begin
  margem := pmargem;
end;

procedure Produtos.setobs(pobs: string);
begin
  obs := pobs;
end;

procedure Produtos.setpreco_compra(ppreco_compra: Currency);
begin
  preco_compra := ppreco_compra;
end;

procedure Produtos.setpreco_venda(ppreco_venda: Currency);
begin
  preco_venda := ppreco_venda;
end;

procedure Produtos.setstatus(pstatus: string);
begin
  status := pstatus;
end;

procedure Produtos.settp_produto(ptp_produto: string);
begin
  tp_produto := ptp_produto;
end;

end.
