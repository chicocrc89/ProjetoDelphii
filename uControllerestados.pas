unit uControllerestados;

interface

uses uController, DB, uDM, uDaoestados, uDaoPaises, uControllerPaises, uEstados,
  SysUtils;

type
  Controllerestados = class(controller)
  private

  protected
    umadaoestado: Daoestados;
    umactrlpais: ControllerPaises;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
    procedure setctrlpais(pObj: TObject);
    function getctrlpais: ControllerPaises;
  end;

implementation

{ Controllerestados }

function Controllerestados.Carregar(pObj: TObject): string;
var
  mestados: Estados;
begin
  self.umadaoestado.Carregar(pObj);
  mestados := Estados(pObj);
  self.umactrlpais.Pesquisar(inttostr(mestados.getumpais.getcodigo));
  self.umactrlpais.Carregar(mestados.getumpais);
end;

constructor Controllerestados.CrieObj;
begin
  self.umadaoestado := Daoestados.CrieObj;
end;

destructor Controllerestados.Destrua_se;
begin
  self.umadaoestado.Destrua_se;
end;

function Controllerestados.Excluir(pObj: TObject): string;
begin
  self.umadaoestado.Excluir(pObj);
end;

function Controllerestados.getctrlpais: ControllerPaises;
begin
  result := umactrlpais;
end;

function Controllerestados.getds: Tdatasource;
begin
  result := umadaoestado.getds;
end;

function Controllerestados.Pesquisar(pChave: string): string;
begin
  self.umadaoestado.Pesquisar(pChave);
end;

function Controllerestados.Salvar(pObj: TObject): string;
begin
  self.umadaoestado.Salvar(pObj);
end;

procedure Controllerestados.setctrlpais(pObj: TObject);
begin
  umactrlpais := ControllerPaises(pObj);
end;

procedure Controllerestados.setDM(pDM: TDM);
begin
  self.umadaoestado.setDM(pDM);
end;

end.