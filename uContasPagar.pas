unit uContasPagar;

interface
  uses uGenerica, uParcelas,uFornecedores, ucondicoes, uFormaPagamentos;
  type
  ContasPagar = class(Generica)

  private
    { private declarations }
  protected
    numero_nota       : integer;
    serie             : string;
    modelo            : string;
    umfornecedor      :Fornecedores;
    data_emissao      : TDate;
    numero_parcela    : integer;
    valor_parcela     : Currency;
    data_vencimento   : Tdate;
    data_pagamento    : Tdate;
    juros             : Currency;
    multa             : Currency;
    valor_pago        : Currency;
    desconto          : Currency;
    umaformapagamento : FormaPagamentos;
  public
    constructor Crieobj ;
    destructor Destrua_se;
    procedure Setnumero_nota(pnumero_nota: integer);
    procedure Setserie(pserie: string);
    procedure setmodelo(pmodelo : string);
    procedure setumfornecedor(pfornecedor : fornecedores);
    procedure setdata_emissao(pdata_emissao : Tdate);
    procedure setnumero_parcela(pnumero_parcela : integer);
    procedure setvalor_parcela(pvalor_parcela : Currency);
    procedure setdata_vencimento(pdata_vencimento : Tdate);
    procedure setdata_pagamento(pdata_pagamento : Tdate);
    procedure setjuros(pjuros : Currency);
    procedure setmulta(pmulta : Currency);
    procedure setvalor_pago(pvalor_pago : Currency);
    procedure setdesconto(pdesconto : Currency);
    procedure setumaformapagamento(pformapagamento : FormaPagamentos);
    function getnumero_nota : integer;
    function getserie : string;
    function getmodelo : string;
    function getumfornecedor : fornecedores;
    function getdata_emissao : Tdate;
    function getnumero_parcela : integer;
    function getvalor_parcela : Currency;
    function getdata_vencimento : Tdate;
    function getdata_pagamento : Tdate;
    function getjuros : Currency;
    function getmulta : Currency;
    function getvalor_pago : Currency;
    function getdesconto : Currency;
    function getumaformapagamento : FormaPagamentos;
    function clone : ContasPagar;

  end;

implementation

{ ContasPagar }

{ ContasPagar }

function ContasPagar.clone: ContasPagar;
begin
  result := ContasPagar.Crieobj;
  result.setCodigo(codigo);
  result.Setnumero_nota(numero_nota);
  result.Setserie(serie);
  result.setmodelo(modelo);
  result.setumfornecedor(umfornecedor);
  result.setdata_emissao(data_emissao);
  result.setnumero_parcela(numero_parcela);
  result.setvalor_parcela(valor_parcela);
  result.setdata_vencimento(data_vencimento);
  result.setdata_pagamento(data_pagamento);
  result.setjuros(juros);
  result.setmulta(multa);
  result.setvalor_pago(valor_pago);
  result.setdesconto(desconto);
  result.setumaformapagamento(umaformapagamento);
  result.setCadastro(cadastro);
  result.setUlt_Alt(ult_alt);
end;

constructor ContasPagar.Crieobj;
begin
  umfornecedor  := fornecedores.Crieobj;
  umaformapagamento   := FormaPagamentos.crieobj;
end;

destructor ContasPagar.Destrua_se;
begin
  umfornecedor.Destrua_se;
  umaformapagamento.destrua_se;
end;

function ContasPagar.getdata_emissao: Tdate;
begin
  result := data_emissao;
end;

function ContasPagar.getdata_pagamento: Tdate;
begin
  result := data_pagamento;
end;

function ContasPagar.getdata_vencimento: Tdate;
begin
  result := data_vencimento;
end;

function ContasPagar.getdesconto: Currency;
begin
  result := desconto;
end;

function ContasPagar.getjuros: Currency;
begin
  result := juros;
end;

function ContasPagar.getmodelo: string;
begin
  result := modelo;
end;

function ContasPagar.getmulta: Currency;
begin
  result := multa;
end;

function ContasPagar.getnumero_nota: integer;
begin
  result := numero_nota;
end;

function ContasPagar.getnumero_parcela: integer;
begin
  result := numero_parcela;
end;

function ContasPagar.getserie: string;
begin
  result := serie;
end;

function ContasPagar.getumaformapagamento: FormaPagamentos;
begin
  result := umaformapagamento;
end;

function ContasPagar.getumfornecedor: fornecedores;
begin
  result := umfornecedor;
end;

function ContasPagar.getvalor_parcela: Currency;
begin
  result := valor_parcela
end;

function ContasPagar.getvalor_pago: Currency;
begin
  result := valor_pago;
end;

procedure ContasPagar.setdata_emissao(pdata_emissao: Tdate);
begin
  data_emissao := pdata_emissao;
end;

procedure ContasPagar.setdata_pagamento(pdata_pagamento: Tdate);
begin
  data_pagamento := pdata_pagamento;
end;

procedure ContasPagar.setdata_vencimento(pdata_vencimento: Tdate);
begin
  data_vencimento := pdata_vencimento;
end;

procedure ContasPagar.setdesconto(pdesconto: Currency);
begin
  desconto := pdesconto;
end;

procedure ContasPagar.setjuros(pjuros: Currency);
begin
  juros := pjuros;
end;

procedure ContasPagar.setmodelo(pmodelo: string);
begin
  modelo := pmodelo;
end;

procedure ContasPagar.setmulta(pmulta: Currency);
begin
  multa := pmulta;
end;

procedure ContasPagar.Setnumero_nota(pnumero_nota: integer);
begin
  numero_nota := pnumero_nota;
end;

procedure ContasPagar.setnumero_parcela(pnumero_parcela: integer);
begin
  numero_parcela := pnumero_parcela;
end;

procedure ContasPagar.Setserie(pserie: string);
begin
  serie := pserie;
end;

procedure ContasPagar.setumaformapagamento(pformapagamento: FormaPagamentos);
begin
  umaformapagamento := pformapagamento;
end;

procedure ContasPagar.setumfornecedor(pfornecedor: fornecedores);
begin
  umfornecedor := pfornecedor;
end;

procedure ContasPagar.setvalor_pago(pvalor_pago: Currency);
begin
  valor_pago := pvalor_pago;
end;

procedure ContasPagar.setvalor_parcela(pvalor_parcela: Currency);
begin
  valor_parcela := pvalor_parcela;
end;

end.
