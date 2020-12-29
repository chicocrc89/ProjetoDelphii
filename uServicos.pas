unit uServicos;

interface

uses uGenerica;

type
  servicos = class(Generica)
  private

  protected
    descricao: string;
    custo : Currency;
    preco_venda: Currency;
    obs : string;
  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure setdescricao(pdescricao: string);
    procedure setcusto(pcusto : Currency);
    procedure setpreco_venda(ppreco_venda: Currency);
    procedure setobs(pobs : string);
    function getdescricao: string;
    function getcusto : Currency;
    function getpreco_venda: Currency;
    function getobs : string;
    function clone: servicos;

  end;

implementation

{ Produto }

function servicos.clone: servicos;
begin
  result := servicos.Crieobj;
  result.setCodigo(codigo);
  result.setdescricao(descricao);
  result.setcusto(custo);
  result.setobs(obs);
  result.setpreco_venda(preco_venda);
  result.setCadastro(Cadastro);
  result.setUlt_Alt(Ult_Alt);
end;

constructor servicos.Crieobj;
begin

end;

destructor servicos.Destrua_se;
begin

end;

function servicos.getcusto: Currency;
begin
  result := custo;
end;

function servicos.getdescricao: string;
begin
  result := descricao;
end;

function servicos.getobs: string;
begin
  result := obs;
end;

function servicos.getpreco_venda: Currency;
begin
  result := preco_venda;
end;

procedure servicos.setcusto(pcusto: Currency);
begin
  custo := pcusto;
end;

procedure servicos.setdescricao(pdescricao: string);
begin
  descricao := pdescricao;
end;

procedure servicos.setobs(pobs: string);
begin
  obs := pobs;
end;

procedure servicos.setpreco_venda(ppreco_venda: Currency);
begin
  preco_venda := ppreco_venda;
end;


end.
