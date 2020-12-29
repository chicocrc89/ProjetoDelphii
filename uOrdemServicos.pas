unit uOrdemServicos;

interface

uses uGenerica, uClientes, uCores, uModelos, uUsuarios, uColecaoProdutos, uprodutos, uServicos, uColecaoServicos, ucondicoes,
uColecaoContasReceber, uFuncionarios;

type
  ordemservicos = class(Generica)
  private
    numero_os : integer;
    data_emissao : Tdate;
    hora_emissao : Ttime;
    umusuario : Usuarios;
    umfuncionario : Funcionarios;
    status : string;
    umcliente : Clientes;
    obs : string;
    problema_veiculo : string;
    total_produtos : Currency;
    total_servicos : Currency;
    outras_despesas : Currency;
    desconto : Currency;
    total_os : Currency;
    umacor : Cores;
    ummodelo : Modelos;
    umacondicao : Condicoes;
    placa_veiculo : string;
    ano_veiculo : string;
    umproduto : Produtos;
    umservico : Servicos;
    umacolecaoproduto : ColecaoProdutos;
    umacolecaoproduto_remove : ColecaoProdutos;
    umacolecaoservico : ColecaoServicos;
    umacolecaoservico_remove : ColecaoServicos;
    umacolecaocontasreceber : ColecaoContasReceber;
    umacolecaocontasreceber_remove : ColecaoContasReceber;
  protected

  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setnumero_os(pnumero_os : integer);
    procedure setdata_emissao(pdata_emissao : Tdate);
    procedure sethora_emissao(phora_emissao : Ttime);
    procedure setumusuario(pusuario : Usuarios);
    procedure setstatus(pstatus : string);
    procedure setumcliente(pcliente : Clientes);
    procedure setumacondicao(pcondicao : Condicoes);
    procedure setobs(pobs : string);
    procedure settotal_produtos(ptotal_produtos : Currency);
    procedure settotal_servicos(ptotal_servicos : Currency);
    procedure setoutras_despesas(poutras_despesas : Currency);
    procedure setdesconto(pdesconto : Currency);
    procedure settotal_os(ptotal_os : Currency);
    procedure setumacor(pcor : Cores);
    procedure setummodelo(pmodelo : Modelos);
    procedure setplaca_veiculo(pplaca_veiculo : string);
    procedure setano_veiculo(pano_veiculo : string);
    procedure setumproduto(pproduto : Produtos);
    procedure setumservico(pservico : Servicos);
    function getumproduto : Produtos;
    function getnumero_os : integer;
    function getdata_emissao : Tdate;
    function gethora_emissao : Ttime;
    function getumusuario : Usuarios;
    function getstatus : string;
    function getumcliente : Clientes;
    function getumacondicao : Condicoes;
    function getobs : string;
    function gettotal_produtos : Currency;
    function gettotal_servicos : Currency;
    function getoutras_despesas : Currency;
    function getdesconto : Currency;
    function gettotal_os : Currency;
    function getumacor : Cores;
    function getummodelo : Modelos;
    function getplaca_veiculo : string;
    function getano_veiculo : string;
    function getumservico : Servicos;
    procedure setumacolecaoproduto(pcolecaoproduto : Colecaoprodutos);
    function  getumacolecaoproduto : Colecaoprodutos;
    procedure setumacolecaoproduto_remove(pcolecaoproduto_remove : Colecaoprodutos);
    function  getumacolecaoproduto_remove : Colecaoprodutos;
    procedure setumacolecaoservico(pcolecaoservico : Colecaoservicos);
    function getumacolecaoservico : ColecaoServicos;
    procedure setumacolecaoservico_remove(pcolecaoservico_remove : Colecaoservicos);
    function getumacolecaoservico_remove : ColecaoServicos;
    procedure setumacolecaocontasreceber(pcolecaocontasreceber : ColecaoContasReceber);
    function getumacolecaocontasreceber : ColecaoContasReceber;
    procedure setumacolecaocontasreceber_remove(pcolecaocontasreceber_remove : ColecaoContasReceber);
    function getumacolecaocontasreceber_remove : ColecaoContasReceber;
    procedure setumfuncionario (pfuncionario : Funcionarios);
    function getumfuncionario : Funcionarios;
    function clone: ordemservicos;
    procedure setproblema_veiculo(pproblema_veiculo : string);
    function getproblema_veiculo : string;

  end;

implementation

{ ordemservicos }


{ ordemservicos }

function ordemservicos.clone: ordemservicos;
begin
  result := OrdemServicos.Crieobj;
  result.setnumero_os(numero_os);
  result.setdata_emissao(data_emissao);
  result.sethora_emissao(hora_emissao);
  result.setumusuario(umusuario);
  result.setstatus(status);
  result.setumcliente(umcliente);
  result.setobs(obs);
  result.settotal_produtos(total_produtos);
  result.settotal_servicos(total_servicos);
  result.setoutras_despesas(outras_despesas);
  result.setdesconto(desconto);
  result.settotal_os(total_os);
  result.setCadastro(cadastro);
  result.setumacor(umacor);
  result.setummodelo(ummodelo);
  result.setplaca_veiculo(placa_veiculo);
  result.setumproduto(umproduto);
  result.setumservico(umservico);
  result.setano_veiculo(ano_veiculo);
  result.setUlt_Alt(ult_alt);
  result.setumfuncionario(umfuncionario);
  result.setumacondicao(umacondicao);
  result.setproblema_veiculo(problema_veiculo);
  result.setumacolecaoproduto(umacolecaoproduto);
  result.setumacolecaoservico(umacolecaoservico);
  result.setumacolecaocontasreceber(umacolecaocontasreceber);
  result.setumacolecaoproduto_remove(umacolecaoproduto_remove);
  result.setumacolecaoservico_remove(umacolecaoservico_remove);
  result.setumacolecaocontasreceber_remove(umacolecaocontasreceber_remove);
end;

constructor ordemservicos.Crieobj;
begin
  umusuario := Usuarios.Crieobj;
  umcliente := Clientes.Crieobj;
  umacor := Cores.Crieobj;
  ummodelo := Modelos.Crieobj;
  umproduto := Produtos.Crieobj;
  umacolecaoproduto := ColecaoProdutos.crieObj;
  umacolecaoservico := ColecaoServicos.crieObj;
  umacolecaocontasreceber := ColecaoContasreceber.crieObj;
  self.umacolecaoproduto_remove := ColecaoProdutos.crieObj;
  self.umacolecaoservico_remove := ColecaoServicos.crieObj;
  self.umacolecaocontasreceber_remove := ColecaoContasreceber.crieObj;
  umservico := Servicos.Crieobj;
  umfuncionario := Funcionarios.Crieobj;
  umacondicao := Condicoes.crieobj;
end;

destructor ordemservicos.Destrua_se;
begin
  umusuario.Destrua_se;
  umcliente.Destrua_se;
  umacor.Destrua_se;
  ummodelo.Destrua_se;
  umproduto.Destrua_se;
  umservico.Destrua_se;
  umfuncionario.Destrua_se;
  umacondicao.destrua_se;
  self.umacolecaoproduto_remove.destrua_se;
  self.umacolecaoservico_remove.destrua_se;
  self.umacolecaocontasreceber_remove.destrua_se;
end;

function ordemservicos.getano_veiculo: string;
begin
  result := ano_veiculo;
end;

function ordemservicos.getdata_emissao: Tdate;
begin
  result := data_emissao;
end;

function ordemservicos.getdesconto: Currency;
begin
  result := desconto;
end;

function ordemservicos.gethora_emissao: Ttime;
begin
  result := hora_emissao;
end;

function ordemservicos.getnumero_os: integer;
begin
  result := numero_os;
end;

function ordemservicos.getobs: string;
begin
  result := obs;
end;

function ordemservicos.getoutras_despesas: Currency;
begin
  result := outras_despesas;
end;

function ordemservicos.getplaca_veiculo: string;
begin
  result := placa_veiculo;
end;

function ordemservicos.getproblema_veiculo: string;
begin
  result := problema_veiculo;
end;

function ordemservicos.getstatus: string;
begin
  result := status;
end;

function ordemservicos.gettotal_os: Currency;
begin
  result := total_os;
end;

function ordemservicos.gettotal_produtos: Currency;
begin
  result := total_produtos;
end;

function ordemservicos.gettotal_servicos: Currency;
begin
  result := total_servicos;
end;

function ordemservicos.getumacolecaocontasreceber: ColecaoContasReceber;
begin
  result := umacolecaocontasreceber;
end;

function ordemservicos.getumacolecaocontasreceber_remove: ColecaoContasReceber;
begin
  result := umacolecaocontasreceber_remove;
end;

function ordemservicos.getumacolecaoproduto: Colecaoprodutos;
begin
  result := umacolecaoproduto;
end;

function ordemservicos.getumacolecaoproduto_remove: Colecaoprodutos;
begin
  result := umacolecaoproduto_remove;
end;

function ordemservicos.getumacolecaoservico: ColecaoServicos;
begin
  result := umacolecaoservico;
end;

function ordemservicos.getumacolecaoservico_remove: ColecaoServicos;
begin
  result := umacolecaoservico_remove;
end;

function ordemservicos.getumacondicao: Condicoes;
begin
  result := umacondicao;
end;

function ordemservicos.getumacor: Cores;
begin
  result := umacor;
end;

function ordemservicos.getumcliente: Clientes;
begin
  result := umcliente;
end;

function ordemservicos.getumfuncionario: Funcionarios;
begin
  result:= umfuncionario;
end;

function ordemservicos.getummodelo: Modelos;
begin
  result := ummodelo;
end;

function ordemservicos.getumproduto: Produtos;
begin
  result := umproduto;
end;

function ordemservicos.getumservico: Servicos;
begin
  result := umservico;
end;

function ordemservicos.getumusuario: Usuarios;
begin
  result := umusuario;
end;

procedure ordemservicos.setano_veiculo(pano_veiculo: string);
begin
  ano_veiculo := pano_veiculo;
end;

procedure ordemservicos.setdata_emissao(pdata_emissao: Tdate);
begin
  data_emissao := pdata_emissao;
end;

procedure ordemservicos.setdesconto(pdesconto: Currency);
begin
  desconto := pdesconto;
end;

procedure ordemservicos.sethora_emissao(phora_emissao: Ttime);
begin
  hora_emissao := phora_emissao;
end;

procedure ordemservicos.setnumero_os(pnumero_os: integer);
begin
  numero_os := pnumero_os;
end;

procedure ordemservicos.setobs(pobs: string);
begin
  obs := pobs;
end;

procedure ordemservicos.setoutras_despesas(poutras_despesas: Currency);
begin
  outras_despesas := poutras_despesas;
end;

procedure ordemservicos.setplaca_veiculo(pplaca_veiculo: string);
begin
  placa_veiculo := pplaca_veiculo;
end;

procedure ordemservicos.setproblema_veiculo(pproblema_veiculo: string);
begin
  problema_veiculo := pproblema_veiculo;
end;

procedure ordemservicos.setstatus(pstatus: string);
begin
  status := pstatus;
end;

procedure ordemservicos.settotal_os(ptotal_os: Currency);
begin
  total_os := ptotal_os;
end;

procedure ordemservicos.settotal_produtos(ptotal_produtos: Currency);
begin
  total_produtos := ptotal_produtos;
end;

procedure ordemservicos.settotal_servicos(ptotal_servicos: Currency);
begin
  total_servicos := ptotal_servicos;
end;

procedure ordemservicos.setumacolecaocontasreceber(
  pcolecaocontasreceber: ColecaoContasReceber);
begin
  umacolecaocontasreceber := pcolecaocontasreceber;
end;

procedure ordemservicos.setumacolecaocontasreceber_remove(
  pcolecaocontasreceber_remove: ColecaoContasReceber);
begin
  umacolecaocontasreceber_remove := pcolecaocontasreceber_remove;
end;

procedure ordemservicos.setumacolecaoproduto(pcolecaoproduto: Colecaoprodutos);
begin
  umacolecaoproduto := pcolecaoproduto;
end;

procedure ordemservicos.setumacolecaoproduto_remove(
  pcolecaoproduto_remove: Colecaoprodutos);
begin
  umacolecaoproduto_remove := pcolecaoproduto_remove;
end;

procedure ordemservicos.setumacolecaoservico(pcolecaoservico: Colecaoservicos);
begin
  umacolecaoservico := pcolecaoservico;
end;

procedure ordemservicos.setumacolecaoservico_remove(
  pcolecaoservico_remove: Colecaoservicos);
begin
  umacolecaoservico_remove := pcolecaoservico_remove;
end;

procedure ordemservicos.setumacondicao(pcondicao: Condicoes);
begin
  umacondicao := pcondicao;
end;

procedure ordemservicos.setumacor(pcor: Cores);
begin
  umacor := pcor;
end;

procedure ordemservicos.setumcliente(pcliente: Clientes);
begin
  umcliente := pcliente;
end;

procedure ordemservicos.setumfuncionario(pfuncionario: Funcionarios);
begin
  umfuncionario := pfuncionario;
end;

procedure ordemservicos.setummodelo(pmodelo: Modelos);
begin
  ummodelo := pmodelo;
end;

procedure ordemservicos.setumproduto(pproduto: Produtos);
begin
  umproduto := pproduto;
end;

procedure ordemservicos.setumservico(pservico: Servicos);
begin
  umservico := pservico;
end;

procedure ordemservicos.setumusuario(pusuario: Usuarios);
begin
  umusuario := pusuario;
end;

end.
