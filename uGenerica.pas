unit uGenerica;

interface

type
  Generica = class
  private

  protected
    Codigo: integer;
    Cadastro: TDate;
    Ult_Alt: TDate;
    Codigo_Usuario: integer;
  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setCodigo(pCodigo: integer);
    procedure setCadastro(pCadastro: TDate);
    procedure setUlt_Alt(pUlt_Alt: TDate);
    procedure setCodigo_Usuario(pCodigo_Usuario: integer);
    function getCodigo: integer;
    function getCadastro: TDate;
    function getUlt_Alt: TDate;
    function getCodigo_Usuario: integer;
  end;

implementation

{ Generica }

constructor Generica.Crieobj;
begin

end;

destructor Generica.Destrua_se;
begin

end;

function Generica.getCadastro: TDate;
begin
  result := Cadastro;
end;

function Generica.getCodigo: integer;
begin
  result := Codigo;
end;

function Generica.getCodigo_Usuario: integer;
begin
  result := Codigo_Usuario;
end;

function Generica.getUlt_Alt: TDate;
begin
  result := Ult_Alt;
end;

procedure Generica.setCadastro(pCadastro: TDate);
begin
  Cadastro := pCadastro;
end;

procedure Generica.setCodigo(pCodigo: integer);
begin
  Codigo := pCodigo;
end;

procedure Generica.setCodigo_Usuario(pCodigo_Usuario: integer);
begin
  Codigo_Usuario := pCodigo_Usuario;
end;

procedure Generica.setUlt_Alt(pUlt_Alt: TDate);
begin
  Ult_Alt := pUlt_Alt;
end;

end.
