unit uDaoOrdemServicos;

interface

uses udao, uordemservicos, uDM, DB, uDaoClientes, uDaoUsuarios, uDaocores, uDaoModelos, SysUtils, uDaoFuncionarios, uDaoCondicoes, uContasReceber, uColecaocontasreceber, uItem, uColecaoProdutos, uColecaoServicos, uProdutos, uServicos;

type
  Daoordemservicos = class(dao)
  private

  protected
    umdm: TDM;
    umadaocliente: DaoClientes;
    umadaousuario : DaoUsuarios;
    umadaocor : DaoCores;
    umadaomodelo : DaoModelos;
    umadaocondicao : DaoCondicoes;
    umadaofuncionario : DaoFuncionarios;
    umacontareceber : ContasReceber;
    umitem : Item;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
    procedure setdaocliente(pObj: TObject);
    procedure setdaousuario (pObj : TObject);
    procedure setdaocor (pObj : TObject);
    procedure setdaomodelo (pObj : TObject);
    procedure setdaocondicao (pObj : TObject);
    procedure setdaofuncionario (pObj : TObject);
  end;

implementation

{ Daoordemservicos }

function Daoordemservicos.Carregar(pObj: TObject): string;
var
  mnumero_os : string;
  mcod_cliente : string;
  mordemservicos: ordemservicos;
begin
  mordemservicos := ordemservicos(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetordemservico.Active then
    umdm.dsetordemservico.Open;
  mordemservicos.setnumero_os(umdm.dsetordemservicoID_OS.Value);
  mordemservicos.setdata_emissao(umdm.dsetordemservicoDATA_EMISSAO.Value);
  mordemservicos.sethora_emissao(umdm.dsetordemservicoHORA.Value);
  mordemservicos.getumusuario.setCodigo(umdm.dsetordemservicoID_USUARIO.Value);
  mordemservicos.setstatus(umdm.dsetordemservicoSTATUS.Value);
  mordemservicos.getumcliente.setCodigo(umdm.dsetordemservicoID_CLIENTE.Value);
  mordemservicos.getumacor.setcodigo(umdm.dsetordemservicoID_COR.Value);
  mordemservicos.getummodelo.setcodigo(umdm.dsetordemservicoID_MODELO.Value);
  mordemservicos.setobs(umdm.dsetordemservicoOBS.Value);
  mordemservicos.settotal_produtos(umdm.dsetordemservicoTOTAL_PRODUTOS.Value);
  mordemservicos.settotal_servicos(umdm.dsetordemservicoTOTAL_SERVICOS.Value);
  mordemservicos.setoutras_despesas(umdm.dsetordemservicoOUTRAS_DESPESAS.Value);
  mordemservicos.setdesconto(umdm.dsetordemservicoDESCONTO.Value);
  mordemservicos.settotal_os(umdm.dsetordemservicoTOTAL_OS.Value);
  mordemservicos.setplaca_veiculo(umdm.dsetordemservicoPLACA_VEICULO.Value);
  mordemservicos.setano_veiculo(umdm.dsetordemservicoANO_VEICULO.Value);
  mordemservicos.getumacondicao.setCodigo(umdm.dsetordemservicoID_CONDICAO.Value);
  mordemservicos.setproblema_veiculo(umdm.dsetordemservicoPROBLEMA_VEICULO.Value);
  mordemservicos.setCadastro(umdm.dsetordemservicoDATA_CADASTRO.Value);
  mordemservicos.setUlt_Alt(umdm.dsetordemservicoULTIMA_ALTERACAO.Value);
  mnumero_os := inttostr(mordemservicos.getnumero_os);
  mcod_cliente := inttostr(mordemservicos.getumcliente.getcodigo);
  //---------------------------------------------------------------------------------------------------------
  //AQUI EU RETORNO TODOS OS CONTAS A RECEBER PARA CARREGAR NO FORMULARIO
  //---------------------------------------------------------------------------------------------------------
  umdm.dsetContasReceber_ordemservico.SelectSQL.Text := 'select * from contas_receber_ordemservico where numero_os =' + QuotedStr(mnumero_os) + 'AND ID_CLIENTE=' + QuotedStr(mcod_cliente);
  umdm.dsetContasReceber_ordemservico.Open;

  mordemservicos.getumacolecaoContasReceber.setQtd(0);
  while not umdm.dsetContasReceber_ordemservico.Eof do
  begin
    umacontareceber := ContasReceber.Crieobj;
    umacontareceber.setnumero_parcela(umdm.dsetContasReceber_ordemservicoNUMERO_PARCELA.Value);
    umacontareceber.getumaformapagamento.setCodigo(umdm.dsetContasReceber_ordemservicoID_FORMAPAGAMENTO.Value);
    umacontareceber.setdata_vencimento(umdm.dsetContasReceber_ordemservicoDATA_VENCIMENTO.Value);
    umacontareceber.setvalor_parcela(umdm.dsetContasReceber_ordemservicoVALOR_PARCELA.Value);
    mordemservicos.getumacolecaoContasReceber.insereFim(umacontareceber);
    mordemservicos.getumacolecaocontasreceber_remove.insereFim(umacontareceber);
    umdm.dsetContasReceber_ordemservico.Next;
  end;
  //------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------------------
  //AQUI EU RETORNO TODOS OS PRODUTOS DA ORDEM DE SERVI�O PARA CARREGAR NO FORMULARIO
  //---------------------------------------------------------------------------------------------------------
  umdm.dsetproduto_ordemservico.SelectSQL.Text := 'select * from produto_ordemservico where numero_os =' + QuotedStr(mnumero_os) + 'AND ID_CLIENTE=' + QuotedStr(mcod_cliente);
  umdm.dsetproduto_ordemservico.Open;
  mordemservicos.getumacolecaoproduto.setQtd(0);
  while not umdm.dsetproduto_ordemservico.Eof do
  begin
    umitem := Item.Crieobj;
    umitem.getumproduto.setCodigo(umdm.dsetproduto_ordemservicoID_PRODUTO.Value);
    umitem.SetQtd(umdm.dsetproduto_ordemservicoQTD.Value);
    umitem.getumproduto.setpreco_venda(umdm.dsetproduto_ordemservicoVALOR_UNITARIO.Value);
    umitem.setvalor_total(umdm.dsetproduto_ordemservicoVALOR_TOTAL.Value);
    umitem.setvalor_desconto(umdm.dsetproduto_ordemservicoVALOR_DESCONTO.Value);
    umitem.setDesconto(umdm.dsetproduto_ordemservicoPERC_DESCONTO.Value);
    umitem.setvalor_liquido(umitem.getumproduto.getpreco_venda - (umitem.getumproduto.getpreco_venda * umitem.getDesconto / 100));
    mordemservicos.getumacolecaoproduto.insereFim(umitem);
    mordemservicos.getumacolecaoproduto_remove.insereFim(umitem);
    umdm.dsetproduto_ordemservico.Next;
  end;
  //-------------------------------------------------------------------------------------------------------------------
  //AQUI EU RETORNO TODOS OS SERVI�OS DA ORDEM DE SERVI�O PARA CARREGAR NO FORMULARIO
  //---------------------------------------------------------------------------------------------------------
  umdm.dsetservico_ordemservico.SelectSQL.Text := 'select * from servico_ordemservico where numero_os =' + QuotedStr(mnumero_os) + 'AND ID_CLIENTE=' + QuotedStr(mcod_cliente);
  umdm.dsetservico_ordemservico.Open;
  mordemservicos.getumacolecaoservico.setQtd(0);
  while not umdm.dsetservico_ordemservico.Eof do
  begin
    umitem := Item.Crieobj;
    umitem.getumproduto.setCodigo(umdm.dsetservico_ordemservicoID_SERVICO.Value);
    umitem.SetQtd(umdm.dsetservico_ordemservicoQTD.Value);
    umitem.getumproduto.setpreco_venda(umdm.dsetservico_ordemservicoVALOR_UNITARIO.Value);
    umitem.setvalor_total(umdm.dsetservico_ordemservicoVALOR_TOTAL.Value);
    umitem.setDesconto(umdm.dsetservico_ordemservicoPERC_DESCONTO.Value);
    umitem.setvalor_desconto(umdm.dsetservico_ordemservicoVALOR_DESCONTO.Value);
    umitem.setvalor_liquido(umitem.getumproduto.getpreco_venda - (umitem.getumproduto.getpreco_venda * umitem.getDesconto / 100));
    umitem.getumfuncionario.setCodigo(umdm.dsetservico_ordemservicoID_FUNCIONARIO.Value);
    mordemservicos.getumacolecaoservico.insereFim(umitem);
    mordemservicos.getumacolecaoservico_remove.insereFim(umitem);
    umdm.dsetservico_ordemservico.Next;
  end;
  end;

constructor Daoordemservicos.CrieObj;
begin
  umadaocliente := DaoClientes.CrieObj;
  umadaousuario := DaoUsuarios.CrieObj;
  umadaocor := DaoCores.crieobj;
  umadaomodelo := DaoModelos.CrieObj;
  umadaocondicao := DaoCondicoes.CrieObj;
  umadaofuncionario := DaoFuncionarios.CrieObj;
end;

destructor Daoordemservicos.Destrua_se;
begin
  umadaocliente.Destrua_se;
  umadaousuario.Destrua_se;
  umadaocor.Destrua_se;
  umadaomodelo.Destrua_se;
  umadaocondicao.Destrua_se;
  umadaofuncionario.Destrua_se;
end;

function Daoordemservicos.Excluir(pObj: TObject): string;
var mContareceber: ContasReceber;
    mitem : Item;
    I, tamanho, qtd_produto, qtd_servico, pcodigoordemservico: integer;
    mcolecao : ColecaoContasReceber;
    mcolecao_servico : ColecaoServicos;
    mcolecao_produto : ColecaoProdutos;
    mordemservicos: ordemservicos;
begin
  mordemservicos := ordemservicos(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetordemservico.Active then
    umdm.dsetordemservico.Open;
  umdm.dsetordemservico.Delete;
  //--------------------------------------------------------------------------------------------------------------------
  //AQUI COME��O A EXCLUIR OS CONTAS A RECEBER
  //---------------------------------------------------------------------------------------------------------------------
  tamanho := mordemservicos.getumacolecaoContasReceber.getQtd;
  for I := 1 to tamanho do
  begin
    mcolecao := ColecaoContasReceber (mordemservicos.getumacolecaoContasReceber);
    mcontareceber := ContasReceber (mcolecao.Carrega(I));
    if not umdm.dsetContasReceber_ordemservico.active then
      umdm.dsetContasReceber_ordemservico.Open;
    umdm.dsetContasReceber_ordemservico.Delete;
  end;
  //-----------------------------------------------------------------------------------------------------------------------
  //AQUI COME��O A EXCLUIR OS PRODUTOS DA ORDEM DE SERVI�O
  //-----------------------------------------------------------------------------------------------------------------------
  qtd_produto := mordemservicos.getumacolecaoproduto.getQtd;
  for I:= 1 to qtd_produto do
  begin
    mcolecao_produto := ColecaoProdutos (mordemservicos.getumacolecaoproduto);
    mitem := Item (mcolecao_produto.Carrega(I));
    if not umdm.dsetproduto_ordemservico.active then
      umdm.dsetproduto_ordemservico.Open;
    umdm.dsetproduto_ordemservico.Delete;
  end;
  //-----------------------------------------------------------------------------------------------------------------------
  //AQUI COME��O A EXCLUIR OS SERVI�OS DA ORDEM DE SERVI�O
  //-----------------------------------------------------------------------------------------------------------------------
  qtd_servico := mordemservicos.getumacolecaoservico.getQtd;
  for I:= 1 to qtd_servico do
  begin
    mcolecao_servico := ColecaoServicos (mordemservicos.getumacolecaoservico);
    mitem := Item (mcolecao_servico.Carrega(I));
    if not umdm.dsetservico_ordemservico.active then
      umdm.dsetservico_ordemservico.Open;
    umdm.dsetservico_ordemservico.Delete;
  end;
  //-------------------------------------------------------------------------------------------------------------------------
  umdm.trans.Commit;
end;

function Daoordemservicos.getds: Tdatasource;
begin
  result := umdm.dsordemservico;
end;

function Daoordemservicos.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from ordem_servico'
  else if ehnumero(pChave) then
    mSQL := 'select * from ordem_servico where id_os =' + QuotedStr(pChave)
  else
    mSQL := 'select * from ordem_servico where id_os =' + QuotedStr(pChave);
  umdm.dsetordemservico.Active := false;
  umdm.dsetordemservico.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetordemservico.Active then
    umdm.dsetordemservico.Open;
  result := '';
end;

function Daoordemservicos.Salvar(pObj: TObject): string;
var
  mdata : Tdate;
  mContareceber: ContasReceber;
  mitem : Item;
  I, tamanho, qtd_produto, qtd_servico, pcodigoordemservico: integer;
  tamanho_contasreceber_remove, tamanho_produto_remove, tamanho_servico_remove : integer;
  mcolecao : ColecaoContasReceber;
  mcolecao_servico : ColecaoServicos;
  mcolecao_produto : ColecaoProdutos;
  mcolecao_contasreceber_remove : ColecaoContasReceber;
  mcolecao_servico_remove : ColecaoServicos;
  mcolecao_produto_remove : ColecaoProdutos;
  mordemservicos: ordemservicos;
begin
  mordemservicos := ordemservicos(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetordemservico.Active then
    umdm.dsetordemservico.Open;
  if mordemservicos.getnumero_os = 0 then
    umdm.dsetordemservico.Insert
  else
  begin
    mdata := now;
    umdm.dsetordemservico.Edit;
  end;
  //umdm.dsetordemservicoID_OS.Value := mordemservicos.getnumero_os;
  umdm.dsetordemservicoDATA_EMISSAO.Value := mordemservicos.getdata_emissao;
  umdm.dsetordemservicoHORA.Value := mordemservicos.gethora_emissao;
  umdm.dsetordemservicoID_USUARIO.Value := mordemservicos.getumusuario.getCodigo;
  umdm.dsetordemservicoSTATUS.Value := mordemservicos.getstatus;
  umdm.dsetordemservicoID_CLIENTE.Value := mordemservicos.getumcliente.getCodigo;
  umdm.dsetordemservicoID_COR.Value := mordemservicos.getumacor.getcodigo;
  umdm.dsetordemservicoID_MODELO.Value := mordemservicos.getummodelo.getcodigo;
  umdm.dsetordemservicoOBS.Value := mordemservicos.getobs;
  umdm.dsetordemservicoTOTAL_PRODUTOS.Value := mordemservicos.gettotal_produtos;
  umdm.dsetordemservicoTOTAL_SERVICOS.Value := mordemservicos.gettotal_servicos;
  umdm.dsetordemservicoOUTRAS_DESPESAS.Value := mordemservicos.getoutras_despesas;
  umdm.dsetordemservicoDESCONTO.Value := mordemservicos.getdesconto;
  umdm.dsetordemservicoTOTAL_OS.Value := mordemservicos.gettotal_os;
  umdm.dsetordemservicoANO_VEICULO.Value := mordemservicos.getano_veiculo;
  umdm.dsetordemservicoPLACA_VEICULO.Value := mordemservicos.getplaca_veiculo;
  umdm.dsetordemservicoID_CONDICAO.Value := mordemservicos.getumacondicao.getCodigo;
  umdm.dsetordemservicoPROBLEMA_VEICULO.Value := mordemservicos.getproblema_veiculo;
  umdm.dsetordemservicoULTIMA_ALTERACAO.Value := mdata;
  umdm.dsetordemservicoDATA_CADASTRO.Value := mordemservicos.getCadastro;
  umdm.dsetordemservico.Post;
  pcodigoordemservico := umdm.dsetordemservicoID_OS.Value;
  //------------------------------------------------------------------------------------------
  //ESSA ROTINA VAI VERIFICAR SE � UMA EDI��O DA ORDEM DER SERVI�O OU N�O!!!
  //------------------------------------------------------------------------------------------
  //------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //CASE SEJA UMA EDI��O DA ORDEM DE SERVI�O, TODOS OS PRODUTOS, SERVI�OS E CONTAS A RECEBER SER�O DELETADOS E OS NOVOS SER�O CRIADOS E INSERIDOS NO BANCO DE DADOS.
  //------------------------------------------------------------------------------------------------------------------------------------------------------------------
  if mordemservicos.getnumero_os <> 0 then
  begin
  tamanho_contasreceber_remove := mordemservicos.getumacolecaocontasreceber_remove.getQtd;
  tamanho_produto_remove := mordemservicos.getumacolecaoproduto_remove.getQtd;
  tamanho_servico_remove := mordemservicos.getumacolecaoservico_remove.getQtd;
  for I := 1 to tamanho_contasreceber_remove do
  begin
    mcolecao_contasreceber_remove := ColecaoContasReceber (mordemservicos.getumacolecaoContasReceber_remove);
    mcontareceber := ContasReceber (mcolecao_contasreceber_remove.Carrega(I));
    if not umdm.dsetContasReceber_ordemservico.active then
      umdm.dsetContasReceber_ordemservico.Open;
    umdm.dsetContasReceber_ordemservico.Delete;
  end;
  //-----------------------------------------------------------------------------------------------------------------------
  //AQUI COME��O A EXCLUIR OS PRODUTOS DA ORDEM DE SERVI�O
  //-----------------------------------------------------------------------------------------------------------------------
  for I:= 1 to tamanho_produto_remove do
  begin
    mcolecao_produto_remove := ColecaoProdutos (mordemservicos.getumacolecaoproduto_remove);
    mitem := Item (mcolecao_produto_remove.Carrega(I));
    if not umdm.dsetproduto_ordemservico.active then
      umdm.dsetproduto_ordemservico.Open;
    umdm.dsetproduto_ordemservico.Delete;
  end;
  //-----------------------------------------------------------------------------------------------------------------------
  //AQUI COME��O A EXCLUIR OS SERVI�OS DA ORDEM DE SERVI�O
  //-----------------------------------------------------------------------------------------------------------------------
  for I:= 1 to tamanho_servico_remove do
  begin
    mcolecao_servico_remove := ColecaoServicos (mordemservicos.getumacolecaoservico_remove);
    mitem := Item (mcolecao_servico_remove.Carrega(I));
    if not umdm.dsetservico_ordemservico.active then
      umdm.dsetservico_ordemservico.Open;
    umdm.dsetservico_ordemservico.Delete;
  end;
  umdm.trans.Commit;
  end;
  //------------------------------------------------------------------------------------------------------------------------------------
  //AQUI TERMINA A ROTINA DE EXCLUIR AS COLECOES DO BANCO E INICIAR AS NOVAS INSER�OES
  //-------------------------------------------------------------------------------------------------------------------------------------
  //------------------------------------------------------------------------------------------
  //AQUI FAZ INSER��O  DO CONTAS A RECEBER NO BANCO
  //------------------------------------------------------------------------------------------
  tamanho := mordemservicos.getumacolecaoContasReceber.getQtd;
  for I:= 1 to tamanho do
  begin
    mcolecao := ColecaoContasReceber (mordemservicos.getumacolecaoContasReceber);
    mcontareceber := ContasReceber (mcolecao.Carrega(I));
    if not umdm.dsetContasReceber_ordemservico.active then
      umdm.dsetContasReceber_ordemservico.Open;
    umdm.dsetContasReceber_ordemservico.Insert;
    umdm.dsetContasReceber_ordemservicoNUMERO_OS.Value          := pcodigoordemservico;
    umdm.dsetContasReceber_ordemservicoID_CLIENTE.Value         := mordemservicos.Getumcliente.getCodigo;
    umdm.dsetContasReceber_ordemservicoDATA_EMISSAO.Value       := mordemservicos.getData_emissao;
    umdm.dsetContasReceber_ordemservicoNUMERO_PARCELA.Value     := mcontareceber.getnumero_parcela;
    umdm.dsetContasReceber_ordemservicoVALOR_PARCELA.Value      := mcontareceber.getvalor_parcela;
    umdm.dsetContasReceber_ordemservicoDATA_VENCIMENTO.Value    := mcontareceber.getdata_vencimento;
    umdm.dsetContasReceber_ordemservicoDATA_PAGAMENTO.Value     := mcontareceber.getdata_pagamento;
    umdm.dsetContasReceber_ordemservicoJUROS.Value              := mcontareceber.getjuros;
    umdm.dsetContasReceber_ordemservicoMULTA.Value              := mcontareceber.getmulta;
    umdm.dsetContasReceber_ordemservicoVALOR_PAGO.Value         := mcontareceber.getvalor_pago;
    umdm.dsetContasReceber_ordemservicoID_FORMAPAGAMENTO.Value  := mcontareceber.getumaformapagamento.getCodigo;
    umdm.dsetContasReceber_ordemservicoVALOR_DESCONTO.Value     := mcontareceber.getdesconto;
    umdm.dsetContasReceber_ordemservico.Post;
  end;
  //------------------------------------------------------------------------------------------
  //AQUI FAZ INSER��O  DOS PRODUTOS ORDEM SERVIDO NO BANCO
  //------------------------------------------------------------------------------------------
  qtd_produto := mordemservicos.getumacolecaoproduto.getQtd;
  for I:= 1 to qtd_produto do
  begin
    mcolecao_produto := ColecaoProdutos (mordemservicos.getumacolecaoproduto);
    mitem := Item (mcolecao_produto.Carrega(I));
    if not umdm.dsetproduto_ordemservico.active then
      umdm.dsetproduto_ordemservico.Open;
    umdm.dsetproduto_ordemservico.Insert;
    umdm.dsetproduto_ordemservicoNUMERO_OS.Value                := pcodigoordemservico;
    umdm.dsetproduto_ordemservicoID_CLIENTE.Value               := mordemservicos.Getumcliente.getCodigo;
    umdm.dsetproduto_ordemservicoID_PRODUTO.Value               := mitem.getumproduto.getCodigo;
    umdm.dsetproduto_ordemservicoQTD.Value                      := mitem.getQtd;
    umdm.dsetproduto_ordemservicoVALOR_UNITARIO.Value           := mitem.getumproduto.getpreco_venda;
    umdm.dsetproduto_ordemservicoVALOR_TOTAL.Value              := mitem.getvalor_total;
    umdm.dsetproduto_ordemservicoPERC_DESCONTO.Value            := mitem.getDesconto;
    umdm.dsetproduto_ordemservicoVALOR_DESCONTO.Value           := mitem.getvalor_desconto;
    umdm.dsetproduto_ordemservico.Post;
  end;
  //------------------------------------------------------------------------------------------
  //AQUI FAZ INSER��O  DOS SERVICOS ORDEM SERVIDO NO BANCO
  //------------------------------------------------------------------------------------------
  qtd_servico := mordemservicos.getumacolecaoservico.getQtd;
  for I:= 1 to qtd_servico do
  begin
    mcolecao_servico := ColecaoServicos (mordemservicos.getumacolecaoservico);
    mitem := Item (mcolecao_servico.Carrega(I));
    if not umdm.dsetservico_ordemservico.active then
      umdm.dsetservico_ordemservico.Open;
    umdm.dsetservico_ordemservico.Insert;
    umdm.dsetservico_ordemservicoNUMERO_OS.Value                  := pcodigoordemservico;
    umdm.dsetservico_ordemservicoID_CLIENTE.Value                 := mordemservicos.Getumcliente.getCodigo;
    umdm.dsetservico_ordemservicoID_SERVICO.Value                 := mitem.getumproduto.getCodigo;
    umdm.dsetservico_ordemservicoQTD.Value                        := mitem.getQtd;
    umdm.dsetservico_ordemservicoVALOR_UNITARIO.Value             := mitem.getumproduto.getpreco_venda;
    umdm.dsetservico_ordemservicoVALOR_TOTAL.Value                := mitem.getvalor_total;
    umdm.dsetservico_ordemservicoPERC_DESCONTO.Value              := mitem.getDesconto;
    umdm.dsetservico_ordemservicoVALOR_DESCONTO.Value             := mitem.getvalor_desconto;
    umdm.dsetservico_ordemservicoID_FUNCIONARIO.Value             := mitem.getumfuncionario.getCodigo;
    umdm.dsetservico_ordemservico.Post;
  end;
  umdm.trans.Commit;
end;

procedure Daoordemservicos.setdaocliente(pObj: TObject);
begin
  umadaocliente := DaoClientes(pObj);
end;


procedure Daoordemservicos.setdaocondicao(pObj: TObject);
begin
  umadaocondicao := Daocondicoes(pObj);
end;

procedure Daoordemservicos.setdaocor(pObj: TObject);
begin
  umadaocor := DaoCores(pObj);
end;

procedure Daoordemservicos.setdaofuncionario(pObj: TObject);
begin
  umadaofuncionario := DaoFuncionarios(pObj);
end;

procedure Daoordemservicos.setdaomodelo(pObj: TObject);
begin
  umadaomodelo := DaoModelos(pObj);
end;

procedure Daoordemservicos.setdaousuario(pObj: TObject);
begin
  umadaousuario := DaoUsuarios (pObj);
end;

procedure Daoordemservicos.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

end.
