unit uControllerServicos;

interface

uses uDM, DB, ucontroller, uDaoservicos, uservicos, SysUtils;

type
  Controllerservicos = class(controller)
  private

  protected
    umadaoservico       : Daoservicos;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
  end;

implementation

{ Controllerservicos }


{ Controllerservicos }

function Controllerservicos.Carregar(pObj: TObject): string;
var
  mservico: servicos;
begin
  self.umadaoservico.Carregar(pObj);
  mservico := servicos(pObj);
end;

constructor Controllerservicos.CrieObj;
begin
  self.umadaoservico := Daoservicos.CrieObj;
end;

destructor Controllerservicos.Destrua_se;
begin
  self.umadaoservico.Destrua_se;
end;

function Controllerservicos.Excluir(pObj: TObject): string;
begin
  self.umadaoservico.Excluir(pObj);
end;

function Controllerservicos.getds: Tdatasource;
begin
  result := umadaoservico.getds;
end;

function Controllerservicos.Pesquisar(pChave: string): string;
begin
  self.umadaoservico.Pesquisar(pChave);
end;

function Controllerservicos.Salvar(pObj: TObject): string;
begin
  self.umadaoservico.Salvar(pObj);
end;

procedure Controllerservicos.setDM(pDM: TDM);
begin
  self.umadaoservico.setDM(pDM);
end;

end.
