unit uGrupos;

interface

uses uGenerica;

type
  Grupos = class(Generica)
  private

  protected
    grupo: string;
  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setgrupo(pgrupo: string);
    function getgrupo: string;
    function clone: Grupos;
  end;

implementation

{ Grupo }

function Grupos.clone: Grupos;
begin
  result := Grupos.Crieobj;
  result.setcodigo(codigo);
  result.setgrupo(grupo);
  result.setCadastro(Cadastro);
  result.setUlt_Alt(Ult_Alt);
end;

constructor Grupos.Crieobj;
begin

end;

destructor Grupos.Destrua_se;
begin

end;

function Grupos.getgrupo: string;
begin
  result := grupo;
end;

procedure Grupos.setgrupo(pgrupo: string);
begin
  grupo := pgrupo;
end;

end.
