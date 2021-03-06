unit uContasReceber;

interface
  uses uGenerica, uParcelas,uClientes, ucondicoes, uFormaPagamentos;
  type
  contasreceber = class(Generica)

  private
    { private declarations }
  protected
    numero_nota       : integer;
    modelo            : string;
    serie             : string;
    umcliente         : Clientes;
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
    procedure setmodelo(pmodelo : string);
    procedure setserie(pserie : string);
    procedure setumcliente(pcliente : clientes);
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
    function getmodelo : string;
    function getserie : string;
    function getumcliente : clientes;
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
    function clone : contasreceber;

  end;

implementation

{ contasreceber }

function contasreceber.clone: contasreceber;
begin
  result := contasreceber.Crieobj;
  result.setCodigo(codigo);
  result.Setnumero_nota(numero_nota);
  result.setmodelo(modelo);
  result.setserie(serie);
  result.setumcliente(umcliente);
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

constructor contasreceber.Crieobj;
begin
  umcliente  := clientes.Crieobj;
  umaformapagamento   := FormaPagamentos.crieobj;
end;

destructor contasreceber.Destrua_se;
begin
  umcliente.Destrua_se;
  umaformapagamento.destrua_se;
end;

function contasreceber.getdata_emissao: Tdate;
begin
  result := data_emissao;
end;

function contasreceber.getdata_pagamento: Tdate;
begin
  result := data_pagamento;
end;

function contasreceber.getdata_vencimento: Tdate;
begin
  result := data_vencimento;
end;

function contasreceber.getdesconto: Currency;
begin
  result := desconto;
end;

function contasreceber.getjuros: Currency;
begin
  result := juros;
end;

function contasreceber.getmodelo: string;
begin
  result := modelo;
end;

function contasreceber.getmulta: Currency;
begin
  result := multa;
end;

function contasreceber.getnumero_nota: integer;
begin
  result := numero_nota;
end;

function contasreceber.getnumero_parcela: integer;
begin
  result := numero_parcela;
end;

function contasreceber.getserie: string;
begin
  result := serie;
end;

function contasreceber.getumaformapagamento: FormaPagamentos;
begin
  result := umaformapagamento;
end;

function contasreceber.getumcliente: clientes;
begin
  result := umcliente;
end;

function contasreceber.getvalor_parcela: Currency;
begin
  result := valor_parcela
end;

function contasreceber.getvalor_pago: Currency;
begin
  result := valor_pago;
end;

procedure contasreceber.setdata_emissao(pdata_emissao: Tdate);
begin
  data_emissao := pdata_emissao;
end;

procedure contasreceber.setdata_pagamento(pdata_pagamento: Tdate);
begin
  data_pagamento := pdata_pagamento;
end;

procedure contasreceber.setdata_vencimento(pdata_vencimento: Tdate);
begin
  data_vencimento := pdata_vencimento;
end;

procedure contasreceber.setdesconto(pdesconto: Currency);
begin
  desconto := pdesconto;
end;

procedure contasreceber.setjuros(pjuros: Currency);
begin
  juros := pjuros;
end;

procedure contasreceber.setmodelo(pmodelo: string);
begin
  modelo := pmodelo;
end;

procedure contasreceber.setmulta(pmulta: Currency);
begin
  multa := pmulta;
end;

procedure contasreceber.Setnumero_nota(pnumero_nota: integer);
begin
  numero_nota := pnumero_nota;
end;

procedure contasreceber.setnumero_parcela(pnumero_parcela: integer);
begin
  numero_parcela := pnumero_parcela;
end;

procedure contasreceber.setserie(pserie: string);
begin
  serie := pserie;
end;

procedure contasreceber.setumaformapagamento(pformapagamento: FormaPagamentos);
begin
  umaformapagamento := pformapagamento;
end;

procedure contasreceber.setumcliente(pcliente: clientes);
begin
  umcliente := pcliente;
end;

procedure contasreceber.setvalor_pago(pvalor_pago: Currency);
begin
  valor_pago := pvalor_pago;
end;

procedure contasreceber.setvalor_parcela(pvalor_parcela: Currency);
begin
  valor_parcela := pvalor_parcela;
end;

end.
