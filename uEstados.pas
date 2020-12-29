unit uEstados;

interface

uses upaises, uGenerica;

type
  Estados = class(Generica)

  private

  protected
    estado: string;
    UF: string;
    umpais: paises;
  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setestado(pestado: string);
    procedure setUF(pUF: string);
    procedure setumpais(ppais: paises);
    function getestado: string;
    function getUF: string;
    function getumpais: paises;
    function clone: Estados;
  end;

implementation

{ Estados }

function Estados.clone: Estados;
begin
  result := Estados.Crieobj;
  result.setCodigo(codigo);
  result.setestado(estado);
  result.setUF(UF);
  result.setumpais(umpais);
  result.setCadastro(cadastro);
  result.setUlt_Alt(Ult_Alt);
end;

constructor Estados.Crieobj;
begin
  umpais := paises.Crieobj;
end;

destructor Estados.Destrua_se;
begin
  umpais.Destrua_se;
end;

function Estados.getestado: string;
begin
  result := estado;
end;

function Estados.getUF: string;
begin
  result := UF;
end;

function Estados.getumpais: paises;
begin
  result := umpais;
end;

procedure Estados.setestado(pestado: string);
begin
  estado := pestado;
end;

procedure Estados.setUF(pUF: string);
begin
  UF := pUF;
end;

procedure Estados.setumpais(ppais: paises);
begin
  umpais := ppais;
end;

end.
