unit uFornecedores;

interface

uses uGenerica, uCidades, uCondicoes;

type
  Fornecedores = class(Generica)
  private

  protected
    status : string;
    tp_fornecedor : string;
    razao: string;
    cnpj: string;
    insc_est: string;
    nome_fantasia : string;
    tel_comercial : string;
    celular : string;
    endereco: string;
    numero: integer;
    bairro: string;
    umacidade: Cidades;
    umacondicao : Condicoes;
  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setstatus(pstatus : string);
    procedure settp_fornecedor(ptp_fornecedor : string);
    procedure setrazao(prazao: string);
    procedure setcnpj(pcnpj: string);
    procedure setinsc_est(pinsc_est: string);
    procedure setnome_fantasia(pnome_fantasia : string);
    procedure settel_comercial(ptel_comercial : string);
    procedure setcelular(pcelular : string);
    procedure setendereco(pendereco: string);
    procedure setnumero(pnumero: integer);
    procedure setbairro(pbairro: string);
    procedure setumacidade(pcidade: Cidades);
    procedure setumacondicao(pcondicao : Condicoes);
    function getstatus : string;
    function gettp_fornecedor : string;
    function getrazao: string;
    function getcnpj: string;
    function getinsc_est: string;
    function getnome_fantasia : string;
    function gettel_comercial : string;
    function getceular : string;
    function getendereco: string;
    function getnumero: integer;
    function getbairro: string;
    function getumacidade: Cidades;
    function getumacondicao : Condicoes;
    function clone: Fornecedores;

  end;

implementation

{ Fornecedores }

function Fornecedores.clone: Fornecedores;
begin
  result := Fornecedores.Crieobj;
  result.setCodigo(codigo);
  result.setstatus(status);
  result.settp_fornecedor(tp_fornecedor);
  result.setrazao(razao);
  result.setcnpj(cnpj);
  result.setinsc_est(insc_est);
  result.setnome_fantasia(nome_fantasia);
  result.settel_comercial(tel_comercial);
  result.setcelular(celular);
  result.setendereco(endereco);
  result.setnumero(numero);
  result.setbairro(bairro);
  result.setumacidade(umacidade);
  result.setumacondicao(umacondicao);
  result.setCadastro(Cadastro);
  result.setUlt_Alt(Ult_Alt);
end;

constructor Fornecedores.Crieobj;
begin
  umacondicao := Condicoes.Crieobj;
  umacidade := Cidades.Crieobj;
end;

destructor Fornecedores.Destrua_se;
begin
  umacondicao.Destrua_se;
  umacidade.Destrua_se;
end;

function Fornecedores.getbairro: string;
begin
  result := bairro;
end;

function Fornecedores.getceular: string;
begin
  result := celular;
end;

function Fornecedores.getcnpj: string;
begin
  result := cnpj;
end;

function Fornecedores.getendereco: string;
begin
  result := endereco;
end;

function Fornecedores.getinsc_est: string;
begin
  result := insc_est;
end;

function Fornecedores.getrazao: string;
begin
  result := razao;
end;

function Fornecedores.getstatus: string;
begin
  result := status;
end;

function Fornecedores.getnome_fantasia: string;
begin
  result := nome_fantasia;
end;

function Fornecedores.gettel_comercial: string;
begin
  result := tel_comercial;
end;

function Fornecedores.gettp_fornecedor: string;
begin
  result := tp_fornecedor;
end;

function Fornecedores.getnumero: integer;
begin
  result := numero;
end;

function Fornecedores.getumacidade: Cidades;
begin
  result := umacidade;
end;

function Fornecedores.getumacondicao: Condicoes;
begin
  result := umacondicao;
end;

procedure Fornecedores.setbairro(pbairro: string);
begin
  bairro := pbairro;
end;

procedure Fornecedores.setcelular(pcelular: string);
begin
  celular := pcelular;
end;

procedure Fornecedores.setcnpj(pcnpj: string);
begin
  cnpj := pcnpj;
end;

procedure Fornecedores.setendereco(pendereco: string);
begin
  endereco := pendereco;
end;

procedure Fornecedores.setinsc_est(pinsc_est: string);
begin
  insc_est := pinsc_est;
end;

procedure Fornecedores.setnome_fantasia(pnome_fantasia: string);
begin
  nome_fantasia := pnome_fantasia;
end;

procedure Fornecedores.setnumero(pnumero: integer);
begin
  numero := pnumero;
end;

procedure Fornecedores.setrazao(prazao: string);
begin
  razao := prazao;
end;

procedure Fornecedores.setstatus(pstatus: string);
begin
  status := pstatus;
end;

procedure Fornecedores.settel_comercial(ptel_comercial: string);
begin
  tel_comercial := ptel_comercial;
end;

procedure Fornecedores.settp_fornecedor(ptp_fornecedor: string);
begin
  tp_fornecedor := ptp_fornecedor;
end;

procedure Fornecedores.setumacidade(pcidade: Cidades);
begin
  umacidade := pcidade;
end;

procedure Fornecedores.setumacondicao(pcondicao: Condicoes);
begin
  umacondicao := pcondicao;
end;


end.
