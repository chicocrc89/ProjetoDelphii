unit uPaises;

interface

uses uGenerica;

type
  Paises = class(Generica)
  private

  protected
    pais: string;
    DDI: string;
    sigla: string;

  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setcodigo(pcodigo: integer);
    procedure setpais(ppais: string);
    procedure setDDI(pDDI: string);
    procedure setsigra(psigla: string);
    function getcodigo: integer;
    function getpais: string;
    function getDDI: string;
    function getsigla: string;
    function clone: Paises;
  end;

implementation

{ Paises }

function Paises.clone: Paises;
begin
  result := Paises.Crieobj;
  result.setcodigo(codigo);
  result.setpais(pais);
  result.setDDI(DDI);
  result.setsigra(sigla);
  result.setCadastro(Cadastro);
  result.setUlt_Alt(Ult_Alt);
end;

constructor Paises.Crieobj;
begin

end;

destructor Paises.Destrua_se;
begin

end;

function Paises.getcodigo: integer;
begin
  result := codigo;
end;

function Paises.getDDI: string;
begin
  result := DDI;
end;

function Paises.getpais: string;
begin
  result := pais;
end;

function Paises.getsigla: string;
begin
  result := sigla;
end;

procedure Paises.setcodigo(pcodigo: integer);
begin
  codigo := pcodigo;
end;

procedure Paises.setDDI(pDDI: string);
begin
  DDI := pDDI;
end;

procedure Paises.setpais(ppais: string);
begin
  pais := ppais;
end;

procedure Paises.setsigra(psigla: string);
begin
  sigla := psigla;
end;

end.
