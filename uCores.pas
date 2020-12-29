unit uCores;

interface

uses uGenerica;

type
  Cores = class(Generica)
  private

  protected
    cor: string;

  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setcodigo(pcodigo: integer);
    procedure setcor(pcor: string);
    function getcodigo: integer;
    function getcor: string;
    function clone: Cores;
  end;

implementation


{ Cores }

function Cores.clone: Cores;
begin
  result := Cores.Crieobj;
  result.setcodigo(codigo);
  result.setcor(cor);
  result.setCadastro(cadastro);
  result.setUlt_Alt(ult_alt);
end;

constructor Cores.Crieobj;
begin

end;

destructor Cores.Destrua_se;
begin

end;

function Cores.getcodigo: integer;
begin
  result := codigo;
end;

function Cores.getcor: string;
begin
  result := cor
end;

procedure Cores.setcodigo(pcodigo: integer);
begin
  codigo := pcodigo;
end;

procedure Cores.setcor(pcor: string);
begin
  cor := pcor;
end;

end.
