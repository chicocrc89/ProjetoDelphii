unit uModelos;

interface

uses uGenerica, uMarcas;

type
  Modelos = class(Generica)
  private

  protected
    Modelo: string;
    umamarca: Marcas;
  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setcodigo(pcodigo: integer);
    procedure setmodelo(pmodelo: string);
    procedure setumamarca(pmarca: Marcas);
    function getcodigo: integer;
    function getmodelo: string;
    function getumamarca: Marcas;
    function clone: Modelos;
  end;

implementation

{ Modelos }

function Modelos.clone: Modelos;
begin
  result := Modelos.Crieobj;
  result.setcodigo(Codigo);
  result.setmodelo(Modelo);
  result.setumamarca(umamarca);
  result.setCadastro(Cadastro);
  result.setUlt_Alt(Ult_Alt);
  result.setCodigo_Usuario(Codigo_Usuario);
end;

constructor Modelos.Crieobj;
begin
  umamarca := Marcas.Crieobj;
end;

destructor Modelos.Destrua_se;
begin
  umamarca.Destrua_se;
end;

function Modelos.getcodigo: integer;
begin
  result := Codigo;
end;

function Modelos.getmodelo: string;
begin
  result := Modelo;
end;

function Modelos.getumamarca: Marcas;
begin
  result := umamarca;
end;

procedure Modelos.setcodigo(pcodigo: integer);
begin
  Codigo := pcodigo;
end;

procedure Modelos.setmodelo(pmodelo: string);
begin
  Modelo := pmodelo;
end;

procedure Modelos.setumamarca(pmarca: Marcas);
begin
  umamarca := pmarca;
end;

end.
