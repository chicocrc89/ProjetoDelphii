unit uUsuarios;

interface

uses uGenerica, uFuncionarios;

type
  Usuarios = class(Generica)
  private

  protected
    nome : string;
    usuario: string;
    senha: string;
    permissao: string;
    umfuncionario : Funcionarios;
    status : string;
  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setusuario(pusuario: string);
    procedure setnome (pnome : string);
    procedure setsenha(psenha: string);
    procedure setpermissao(ppermissao: string);
    procedure setumfuncionario(pfuncionario: Funcionarios);
    procedure setstatus (pstatus : string);
    function getusuario: string;
    function getnome : string;
    function getumfuncionario : Funcionarios;
    function getstatus : string;
    function getsenha: string;
    function getpermissao: string;
    function clone: Usuarios;
  end;

implementation

{ Usuarios }


{ Usuarios }

function Usuarios.clone: Usuarios;
begin
  result := Usuarios.Crieobj;
  result.setusuario(usuario);
  result.setnome(nome);
  result.setsenha(senha);
  result.setpermissao(permissao);
  result.setumfuncionario(umfuncionario);
  result.setstatus(status);
  result.setCadastro(Cadastro);
  result.setUlt_Alt(Ult_Alt);
  result.setCodigo_Usuario(codigo_usuario);
end;

constructor Usuarios.Crieobj;
begin
  umfuncionario := Funcionarios.Crieobj;
end;

destructor Usuarios.Destrua_se;
begin
  umfuncionario.Destrua_se;
end;

function Usuarios.getnome: string;
begin
  result := nome;
end;

function Usuarios.getpermissao: string;
begin
  result := permissao;
end;

function Usuarios.getsenha: string;
begin
  result := senha;
end;

function Usuarios.getstatus: string;
begin
  result := status;
end;

function Usuarios.getumfuncionario: Funcionarios;
begin
  result := umfuncionario;
end;

function Usuarios.getusuario: string;
begin
  result := usuario;
end;

procedure Usuarios.setnome(pnome: string);
begin
  nome := pnome;
end;

procedure Usuarios.setpermissao(ppermissao: string);
begin
  permissao := ppermissao;
end;

procedure Usuarios.setsenha(psenha: string);
begin
  senha := psenha;
end;

procedure Usuarios.setstatus(pstatus: string);
begin
  status := pstatus;
end;

procedure Usuarios.setumfuncionario(pfuncionario: Funcionarios);
begin
  umfuncionario := pfuncionario;
end;

procedure Usuarios.setusuario(pusuario: string);
begin
  usuario := pusuario;
end;

end.
