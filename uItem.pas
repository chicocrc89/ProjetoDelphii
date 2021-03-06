unit uItem;

interface
  uses uProdutos, uFuncionarios;

  type Item = Class(produtos)

  private

  protected
    qtd:Integer;
    valor_total: Currency;
    desconto: real;
    custoTotal: Currency;
    umproduto : Produtos;
    umfuncionario : Funcionarios;
    valor_desconto : Currency;
    valor_liquido : Currency;
  public
    constructor Crieobj;
    destructor Destrua_se;
    procedure SetQtd(pQtd: Integer);
    function  getQtd :Integer;
    procedure setvalor_total(pvalor_total : Currency);
    function getvalor_total : Currency;
    procedure setDesconto(pDesconto:Currency);
    function  getDesconto: Currency;
    procedure setCustoTotal (pcustototal:Currency);
    function getCustoTotal: Currency;
    procedure setumproduto(pproduto : Produtos);
    function getumproduto : Produtos;
    procedure setumfuncionario(pfuncionario : Funcionarios);
    function getumfuncionario : Funcionarios;
    procedure setvalor_desconto(pvalor_desconto : Currency);
    function getvalor_desconto : Currency;
    procedure setvalor_liquido(pvalor_liquido : Currency);
    function getvalor_liquido : Currency;
    function clone : Item;
End;

implementation

{ Itens }

{ Item }

function Item.clone: Item;
begin
  result := Item.Crieobj;
  result.SetQtd(Qtd);
  result.setvalor_total(valor_total);
  result.setDesconto(desconto);
  result.setCustoTotal(custototal);
  result.setumproduto(umproduto);
  result.setumfuncionario(umfuncionario);
  result.setvalor_desconto(valor_desconto);
  result.setvalor_liquido(valor_liquido);
end;

constructor Item.Crieobj;
begin
  umproduto := Produtos.Crieobj;
  umfuncionario := Funcionarios.Crieobj;
end;

destructor Item.Destrua_se;
begin
  umproduto.Destrua_se;
  umfuncionario.Destrua_se;
end;

function Item.getCustoTotal: Currency;
begin
  result := CustoTotal;
end;

function Item.getDesconto: Currency;
begin
  result := desconto;
end;

function Item.getQtd: Integer;
begin
  result := qtd;
end;

function Item.getumfuncionario: Funcionarios;
begin
  result := umfuncionario;
end;

function Item.getumproduto: Produtos;
begin
  result := umproduto;
end;

function Item.getvalor_desconto: Currency;
begin
  result := valor_desconto;
end;

function Item.getvalor_liquido: Currency;
begin
  result := valor_liquido;
end;

function Item.getvalor_total: Currency;
begin
  result := valor_total;
end;

procedure Item.setCustoTotal(pcustototal: Currency);
begin
  custototal := pcustototal;
end;

procedure Item.setDesconto(pDesconto: Currency);
begin
  desconto := pdesconto;
end;

procedure Item.SetQtd(pQtd: Integer);
begin
  qtd := pqtd;
end;

procedure Item.setumfuncionario(pfuncionario: Funcionarios);
begin
  umfuncionario := pfuncionario;
end;

procedure Item.setumproduto(pproduto: Produtos);
begin
  umproduto := pproduto;
end;

procedure Item.setvalor_desconto(pvalor_desconto: Currency);
begin
  valor_desconto := pvalor_desconto;
end;

procedure Item.setvalor_liquido(pvalor_liquido: Currency);
begin
  valor_liquido := pvalor_liquido;
end;

procedure Item.setvalor_total(pvalor_total: Currency);
begin
  valor_total := pvalor_total;
end;

end.
