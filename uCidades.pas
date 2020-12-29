unit uCidades;

interface

uses uGenerica, uEstados;

type
  Cidades = class(Generica)
  private

  protected
    cidade: string;
    DDD: string;
    umestado: Estados;
  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setcidade(pcidade: string);
    procedure setDDD(pDDD: string);
    procedure setumestado(pestado: Estados);
    function getcidade: string;
    function getDDD: string;
    function getumestado: Estados;
    function clone: Cidades;
  end;

implementation

{ Cidades }

function Cidades.clone: Cidades;
begin
  result := Cidades.Crieobj;
  result.setCodigo(codigo);
  result.setcidade(cidade);
  result.setDDD(DDD);
  result.setumestado(umestado);
  result.setCadastro(Cadastro);
  result.setUlt_Alt(Ult_Alt);
end;

constructor Cidades.Crieobj;
begin
  umestado := Estados.Crieobj;
end;

destructor Cidades.Destrua_se;
begin
  umestado.Destrua_se;
end;

function Cidades.getcidade: string;
begin
  result := cidade;
end;

function Cidades.getDDD: string;
begin
  result := DDD;
end;

function Cidades.getumestado: Estados;
begin
  result := umestado;
end;

procedure Cidades.setcidade(pcidade: string);
begin
  cidade := pcidade;
end;

procedure Cidades.setDDD(pDDD: string);
begin
  DDD := pDDD;
end;

procedure Cidades.setumestado(pestado: Estados);
begin
  umestado := pestado;
end;

end.
