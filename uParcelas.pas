unit uParcelas;

interface
  uses uGenerica, uFormaPagamentos;
  type Parcelas = class(Generica)
  private

  protected
    numero_parcela    :   integer;
    dias_prazo        :   integer;
    perc_parcela      :   real;
    umaformapagamento :   FormaPagamentos;
    valor             :   real;
    data_vencimento   :   Tdate;
    data_pagamento    :   Tdate;
    juros             :   real;
    multa             :   Currency;
    valor_pago        :   Currency;
    Desconto          :   Currency;

  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setnumero_parcela (pnumero_parcela : integer);
    procedure setdias_prazo (pdias_prazo : integer);
    procedure setperc_parcela (pperc_parcela : real);
    procedure setumaformapagamento (pformapagamento : FormaPagamentos);
    function getnumero_parcela : integer;
    function getdias_prazo : integer;
    function getperc_parcela : real;
    function getumaformapagamento : FormaPagamentos;
    procedure setvalor (pvalor : real);
    function getvalor : real;
    procedure setdata_vencimento (pdata_vencimento : Tdate);
    function getdata_vencimento : Tdate;
    procedure setdata_pagamento (pdata_pagamento : Tdate);
    function getdata_pagamento : Tdate;
    procedure setjuros (pjuros : real);
    function getjuros : real;
    procedure setmulta (pmulta : currency);
    function getmulta : Currency;
    procedure setvalor_pago(pvalor_pago : Currency);
    function getvalor_pago : Currency;
    procedure setdesconto (pdesconto : currency);
    function getdesconto : Currency;
    function clone : Parcelas;
  end;

implementation

{ Parcelas }

function Parcelas.clone: Parcelas;
begin
  result := parcelas.Crieobj;
  result.setnumero_parcela(numero_parcela);
  result.setdias_prazo(dias_prazo);
  result.setperc_parcela(perc_parcela);
  result.setumaformapagamento(umaformapagamento);
  result.setvalor(valor);
  result.setdata_vencimento(data_vencimento);
  result.setdata_pagamento(data_pagamento);
  result.setjuros(juros);
  result.setmulta(multa);
  result.setvalor_pago(valor_pago);
  result.setdesconto(desconto);
  result.setCadastro(Cadastro);
  result.setUlt_Alt(Ult_Alt);
end;

constructor Parcelas.Crieobj;
begin
  self.umaformapagamento := FormaPagamentos.Crieobj;
end;

destructor Parcelas.Destrua_se;
begin
  self.umaformapagamento.Destrua_se;
end;

function Parcelas.getdata_pagamento: Tdate;
begin
  result := data_pagamento;
end;

function Parcelas.getdata_vencimento: Tdate;
begin
  result := data_vencimento;
end;

function Parcelas.getdesconto: Currency;
begin
  result := desconto;
end;

function Parcelas.getdias_prazo: integer;
begin
  result := dias_prazo;
end;

function Parcelas.getjuros: real;
begin
  result := juros;
end;

function Parcelas.getmulta: Currency;
begin
  result := multa;
end;

function Parcelas.getnumero_parcela: integer;
begin
  result := numero_parcela;
end;

function Parcelas.getperc_parcela: real;
begin
  result := perc_parcela;
end;

function Parcelas.getumaformapagamento: FormaPagamentos;
begin
  result := umaformapagamento;
end;

function Parcelas.getvalor: real;
begin
  result := valor;
end;

function Parcelas.getvalor_pago: Currency;
begin
  result := valor_pago;
end;

procedure Parcelas.setdata_pagamento(pdata_pagamento: Tdate);
begin
  data_pagamento := pdata_pagamento;
end;

procedure Parcelas.setdata_vencimento(pdata_vencimento: Tdate);
begin
  data_vencimento := pdata_vencimento;
end;

procedure Parcelas.setdesconto(pdesconto: currency);
begin
  desconto := pdesconto;
end;

procedure Parcelas.setdias_prazo(pdias_prazo: integer);
begin
  dias_prazo := pdias_prazo;
end;

procedure Parcelas.setjuros(pjuros: real);
begin
  juros := pjuros;
end;

procedure Parcelas.setmulta(pmulta: currency);
begin
  multa := pmulta;
end;

procedure Parcelas.setnumero_parcela(pnumero_parcela: integer);
begin
  numero_parcela := pnumero_parcela;
end;

procedure Parcelas.setperc_parcela(pperc_parcela: real);
begin
  perc_parcela := pperc_parcela;
end;

procedure Parcelas.setumaformapagamento(pformapagamento: FormaPagamentos);
begin
  umaformapagamento := pformapagamento;
end;

procedure Parcelas.setvalor(pvalor: real);
begin
  valor := pvalor;
end;

procedure Parcelas.setvalor_pago(pvalor_pago: Currency);
begin
  valor_pago := pvalor_pago;
end;

end.
