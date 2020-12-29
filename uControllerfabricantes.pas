unit uControllerfabricantes;

interface

uses uDM, DB, uController, uDaoFabricantes;

type
  Controllerfabricantes = class(controller)
  private

  protected
    umadaofabricante : DaoFabricantes;
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

{ Controllerfabricantes }

function Controllerfabricantes.Carregar(pObj: TObject): string;
begin
  self.umadaofabricante.Carregar(pObj);
end;

constructor Controllerfabricantes.CrieObj;
begin
  umadaofabricante := DaoFabricantes.CrieObj;
end;

destructor Controllerfabricantes.Destrua_se;
begin
  umadaofabricante.Destrua_se;
end;

function Controllerfabricantes.Excluir(pObj: TObject): string;
begin
  self.umadaofabricante.Excluir(pObj);
end;

function Controllerfabricantes.getds: Tdatasource;
begin
  result := umadaofabricante.getds;
end;

function Controllerfabricantes.Pesquisar(pChave: string): string;
begin
  self.umadaofabricante.Pesquisar(pChave);
end;

function Controllerfabricantes.Salvar(pObj: TObject): string;
begin
  self.umadaofabricante.Salvar(pObj);
end;

procedure Controllerfabricantes.setDM(pDM: TDM);
begin
  self.umadaofabricante.setDM(pDM);
end;

end.
