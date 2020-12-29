unit uFabricantes;

interface

uses uGenerica, FireDAC.Comp.Client;

type
  Fabricantes = class(Generica)
  private

  protected
    fabricante: string;
    cnpj: string;
  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setcodigo(pcodigo: integer);
    procedure setfabricante(pfabricante: string);
    procedure setcnpj(pcnpj: string);
    function getcodigo: integer;
    function getfabricante: string;
    function getcnpj: string;
    function clone: Fabricantes;
  end;

implementation

{ Fabricante }

{ Fabricantes }

function Fabricantes.clone: Fabricantes;
begin
  result := Fabricantes.Crieobj;
  result.setcodigo(codigo);
  result.setfabricante(fabricante);
  result.setcnpj(cnpj);
  result.setCadastro(Cadastro);
  result.setUlt_Alt(Ult_Alt);
end;

constructor Fabricantes.Crieobj;
begin

end;

destructor Fabricantes.Destrua_se;
begin

end;

function Fabricantes.getcnpj: string;
begin
  result := cnpj;
end;

function Fabricantes.getcodigo: integer;
begin
  result := codigo;
end;

function Fabricantes.getfabricante: string;
begin
  result := fabricante;
end;

procedure Fabricantes.setcnpj(pcnpj: string);
begin
  cnpj := pcnpj;
end;

procedure Fabricantes.setcodigo(pcodigo: integer);
begin
  codigo := pcodigo;
end;

procedure Fabricantes.setfabricante(pfabricante: string);
begin
  fabricante := pfabricante;
end;

end.
