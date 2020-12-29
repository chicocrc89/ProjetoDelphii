unit uControllerVeiculos;

interface

uses sysutils, ucontroller, uDM, DB, uVeiculos, uDaoVeiculos,
  uControllerModelos, uControllercores, uControllercombustiveis;

type
  ControllerVeiculos = class(controller)
  private

  protected
    umadaoveiculo: DaoVeiculos;
    umactrlmodelo: ControllerModelos;
    umactrlcor : ControllerCores;
    umactrlcombustivel : ControllerCombustiveis;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
    procedure setctrlmodelo(pObj: TObject);
    procedure setctrlcor(pObj : TObject);
    procedure setctrlcombustivel(pObj : TObject);
    function getctrlmodelo: ControllerModelos;
    function getctrlcor : ControllerCores;
    function getctrlcombustivel : ControllerCombustiveis;
  end;

implementation

{ Controllerlaboratorios }

function ControllerVeiculos.Carregar(pObj: TObject): string;
var
  mveiculo: Veiculos;
begin
  self.umadaoveiculo.Carregar(pObj);
  mveiculo := Veiculos(pObj);
  umactrlmodelo.Pesquisar(inttostr(mveiculo.getummodelo.getcodigo));
  self.umactrlmodelo.Carregar(mveiculo.getummodelo);
  umactrlcor.Pesquisar(inttostr(mveiculo.getumacor.getcodigo));
  self.umactrlcor.Carregar(mveiculo.getumacor);
  umactrlcombustivel.Pesquisar(inttostr(mveiculo.getumcombustivel.getCodigo));
  self.umactrlcombustivel.Carregar(mveiculo.getumcombustivel);
end;

constructor ControllerVeiculos.CrieObj;
begin
  self.umadaoveiculo := DaoVeiculos.CrieObj;
end;

destructor ControllerVeiculos.Destrua_se;
begin
  self.umadaoveiculo.Destrua_se;
end;

function ControllerVeiculos.Excluir(pObj: TObject): string;
begin
  self.umadaoveiculo.Excluir(pObj);
end;

function ControllerVeiculos.getctrlcombustivel: ControllerCombustiveis;
begin
  result := umactrlcombustivel;
end;

function ControllerVeiculos.getctrlcor: ControllerCores;
begin
  result := umactrlcor;
end;

function ControllerVeiculos.getctrlmodelo: ControllerModelos;
begin
  result := umactrlmodelo;
end;

function ControllerVeiculos.getds: Tdatasource;
begin
  result := umadaoveiculo.getds;
end;

function ControllerVeiculos.Pesquisar(pChave: string): string;
begin
  self.umadaoveiculo.Pesquisar(pChave);
end;

function ControllerVeiculos.Salvar(pObj: TObject): string;
begin
  self.umadaoveiculo.Salvar(pObj);
end;

procedure ControllerVeiculos.setctrlcombustivel(pObj: TObject);
begin
  umactrlcombustivel := ControllerCombustiveis(pObj);
end;

procedure ControllerVeiculos.setctrlcor(pObj: TObject);
begin
  umactrlcor := ControllerCores(pObj);
end;

procedure ControllerVeiculos.setctrlmodelo(pObj: TObject);
begin
  umactrlmodelo := ControllerModelos(pObj);
end;

procedure ControllerVeiculos.setDM(pDM: TDM);
begin
  self.umadaoveiculo.setDM(pDM);
end;

end.
