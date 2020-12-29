unit uControllerCores;

interface

uses uController, uDM, uDaocores, DB;

type
  Controllercores = class(controller)
  private

  protected
    umadaocor: Daocores;
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

function Controllercores.Carregar(pObj: TObject): string;
begin
  self.umadaocor.Carregar(pObj);
end;

constructor Controllercores.CrieObj;
begin
  umadaocor := Daocores.CrieObj;
end;

destructor Controllercores.Destrua_se;
begin
  umadaocor.Destrua_se;
end;

function Controllercores.Excluir(pObj: TObject): string;
begin
  self.umadaocor.Excluir(pObj);
end;

function Controllercores.getds: Tdatasource;
begin
  result := umadaocor.getds;
end;

function Controllercores.Pesquisar(pChave: string): string;
begin
  self.umadaocor.Pesquisar(pChave);
end;

function Controllercores.Salvar(pObj: TObject): string;
begin
  self.umadaocor.Salvar(pObj);
end;

procedure Controllercores.setDM(pDM: TDM);
begin
  self.umadaocor.setDM(pDM);
end;

end.
