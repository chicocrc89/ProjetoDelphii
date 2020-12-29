unit uControllergrupos;

interface

uses uController, uDM, uDaogrupos, DB;

type
  Controllergrupos = class(controller)
  private

  protected
    umadaogrupo: Daogrupos;
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

function Controllergrupos.Carregar(pObj: TObject): string;
begin
  self.umadaogrupo.Carregar(pObj);
end;

constructor Controllergrupos.CrieObj;
begin
  umadaogrupo := Daogrupos.CrieObj;
end;

destructor Controllergrupos.Destrua_se;
begin
  umadaogrupo.Destrua_se;
end;

function Controllergrupos.Excluir(pObj: TObject): string;
begin
  self.umadaogrupo.Excluir(pObj);
end;

function Controllergrupos.getds: Tdatasource;
begin
  result := umadaogrupo.getds;
end;

function Controllergrupos.Pesquisar(pChave: string): string;
begin
  self.umadaogrupo.Pesquisar(pChave);
end;

function Controllergrupos.Salvar(pObj: TObject): string;
begin
  self.umadaogrupo.Salvar(pObj);
end;

procedure Controllergrupos.setDM(pDM: TDM);
begin
  self.umadaogrupo.setDM(pDM);
end;

end.
