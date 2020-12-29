unit uControllerusuarios;

interface

uses sysutils, ucontroller, DB, uDM, uUsuarios, uDaoUsuarios, uControllerFuncionarios;

type
  Controllerusuarios = class(controller)
  private

  protected
  umadaousuario : DaoUsuarios;
  umactrlfuncionario : ControllerFuncionarios;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
    procedure setctrlfuncionario(pObj: TObject);
    function getctrlfuncionario: ControllerFuncionarios;
  end;

implementation

{ Controllerusuarios }

function Controllerusuarios.Carregar(pObj: TObject): string;
var musuario : Usuarios;
begin
  self.umadaousuario.Carregar(pObj);
  musuario := Usuarios (pObj);
  self.umactrlfuncionario.Pesquisar(inttostr(musuario.getumfuncionario.getCodigo));
  self.umactrlfuncionario.Carregar(musuario.getumfuncionario);
end;

constructor Controllerusuarios.CrieObj;
begin
  self.umadaousuario := DaoUsuarios.CrieObj;
end;

destructor Controllerusuarios.Destrua_se;
begin
  self.umadaousuario.Destrua_se;
end;

function Controllerusuarios.Excluir(pObj: TObject): string;
begin
  self.umadaousuario.Excluir(pObj);
end;

function Controllerusuarios.getctrlfuncionario: ControllerFuncionarios;
begin
  result := umactrlfuncionario;
end;

function Controllerusuarios.getds: Tdatasource;
begin
  result := umadaousuario.getds;
end;

function Controllerusuarios.Pesquisar(pChave: string): string;
begin
  self.umadaousuario.Pesquisar(pChave);
end;

function Controllerusuarios.Salvar(pObj: TObject): string;
begin
  self.umadaousuario.Salvar(pObj);
end;

procedure Controllerusuarios.setctrlfuncionario(pObj: TObject);
begin
  umactrlfuncionario := ControllerFuncionarios (pObj);
end;

procedure Controllerusuarios.setDM(pDM: TDM);
begin
  self.umadaousuario.setDM(pDM);
end;

end.
