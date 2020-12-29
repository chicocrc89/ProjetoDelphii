unit uControllercombustiveis;

interface

uses uController, uDM, uDaocombustiveis, DB;

type
  Controllercombustiveis = class(controller)
  private

  protected
    umadaocombustivel: Daocombustiveis;
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

function Controllercombustiveis.Carregar(pObj: TObject): string;
begin
  self.umadaocombustivel.Carregar(pObj);
end;

constructor Controllercombustiveis.CrieObj;
begin
  umadaocombustivel := Daocombustiveis.CrieObj;
end;

destructor Controllercombustiveis.Destrua_se;
begin
  umadaocombustivel.Destrua_se;
end;

function Controllercombustiveis.Excluir(pObj: TObject): string;
begin
  self.umadaocombustivel.Excluir(pObj);
end;

function Controllercombustiveis.getds: Tdatasource;
begin
  result := umadaocombustivel.getds;
end;

function Controllercombustiveis.Pesquisar(pChave: string): string;
begin
  self.umadaocombustivel.Pesquisar(pChave);
end;

function Controllercombustiveis.Salvar(pObj: TObject): string;
begin
  self.umadaocombustivel.Salvar(pObj);
end;

procedure Controllercombustiveis.setDM(pDM: TDM);
begin
  self.umadaocombustivel.setDM(pDM);
end;

end.
