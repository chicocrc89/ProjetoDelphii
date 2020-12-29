unit uFormaPagamentos;

interface

uses uGenerica;

type
  FormaPagamentos = class(Generica)

  private

  protected
    pagamento: string;

  public
    Constructor Crieobj;
    destructor Destrua_se;
    procedure setpagamento(ppagamento: string);
    function getpagamento: string;
    function clone: FormaPagamentos;
  end;

implementation



{ FormaPagamentos }

function FormaPagamentos.clone: FormaPagamentos;
begin
  result := Formapagamentos.Crieobj;
  result.setCodigo(codigo);
  result.setpagamento(pagamento);
  result.setCadastro(Cadastro);
  result.setUlt_Alt(Ult_Alt);
end;

constructor FormaPagamentos.Crieobj;
begin

end;

destructor FormaPagamentos.Destrua_se;
begin

end;

function FormaPagamentos.getpagamento: string;
begin
  result := pagamento;
end;

procedure FormaPagamentos.setpagamento(ppagamento: string);
begin
  pagamento := ppagamento;
end;

end.
