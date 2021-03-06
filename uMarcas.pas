unit uMarcas;

interface

uses uGenerica;

type
  Marcas = class(Generica)
  private

  protected
    marca: string;
  public
    constructor crieobj;
    destructor Destrua_se;
    procedure setcodigo(pcodigo: integer);
    procedure setmarca(pmarca: string);
    function getcodigo: integer;
    function getmarca: string;
    function clone: Marcas;
  end;

implementation

{ Marcas }

function Marcas.clone: Marcas;
begin
  result := Marcas.crieobj;
  result.setcodigo(codigo);
  result.setmarca(marca);
  result.setCadastro(Cadastro);
  result.setUlt_Alt(Ult_Alt);
  result.setCodigo_Usuario(Codigo_Usuario);
end;

constructor Marcas.crieobj;
begin

end;

destructor Marcas.Destrua_se;
begin

end;

function Marcas.getcodigo: integer;
begin
  result := codigo;
end;

function Marcas.getmarca: string;
begin
  result := marca;
end;

procedure Marcas.setcodigo(pcodigo: integer);
begin
  codigo := pcodigo;
end;

procedure Marcas.setmarca(pmarca: string);
begin
  marca := pmarca;
end;

end.
