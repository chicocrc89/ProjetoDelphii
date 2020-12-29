unit uControllerMarcas;

interface

uses uController, uDM, uDaomarcas, DB;

type
  Controllermarcas = class(controller)
  private

  protected
    umadaomarca: Daomarcas;
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

function Controllermarcas.Carregar(pObj: TObject): string;
begin
  self.umadaomarca.Carregar(pObj);
end;

constructor Controllermarcas.CrieObj;
begin
  umadaomarca := Daomarcas.CrieObj;
end;

destructor Controllermarcas.Destrua_se;
begin
  umadaomarca.Destrua_se;
end;

function Controllermarcas.Excluir(pObj: TObject): string;
begin
  self.umadaomarca.Excluir(pObj);
end;

function Controllermarcas.getds: Tdatasource;
begin
  result := umadaomarca.getds;
end;

function Controllermarcas.Pesquisar(pChave: string): string;
begin
  self.umadaomarca.Pesquisar(pChave);
end;

function Controllermarcas.Salvar(pObj: TObject): string;
begin
  self.umadaomarca.Salvar(pObj);
end;

procedure Controllermarcas.setDM(pDM: TDM);
begin
  self.umadaomarca.setDM(pDM);
end;

end.
