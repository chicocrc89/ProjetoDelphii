unit uDaoCompras;

interface

uses udao, ucompras, uDM, DB, uDaoCondicoes, uDaoFornecedores,uDaoProdutos, SysUtils, uDaoFormaPagamentos,
uContasPagar, uColecaocontaspagar, uItem, uColecaoProdutos;

type
  Daocompras = class(dao)
  private

  protected
    umdm: TDM;
    umadaocondicao  : DaoCondicoes;
    umadaofornecedor  : DaoFornecedores;
    umadaoproduto       : DaoProdutos;
    umadaoformapagamento : DaoFormaPagamentos;
    umacontapagar : ContasPagar;
    umItem : Item;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
    procedure setdaocondicao(pObj: TObject);
    procedure setdaofornecedor (pObj : TObject);
    procedure setdaoproduto (pObj : TObject);
    procedure setdaoformapagamento (pObj : TObject);
    function validanotapk(pObj : TObject) : boolean;
    procedure atualizaestoque(pObj: TObject);
  end;

implementation

{ Daocompras }

procedure Daocompras.atualizaestoque(pObj: TObject);
var mitem : Item;
  I, k, tamanho, qtd_produto : integer;
  mid_produto, mestoque_produto : STRING;
  mcolecao_produto : ColecaoProdutos;
  mcompras: compras;
  mestoque_posterior : integer;
  mestoque_anterior : array[1..100] of integer;
begin
  mcompras := compras(pObj);
  qtd_produto := mcompras.getumacolecaoproduto.getQtd;
  tamanho := mcompras.getumacolecaoproduto.getQtd;
  for k:= 1 to tamanho do
  begin
    mcolecao_produto := ColecaoProdutos (mcompras.getumacolecaoproduto);
    mitem := Item (mcolecao_produto.Carrega(k));
    mid_produto := inttostr(mitem.getumproduto.getCodigo);
    mestoque_produto := inttostr(mitem.getQtd);
    umdm.dsetproduto.Active := false;
    umdm.trans.Active := false;
    umdm.dsetproduto.SelectSQL.Text := 'select * from produto WHERE id_produto =' + QuotedStr(mid_produto);
    if not umdm.dsetproduto.Active then
      umdm.dsetproduto.Open;
    mestoque_anterior[k] := umdm.dsetprodutoESTOQUE.Value;
  end;

  for I:= 1 to qtd_produto do
  begin
    mcolecao_produto := ColecaoProdutos (mcompras.getumacolecaoproduto);
    mitem := Item (mcolecao_produto.Carrega(I));
    mid_produto := inttostr(mitem.getumproduto.getCodigo);
    mestoque_produto := inttostr(mitem.getQtd);
    mestoque_posterior := mestoque_anterior[i] + strtoint(mestoque_produto);
    mestoque_produto := inttostr(mestoque_posterior);
    umdm.dsetproduto.SelectSQL.Text := 'update produto SET estoque =' + QuotedStr(mestoque_produto) + 'WHERE id_produto =' + QuotedStr(mid_produto);
    if not umdm.dsetproduto.Active then
      umdm.dsetproduto.Open;
    if not umdm.trans.Active then
      umdm.trans.Active := true;
    umdm.trans.Commit;
  end;

end;

function Daocompras.Carregar(pObj: TObject): string;
var
  mnumero_nota, mcod_fornecedor,mserie, mmodelo : string;
  mcompras: compras;
begin
  mcompras := compras(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcompra.Active then
    umdm.dsetcompra.Open;
  mcompras.setNumero_nota(umdm.dsetcompraNUMERO_NOTA.Value);
  mcompras.setSerie(umdm.dsetcompraSERIE.Value);
  mcompras.setModelo(umdm.dsetcompraMODELO.Value);
  mcompras.getumaCondicao.setCodigo(umdm.dsetcompraID_CONDICAO.Value);
  mcompras.getumfornecedor.setCodigo(umdm.dsetcompraID_FORNECEDOR.Value);
  mcompras.setStatus(umdm.dsetcompraSTATUS.Value);
  mcompras.setData_entrada(umdm.dsetcompraDATA_ENTRADA.Value);
  mcompras.setData_emissao(umdm.dsetcompraDATA_EMISSAO.Value);
  mcompras.setTotaldesconto(umdm.dsetcompraTOTAL_DESCONTO.Value);
  mcompras.setValor_frete(umdm.dsetcompraVALOR_FRETE.Value);
  mcompras.setseguro(umdm.dsetcompraSEGURO.Value);
  mcompras.setdatacancelamento(umdm.dsetcompraDATA_CANCELAMENTO.Value);
  mcompras.setTotalcompra(umdm.dsetcompraTOTAL_COMPRA.Value);
  mcompras.setTotalprodutos(umdm.dsetcompraTOTAL_PRODUTOS.Value);
  mcompras.setValoroutrasdespesas(umdm.dsetcompraOUTRAS_DESPESAS.Value);
  mnumero_nota := inttostr(mcompras.getNumero_nota);
  mserie := mcompras.getSerie;
  mmodelo := mcompras.getModelo;
  mcod_fornecedor := inttostr(mcompras.GetumFornecedor.getCodigo);
  //---------------------------------------------------------------------------------------------------------
  //AQUI EU RETORNO TODOS OS CONTAS A PAGAR PARA CARREGAR NO FORMULARIO
  //---------------------------------------------------------------------------------------------------------
  umdm.dsetcontaspagar.SelectSQL.Text := 'select * from contas_pagar where numero_nota =' + QuotedStr(mnumero_nota) + 'AND SERIE=' + QuotedStr(mserie) + 'AND MODELO=' + QuotedStr(mmodelo) + 'AND ID_FORNECEDOR=' + QuotedStr(mcod_fornecedor);
  umdm.dsetcontaspagar.Open;

  mcompras.getumacolecaocontaspagar.setQtd(0);
  while not umdm.dsetcontaspagar.Eof do
  begin
    umacontapagar := ContasPagar.Crieobj;
    umacontapagar.setnumero_parcela(umdm.dsetcontaspagarNUMERO_PARCELA.Value);
    umacontapagar.getumaformapagamento.setCodigo(umdm.dsetcontaspagarID_FORMAPAGAMENTO.Value);
    umacontapagar.setdata_vencimento(umdm.dsetcontaspagarDATA_VENCIMENTO.Value);
    umacontapagar.setvalor_parcela(umdm.dsetcontaspagarVALOR_PARCELA.Value);
    mcompras.getumacolecaocontaspagar.insereFim(umacontapagar);
    umdm.dsetcontaspagar.Next;
  end;
  //------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------------------
  //AQUI EU RETORNO TODOS OS PRODUTOS DA COMPRA PARA CARREGAR NO FORMULARIO
  //---------------------------------------------------------------------------------------------------------
  umdm.dsetitem_compra.SelectSQL.Text := 'select * from item_compra where numero_nota =' + QuotedStr(mnumero_nota) + 'AND SERIE=' + QuotedStr(mserie) + 'AND MODELO=' + QuotedStr(mmodelo) + 'AND ID_FORNECEDOR=' + QuotedStr(mcod_fornecedor);
  umdm.dsetitem_compra.Open;
  mcompras.getumacolecaoproduto.setQtd(0);
  while not umdm.dsetitem_compra.Eof do
  begin
    umitem := Item.Crieobj;
    umitem.getumproduto.setCodigo(umdm.dsetitem_compraID_PRODUTO.Value);
    umitem.SetQtd(umdm.dsetitem_compraQTD.Value);
    umitem.getumproduto.setpreco_compra(umdm.dsetitem_compraVALOR_UNITARIO.Value);
    umitem.setvalor_total(umdm.dsetitem_compraVALOR_TOTAL.Value);
    mcompras.getumacolecaoproduto.insereFim(umitem);
    umdm.dsetitem_compra.Next;
  end;
  //-------------------------------------------------------------------------------------------------------------------
  end;

constructor Daocompras.CrieObj;
begin
  umadaocondicao := DaoCondicoes.CrieObj;
  umadaofornecedor := DaoFornecedores.CrieObj;
  umadaoproduto := DaoProdutos.CrieObj;
  umadaoformapagamento := DaoFormaPagamentos.CrieObj;
end;

destructor Daocompras.Destrua_se;
begin
  umadaocondicao.Destrua_se;
  umadaofornecedor.Destrua_se;
  umadaoproduto.Destrua_se;
end;

function Daocompras.Excluir(pObj: TObject): string;
begin
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcompra.Active then
    umdm.dsetcompra.Open;
  umdm.dsetcompra.Delete;
  umdm.trans.Commit;
end;

function Daocompras.getds: Tdatasource;
begin
  result := umdm.dscompra;
end;

function Daocompras.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from compra'
  else if ehnumero(pChave) then
    mSQL := 'select * from compra where numero_nota =' + QuotedStr(pChave)
  else
    mSQL := 'select * from compra where numero_nota =' + QuotedStr(pChave);
  umdm.dsetcompra.Active := false;
  umdm.dsetcompra.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcompra.Active then
    umdm.dsetcompra.Open;
    result := '';
end;

function Daocompras.Salvar(pObj: TObject): string;
var
  mcompras: compras;
  mdata : Tdate;
  mContapagar: ContasPagar;
  mitem : Item;
  I, tamanho, qtd_produto: integer;
  mcolecao : ColecaoContasPagar;
  mcolecao_produto : ColecaoProdutos;
begin
  mcompras := compras(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcompra.Active then
    umdm.dsetcompra.Open;
    umdm.dsetcompra.Insert;
  umdm.dsetcompraNUMERO_NOTA.Value := mcompras.getNumero_nota;
  umdm.dsetcompraSERIE.Value := mcompras.getSerie;
  umdm.dsetcompraMODELO.Value := mcompras.getModelo;
  umdm.dsetcompraID_CONDICAO.Value := mcompras.getumacondicao.getcodigo;
  umdm.dsetcompraID_FORNECEDOR.Value := mcompras.getumfornecedor.getCodigo;
  umdm.dsetcompraSTATUS.Value := mcompras.getStatus;
  umdm.dsetcompraDATA_ENTRADA.Value := mcompras.getData_entrada;
  umdm.dsetcompraDATA_EMISSAO.Value := mcompras.getData_emissao;
  umdm.dsetcompraTOTAL_DESCONTO.Value := mcompras.getTotaldesconto;
  umdm.dsetcompraVALOR_FRETE.Value := mcompras.getValor_frete;
  umdm.dsetcompraseguro.Value := mcompras.getseguro;
  umdm.dsetcompraDATA_CANCELAMENTO.Value := mcompras.getDatacancelamento;
  umdm.dsetcompraTOTAL_COMPRA.Value := mcompras.getTotalcompra;
  umdm.dsetcompraTOTAL_PRODUTOS.Value := mcompras.getTotalprodutos;
  umdm.dsetcompraOUTRAS_DESPESAS.Value := mcompras.getValoroutrasdespesas;
  umdm.dsetcompra.Post;
  //------------------------------------------------------------------------------------------
  //AQUI FAZ INSER��O  DO CONTAS A PAGAR NO BANCO
  //------------------------------------------------------------------------------------------
  tamanho := mcompras.getumacolecaocontaspagar.getQtd;
  for I:= 1 to tamanho do
  begin
    mcolecao := ColecaoContasPagar (mcompras.getumacolecaocontaspagar);
    mcontapagar := ContasPagar (mcolecao.Carrega(I));
    if not umdm.dsetcontaspagar.active then
      umdm.dsetcontaspagar.Open;
    umdm.dsetcontaspagar.Insert;
    umdm.dsetcontaspagarNUMERO_NOTA.Value       := mcompras.getNumero_nota;
    umdm.dsetcontaspagarSERIE.Value             := mcompras.getSerie;
    umdm.dsetcontaspagarMODELO.Value            := mcompras.getModelo;
    umdm.dsetcontaspagarID_FORNECEDOR.Value     := mcompras.GetumFornecedor.getCodigo;
    umdm.dsetcontaspagarDATA_EMISSAO.Value      := mcompras.getData_emissao;
    umdm.dsetcontaspagarNUMERO_PARCELA.Value    := mcontapagar.getnumero_parcela;
    umdm.dsetcontaspagarVALOR_PARCELA.Value     := mcontapagar.getvalor_parcela;
    umdm.dsetcontaspagarDATA_VENCIMENTO.Value   := mcontapagar.getdata_vencimento;
    umdm.dsetcontaspagarDATA_PAGAMENTO.Value    := mcontapagar.getdata_pagamento;
    umdm.dsetcontaspagarJUROS.Value             := mcontapagar.getjuros;
    umdm.dsetcontaspagarMULTA.Value             := mcontapagar.getmulta;
    umdm.dsetcontaspagarVALOR_PAGO.Value        := mcontapagar.getvalor_pago;
    umdm.dsetcontaspagarID_FORMAPAGAMENTO.Value := mcontapagar.getumaformapagamento.getCodigo;
    umdm.dsetcontaspagarDESCONTO.Value          := mcontapagar.getdesconto;
    umdm.dsetcontaspagar.Post;
  end;
  //------------------------------------------------------------------------------------------
  //AQUI FAZ INSER��O  DO ITENS COMPRA NO BANCO
  //------------------------------------------------------------------------------------------
  qtd_produto := mcompras.getumacolecaoproduto.getQtd;
  for I:= 1 to qtd_produto do
  begin
    mcolecao_produto := ColecaoProdutos (mcompras.getumacolecaoproduto);
    mitem := Item (mcolecao_produto.Carrega(I));
    if not umdm.dsetitem_compra.active then
      umdm.dsetitem_compra.Open;
    umdm.dsetitem_compra.Insert;
    umdm.dsetitem_compraNUMERO_NOTA.Value       := mcompras.getNumero_nota;
    umdm.dsetitem_compraSERIE.Value             := mcompras.getSerie;
    umdm.dsetitem_compraMODELO.Value            := mcompras.getModelo;
    umdm.dsetitem_compraID_FORNECEDOR.Value     := mcompras.GetumFornecedor.getCodigo;
    umdm.dsetitem_compraID_PRODUTO.Value        := mitem.getumproduto.getCodigo;
    umdm.dsetitem_compraQTD.Value               := mitem.getQtd;
    umdm.dsetitem_compraVALOR_UNITARIO.Value          := mitem.getumproduto.getpreco_compra;
    umdm.dsetitem_compraVALOR_TOTAL.Value             := mitem.getvalor_total;
    umdm.dsetitem_compra.Post;
  end;
  umdm.trans.Commit;
  atualizaestoque(pObj);
end;

procedure Daocompras.setdaocondicao(pObj: TObject);
begin
  umadaocondicao := DaoCondicoes(pObj);
end;

procedure Daocompras.setdaoformapagamento(pObj: TObject);
begin
  umadaoformapagamento := DaoFormaPagamentos(pObj);
end;

procedure Daocompras.setdaofornecedor(pObj: TObject);
begin
  umadaofornecedor := DaoFornecedores(pObj);
end;

procedure Daocompras.setdaoproduto(pObj: TObject);
begin
  umadaoproduto := DaoProdutos(pObj);
end;

procedure Daocompras.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

function Daocompras.validanotapk(pObj: TObject): boolean;
var
  mnumero_nota, mcod_fornecedor,mserie, mmodelo : string;
  mcompras: compras;
  mSQL: string;
begin
  mcompras := compras(pObj);
  mnumero_nota := inttostr(mcompras.getNumero_nota);
  mserie := mcompras.getSerie;
  mmodelo := mcompras.getModelo;
  mcod_fornecedor := inttostr(mcompras.GetumFornecedor.getCodigo);
  mSQL := 'select * from compra where numero_nota =' + QuotedStr(mnumero_nota) + 'AND SERIE=' + QuotedStr(mserie) + 'AND MODELO=' + QuotedStr(mmodelo) + 'AND ID_FORNECEDOR=' + QuotedStr(mcod_fornecedor);
  umdm.dsetcompra.Active := false;
  umdm.dsetcompra.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcompra.Active then
    umdm.dsetcompra.Open;
  if umdm.dsetcompra.RecordCount = 0  then
    result := true
  else
    result := false;
end;

end.
