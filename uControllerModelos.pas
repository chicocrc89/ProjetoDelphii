unit uControllerModelos;

interface

uses sysutils, ucontroller, uDaomodelos, DB, uDM, umodelos, uControllerMarcas;

type
  Controllermodelos = class(controller)
  private

  protected
    umadaomodelo: Daomodelos;
    umactrlmarca: ControllerMarcas;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
    procedure setctrlmarca(pObj: TObject);
    function getctrlmarca: ControllerMarcas;
  end;

implementation

{ Controllermodelos }

function Controllermodelos.Carregar(pObj: TObject): string;
var
  mmodelo: modelos;
begin
  self.umadaomodelo.Carregar(pObj);
  mmodelo := modelos(pObj);
  umactrlmarca.Pesquisar(inttostr(mmodelo.getumamarca.getcodigo));
  self.umactrlmarca.Carregar(mmodelo.getumamarca);
end;

constructor Controllermodelos.CrieObj;
begin
  self.umadaomodelo := Daomodelos.CrieObj;
end;

destructor Controllermodelos.Destrua_se;
begin
  self.umadaomodelo.Destrua_se;
end;

function Controllermodelos.Excluir(pObj: TObject): string;
begin
  self.umadaomodelo.Excluir(pObj);
end;

function Controllermodelos.getctrlmarca: ControllerMarcas;
begin
  result := umactrlmarca;
end;

function Controllermodelos.getds: Tdatasource;
begin
  result := umadaomodelo.getds;
end;

function Controllermodelos.Pesquisar(pChave: string): string;
begin
  self.umadaomodelo.Pesquisar(pChave);
end;

function Controllermodelos.Salvar(pObj: TObject): string;
begin
  self.umadaomodelo.Salvar(pObj);
end;

procedure Controllermodelos.setctrlmarca(pObj: TObject);
begin
  umactrlmarca := ControllerMarcas(pObj);
end;

procedure Controllermodelos.setDM(pDM: TDM);
begin
  self.umadaomodelo.setDM(pDM);
end;

end.
