unit uFuncionarios;

interface

uses uGenerica, uCidades;

type
  Funcionarios = class(Generica)
  private

  protected
    nome: string;
    cargo: string;
    sexo: string;
    status: string;
    cpf: string;
    telefone: string;
    celular: string;
    email: string;
    comissao: real;
    datanasc: Tdate;
    endereco: string;
    numero: integer;
    bairro: string;
    umacidade: Cidades;

  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setnome(pnome: string);
    procedure setcpf(pcpf: string);
    procedure setdatanasc(pdatanasc: Tdate);
    procedure setendereco(pendereco: string);
    procedure setnumero(pnumero: integer);
    procedure setbairro(pbairro: string);
    procedure setumacidade(pcidade: Cidades);
    procedure setcargo(pcargo: string);
    procedure setcelular(pcelular: string);
    procedure settelefone(ptelefone: string);
    procedure setsexo(psexo: string);
    procedure setstatus(pstatus: string);
    procedure setemail(pemail: string);
    procedure setcomissao(pcomissao: real);
    function getnome: string;
    function getcpf: string;
    function getcelular: string;
    function gettelefone: string;
    function getsexo: string;
    function getstatus: string;
    function getemail: string;
    function getdatanasc: Tdate;
    function getendereco: string;
    function getnumero: integer;
    function getbairro: string;
    function getumacidade: Cidades;
    function getcargo: string;
    function getcomissao: real;
    function clone: Funcionarios;
  end;

implementation

{ Funcionarios }

function Funcionarios.clone: Funcionarios;
begin
  result := Funcionarios.Crieobj;
  result.setCodigo(codigo);
  result.setnome(nome);
  result.setcpf(cpf);
  result.setdatanasc(datanasc);
  result.setendereco(endereco);
  result.setnumero(numero);
  result.setbairro(bairro);
  result.setumacidade(umacidade);
  result.setcargo(cargo);
  result.setcelular(celular);
  result.settelefone(telefone);
  result.setsexo(sexo);
  result.setemail(email);
  result.setstatus(status);
  result.setcomissao(comissao);
  result.setCadastro(Cadastro);
  result.setUlt_Alt(Ult_Alt);
end;

constructor Funcionarios.Crieobj;
begin
  umacidade := Cidades.Crieobj;
end;

destructor Funcionarios.Destrua_se;
begin
  umacidade.Destrua_se;
end;

function Funcionarios.getbairro: string;
begin
  result := bairro;
end;

function Funcionarios.getcargo: string;
begin
  result := cargo;
end;

function Funcionarios.getcelular: string;
begin
  result := celular;
end;

function Funcionarios.getcomissao: real;
begin
  result := comissao;
end;

function Funcionarios.getcpf: string;
begin
  result := cpf;
end;

function Funcionarios.getdatanasc: Tdate;
begin
  result := datanasc;
end;

function Funcionarios.getemail: string;
begin
  result := email;
end;

function Funcionarios.getendereco: string;
begin
  result := endereco;
end;

function Funcionarios.getnome: string;
begin
  result := nome;
end;

function Funcionarios.getnumero: integer;
begin
  result := numero;
end;

function Funcionarios.getsexo: string;
begin
  result := sexo;
end;

function Funcionarios.getstatus: string;
begin
  result := status;
end;

function Funcionarios.gettelefone: string;
begin
  result := telefone;
end;

function Funcionarios.getumacidade: Cidades;
begin
  result := umacidade;
end;

procedure Funcionarios.setbairro(pbairro: string);
begin
  bairro := pbairro;
end;

procedure Funcionarios.setcargo(pcargo: string);
begin
  cargo := pcargo;
end;

procedure Funcionarios.setcelular(pcelular: string);
begin
  celular := pcelular;
end;

procedure Funcionarios.setcomissao(pcomissao: real);
begin
  comissao := pcomissao;
end;

procedure Funcionarios.setcpf(pcpf: string);
begin
  cpf := pcpf;
end;

procedure Funcionarios.setdatanasc(pdatanasc: Tdate);
begin
  datanasc := pdatanasc;
end;

procedure Funcionarios.setemail(pemail: string);
begin
  email := pemail;
end;

procedure Funcionarios.setendereco(pendereco: string);
begin
  endereco := pendereco;
end;

procedure Funcionarios.setnome(pnome: string);
begin
  nome := pnome;
end;

procedure Funcionarios.setnumero(pnumero: integer);
begin
  numero := pnumero;
end;

procedure Funcionarios.setsexo(psexo: string);
begin
  sexo := psexo;
end;

procedure Funcionarios.setstatus(pstatus: string);
begin
  status := pstatus;
end;

procedure Funcionarios.settelefone(ptelefone: string);
begin
  telefone := ptelefone;
end;

procedure Funcionarios.setumacidade(pcidade: Cidades);
begin
  umacidade := pcidade;
end;

end.
