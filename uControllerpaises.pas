unit uControllerpaises;

interface

uses uController, uDM, uDaopaises, DB;

type
  Controllerpaises = class(controller)
  private

  protected
    umadaopais: Daopaises;
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

{ Controllerpais }

function Controllerpaises.Carregar(pObj: TObject): string;
begin
  self.umadaopais.Carregar(pObj);
end;

constructor Controllerpaises.CrieObj;
begin
  umadaopais := Daopaises.CrieObj;
end;

destructor Controllerpaises.Destrua_se;
begin
  umadaopais.Destrua_se;
end;

function Controllerpaises.Excluir(pObj: TObject): string;
begin
  self.umadaopais.Excluir(pObj);
end;

function Controllerpaises.getds: Tdatasource;
begin
  result := umadaopais.getds;
end;

function Controllerpaises.Pesquisar(pChave: string): string;
begin
  self.umadaopais.Pesquisar(pChave);
end;

function Controllerpaises.Salvar(pObj: TObject): string;
begin
  self.umadaopais.Salvar(pObj);
end;

procedure Controllerpaises.setDM(pDM: TDM);
begin
  self.umadaopais.setDM(pDM);
end;

end.
