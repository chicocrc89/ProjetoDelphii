unit ucondicoes;

interface
  uses ugenerica, uColecaoParcelas;
  type Condicoes = class(generica)
  private

  protected
    condicao        : string;
    num_parcelas    : integer;
    juros           : real;
    umacolecaop     : ColecaoParcelas;
  public
    constructor crieobj;
    destructor destrua_se;
    procedure setcondicao (pcondicao : string);
    procedure setjuros (pjuros: real);
    procedure setnum_parcelas (pnum_parcelas : integer);
    procedure setumacolecaop (pcolecao : ColecaoParcelas);
    function getumacolecaop : ColecaoParcelas;
    function getjuros : real;
    function getnum_parcelas : integer;
    function getcondicao : string;
    function clone : condicoes;
  end;

implementation

{ Condicoes }

function Condicoes.clone: condicoes;
begin
  result := condicoes.crieobj;
  result.setCodigo(codigo);
  result.setjuros(juros);
  result.setnum_parcelas(num_parcelas);
  result.setcondicao(condicao);
  result.setumacolecaop(umacolecaop);
  result.setCadastro(Cadastro);
  result.setUlt_Alt(Ult_Alt);
end;

constructor Condicoes.crieobj;
begin
  umacolecaop := ColecaoParcelas.crieObj;
end;

destructor Condicoes.destrua_se;
begin
  umacolecaop.destrua_se;
end;

function Condicoes.getcondicao: string;
begin
  result := condicao;
end;

function Condicoes.getjuros: real;
begin
  result := juros;
end;

function Condicoes.getnum_parcelas: integer;
begin
  result := num_parcelas;
end;

function Condicoes.getumacolecaop: ColecaoParcelas;
begin
  result := umacolecaop;
end;

procedure Condicoes.setcondicao(pcondicao: string);
begin
  condicao := pcondicao;
end;

procedure Condicoes.setjuros(pjuros: real);
begin
  juros := pjuros;
end;

procedure Condicoes.setnum_parcelas(pnum_parcelas: integer);
begin
  num_parcelas := pnum_parcelas;
end;

procedure Condicoes.setumacolecaop(pcolecao: ColecaoParcelas);
begin
  umacolecaop := pcolecao;
end;

end.
