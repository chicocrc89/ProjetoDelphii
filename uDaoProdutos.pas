unit uDaoprodutos;

interface

uses udao, uprodutos, uDM, DB, uDaoFabricantes, uDaoFornecedores,uDaoGrupos, SysUtils;

type
  Daoprodutos = class(dao)
  private

  protected
    umdm: TDM;
    umadaofabricante  : DaoFabricantes;
    umadaofornecedor  : DaoFornecedores;
    umadaogrupo       : DaoGrupos;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
    procedure setdaofabricante(pObj: TObject);
    procedure setdaofornecedor (pObj : TObject);
    procedure setdaogrupo (pObj : TObject);
  end;

implementation

{ Daoprodutos }

function Daoprodutos.Carregar(pObj: TObject): string;
var
  mprodutos: produtos;
begin
  mprodutos := produtos(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetproduto.Active then
    umdm.dsetproduto.Open;
  mprodutos.setCodigo(umdm.dsetprodutoID_PRODUTO.Value);
  mprodutos.setdescricao(umdm.dsetprodutoPRODUTO.Value);
  mprodutos.setbarras(umdm.dsetprodutoCOD_BARRAS.Value);
  mprodutos.getumfabricante.setcodigo(umdm.dsetprodutoID_FABRICANTE.Value);
  mprodutos.getumfornecedor.setCodigo(umdm.dsetprodutoID_FORNECEDOR.Value);
  mprodutos.getumgrupo.setCodigo(umdm.dsetprodutoID_GRUPO.Value);
  mprodutos.setcusto(umdm.dsetprodutoCUSTO_PRODUTO.Value);
  mprodutos.setund(umdm.dsetprodutoUND.Value);
  mprodutos.setstatus(umdm.dsetprodutoSTATUS.Value);
  mprodutos.setpreco_compra(umdm.dsetprodutoPRECO_COMPRA.Value);
  mprodutos.setpreco_venda(umdm.dsetprodutoPRECO_VENDA.Value);
  mprodutos.setmargem(umdm.dsetprodutoMARGEM.Value);
  mprodutos.settp_produto(umdm.dsetprodutoTIPO_PRODUTO.Value);
  mprodutos.setestoque(umdm.dsetprodutoESTOQUE.Value);
  mprodutos.setobs(umdm.dsetprodutoOBS_PRODUTO.Value);
  mprodutos.setCadastro(umdm.dsetprodutoDATA_CADASTRO.Value);
  mprodutos.setUlt_Alt(umdm.dsetprodutoULTIMA_ALTERACAO.Value);
end;

constructor Daoprodutos.CrieObj;
begin
  umadaofabricante := DaoFabricantes.CrieObj;
  umadaofornecedor := DaoFornecedores.CrieObj;
  umadaogrupo := DaoGrupos.CrieObj;
end;

destructor Daoprodutos.Destrua_se;
begin
  umadaofabricante.Destrua_se;
  umadaofornecedor.Destrua_se;
  umadaogrupo.Destrua_se;
end;

function Daoprodutos.Excluir(pObj: TObject): string;
begin
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetproduto.Active then
    umdm.dsetproduto.Open;
  umdm.dsetproduto.Delete;
  umdm.trans.Commit;
end;

function Daoprodutos.getds: Tdatasource;
begin
  result := umdm.dsproduto;
end;

function Daoprodutos.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from produto'
  else if ehnumero(pChave) then
    mSQL := 'select * from produto where id_produto =' + QuotedStr(pChave)
  else
    mSQL := 'select * from produto where produto =' + QuotedStr(pChave);
  umdm.dsetproduto.Active := false;
  umdm.dsetproduto.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetproduto.Active then
    umdm.dsetproduto.Open;
  result := '';
end;

function Daoprodutos.Salvar(pObj: TObject): string;
var
  mprodutos: produtos;
  mdata : Tdate;
begin
  mprodutos := produtos(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetproduto.Active then
    umdm.dsetproduto.Open;
  if mprodutos.getcodigo = 0 then
    umdm.dsetproduto.Insert
  else
  begin
    mdata := now;
    umdm.dsetproduto.Edit;
  end;
  umdm.dsetprodutoID_PRODUTO.Value := mprodutos.getCodigo;
  umdm.dsetprodutoPRODUTO.Value := mprodutos.getdescricao;
  umdm.dsetprodutoCOD_BARRAS.Value := mprodutos.getbarras;
  umdm.dsetprodutoID_FABRICANTE.Value := mprodutos.getumfabricante.getcodigo;
  umdm.dsetprodutoID_FORNECEDOR.Value := mprodutos.getumfornecedor.getCodigo;
  umdm.dsetprodutoID_GRUPO.Value := mprodutos.getumgrupo.getCodigo;
  umdm.dsetprodutoCUSTO_PRODUTO.Value := mprodutos.getcusto;
  umdm.dsetprodutoSTATUS.Value := mprodutos.getstatus;
  umdm.dsetprodutoUND.Value := mprodutos.getund;
  umdm.dsetprodutoPRECO_COMPRA.Value := mprodutos.getpreco_compra;
  umdm.dsetprodutoPRECO_VENDA.Value := mprodutos.getpreco_venda;
  umdm.dsetprodutoMARGEM.Value := mprodutos.getmargem;
  umdm.dsetprodutoTIPO_PRODUTO.Value := mprodutos.gettp_produto;
  umdm.dsetprodutoESTOQUE.Value := mprodutos.getestoque;
  umdm.dsetprodutoOBS_PRODUTO.Value := mprodutos.getobs;
  umdm.dsetprodutoDATA_CADASTRO.Value := mprodutos.getCadastro;
  umdm.dsetprodutoULTIMA_ALTERACAO.Value := mprodutos.getUlt_Alt;
  umdm.dsetproduto.Post;
  umdm.trans.Commit;
end;

procedure Daoprodutos.setdaofabricante(pObj: TObject);
begin
  umadaofabricante := DaoFabricantes(pObj);
end;

procedure Daoprodutos.setdaofornecedor(pObj: TObject);
begin
  umadaofornecedor := DaoFornecedores(pObj);
end;

procedure Daoprodutos.setdaogrupo(pObj: TObject);
begin
  umadaogrupo := DaoGrupos(pObj);
end;

procedure Daoprodutos.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

end.
