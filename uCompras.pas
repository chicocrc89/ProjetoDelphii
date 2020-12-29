unit uCompras;

interface
  uses uGenerica, uFornecedores, uCondicoes, ucolecaoprodutos, uProdutos, uColecaoContaspagar,
  uFormaPagamentos;
  type Compras = class(generica)
  private

  protected
    numero_nota :integer;
    serie: string;
    modelo: string;
    status: string ;
    data_entrada: TDate;
    data_emissao: TDate;
    umfornecedor: Fornecedores;
    umacondicao: Condicoes;
    totaldesconto: Currency;
    valor_frete: Currency;
    seguro: real;
    datacancelamento: TDate;
    totalcompra: Currency;
    totalprodutos: Currency;
    valoroutrasdespesas: Currency;
    umacolecaoproduto: Colecaoprodutos;
    umproduto : Produtos;
    umacolecaocontaspagar : ColecaoContasPagar;
    umaformapagamento : FormaPagamentos;
  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setNumero_nota(pNumero_nota:integer);
    function  getNumero_nota:integer;
    procedure setSerie (pSerie:string);
    function  getSerie :string;
    procedure setModelo (pModelo: string);
    function  getModelo : string;
    procedure setStatus (pStatus:string);
    function  getStatus:string;
    procedure setData_entrada (pData_entrada:TDate);
    function  getData_entrada : TDate;
    procedure setData_emissao (pData_emissao:TDate);
    function  getData_emissao:TDate;
    procedure setumFornecedor(pFornecedor:Fornecedores);
    function  GetumFornecedor :Fornecedores;
    procedure setumaCondicao(pCondicao:Condicoes);
    function  getumaCondicao: Condicoes;
    procedure setTotaldesconto (pTotaldesconto:Currency);
    function  getTotaldesconto :Currency;
    procedure setValor_frete (pValor_frete:Currency);
    function  getValor_frete :Currency;
    procedure setseguro (pseguro:real);
    function  getseguro : real;
    procedure setdatacancelamento(pdatacancelamento : TDate);
    function  getDatacancelamento :TDate;
    procedure setTotalcompra (pTotalcompra:Currency);
    function  getTotalcompra :Currency;
    procedure setTotalprodutos (pTotalproduto:Currency);
    function  getTotalprodutos  :Currency;
    procedure setValoroutrasdespesas(pValoroutrasdespesas:Currency);
    function  getValoroutrasdespesas:Currency;
    procedure setumacolecaoproduto(pcolecaoproduto : Colecaoprodutos);
    function  getumacolecaoproduto : Colecaoprodutos;
    procedure setumproduto (pproduto : produtos);
    function getumproduto : produtos;
    procedure setumacolecaocontaspagar(pcolecaocontaspagar : ColecaoContasPagar);
    function getumacolecaocontaspagar : ColecaoContasPagar;
    procedure setumaformapagamento(pformapagamento : FormaPagamentos);
    function getumaformapagamento : FormaPagamentos;
    function clone : Compras;
  end;

implementation

{ Compras }

function Compras.clone: Compras;
begin
  result := Compras.Crieobj;
  result.setNumero_nota(numero_nota);
  result.setSerie(serie);
  result.setModelo(modelo);
  result.setStatus(status);
  result.setData_entrada(data_entrada);
  result.setData_emissao(data_emissao);
  result.setumFornecedor(umfornecedor);
  result.setumaCondicao(umacondicao);
  result.setTotaldesconto(totaldesconto);
  result.setValor_frete(valor_frete);
  result.setseguro(seguro);
  result.setdatacancelamento(datacancelamento);
  result.setTotalcompra(totalcompra);
  result.setTotalprodutos(totalprodutos);
  result.setValoroutrasdespesas(valoroutrasdespesas);
  result.setumacolecaoproduto(umacolecaoproduto);
  result.setumacolecaocontaspagar(umacolecaocontaspagar);
  result.setumaformapagamento(umaformapagamento);
  result.setCadastro(cadastro);
  result.setUlt_Alt(ult_alt);
end;

constructor Compras.Crieobj;
begin
  umfornecedor := fornecedores.Crieobj;
  umacolecaoproduto := ColecaoProdutos.crieObj;
  umacondicao := Condicoes.crieobj;
  umproduto := Produtos.Crieobj;
  umacolecaoContaspagar := ColecaoContasPagar.crieObj;
  umaformapagamento := FormaPagamentos.Crieobj;

end;

destructor Compras.Destrua_se;
begin
  umfornecedor.Destrua_se;
  umacolecaoproduto.destrua_se;
  umacondicao.destrua_se;
  umproduto.Destrua_se;
  umaColecaocontaspagar.destrua_se;
  umaformapagamento.Destrua_se;
end;

function Compras.getDatacancelamento: TDate;
begin
  result := datacancelamento;
end;

function Compras.getData_emissao: TDate;
begin
  result := data_emissao;
end;

function Compras.getData_entrada: TDate;
begin
  result := data_entrada;
end;

function Compras.getseguro: real;
begin
  result := seguro;
end;

function Compras.getModelo: string;
begin
  result := modelo;
end;

function Compras.getNumero_nota: integer;
begin
  result := numero_nota;
end;

function Compras.getSerie: string;
begin
  result := serie;
end;

function Compras.getStatus: string;
begin
  result := status;
end;

function Compras.getTotalcompra: Currency;
begin
  result := totalcompra;
end;

function Compras.getTotaldesconto: Currency;
begin
  result := totaldesconto;
end;

function Compras.getTotalprodutos: Currency;
begin
  result := totalprodutos;
end;

function Compras.getumacolecaocontaspagar: ColecaoContasPagar;
begin
  result := umacolecaocontaspagar;
end;

function Compras.getumacolecaoproduto: Colecaoprodutos;
begin
  result := umacolecaoproduto;
end;

function Compras.getumaCondicao: Condicoes;
begin
  result := umacondicao;
end;

function Compras.getumaformapagamento: FormaPagamentos;
begin
  result := umaformapagamento;
end;

function Compras.GetumFornecedor: Fornecedores;
begin
  result := umfornecedor;
end;

function Compras.getumproduto: produtos;
begin
  result := umproduto;
end;

function Compras.getValoroutrasdespesas: Currency;
begin
  result := valoroutrasdespesas;
end;

function Compras.getValor_frete: Currency;
begin
  result := valor_frete;
end;

procedure Compras.setdatacancelamento(pdatacancelamento: TDate);
begin
  datacancelamento := pdatacancelamento;
end;

procedure Compras.setData_emissao(pData_emissao: TDate);
begin
  data_emissao := pdata_emissao;
end;

procedure Compras.setData_entrada(pData_entrada: TDate);
begin
  data_entrada := pdata_entrada;
end;

procedure Compras.setseguro(pseguro: real);
begin
  seguro := pseguro;
end;

procedure Compras.setModelo(pModelo: string);
begin
  modelo := pmodelo;
end;

procedure Compras.setNumero_nota(pNumero_nota: integer);
begin
  numero_nota := pnumero_nota;
end;

procedure Compras.setSerie(pSerie: string);
begin
  serie := pserie;
end;

procedure Compras.setStatus(pStatus: string);
begin
  status := pstatus;
end;

procedure Compras.setTotalcompra(pTotalcompra: Currency);
begin
  totalcompra := ptotalcompra;
end;

procedure Compras.setTotaldesconto(pTotaldesconto: Currency);
begin
  totaldesconto := ptotaldesconto;
end;

procedure Compras.setTotalprodutos(pTotalproduto: Currency);
begin
  totalprodutos := ptotalproduto;
end;

procedure Compras.setumacolecaocontaspagar(pcolecaocontaspagar: ColecaoContasPagar);
begin
  umacolecaocontaspagar := pcolecaocontaspagar;
end;

procedure Compras.setumacolecaoproduto(pcolecaoproduto: Colecaoprodutos);
begin
  umacolecaoproduto := pcolecaoproduto;
end;

procedure Compras.setumaCondicao(pCondicao: Condicoes);
begin
  umacondicao := pcondicao;
end;

procedure Compras.setumaformapagamento(pformapagamento: FormaPagamentos);
begin
  umaformapagamento := pformapagamento;
end;

procedure Compras.setumFornecedor(pFornecedor: Fornecedores);
begin
  umfornecedor := pfornecedor;
end;

procedure Compras.setumproduto(pproduto: produtos);
begin
  umproduto := pproduto;
end;

procedure Compras.setValoroutrasdespesas(pValoroutrasdespesas: Currency);
begin
  valoroutrasdespesas := pvaloroutrasdespesas;
end;

procedure Compras.setValor_frete(pValor_frete: Currency);
begin
  valor_frete := pvalor_frete;
end;

end.
