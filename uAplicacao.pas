unit uAplicacao;

interface
uses uGerente, uInter, uProdutos, uFabricantes, uVeiculos, uGrupos, uPaises, uEstados, uCidades,
uFornecedores, uClientes, uUsuarios, uFuncionarios, UDM, uControllerpaises, uControllerestados, uControllercidades,
uControllerprodutos, uControllerclientes, uControllerusuarios, uControllerFuncionarios, uControllerfabricantes, uControllerVeiculos,
uControllerfornecedores, uControllergrupos, uMarcas, uControllerMarcas, uModelos, uControllerModelos, uFormaPagamentos, uControllerFormaPagamentos,
uControllerCondicoes, uCondicoes, uColecaoParcelas, uCores, uControllerCores, uCombustiveis, uControllerCombustiveis, uCompras, uControllerCompras, uColecaoprodutos, uFrmLogin,
uContasPagar, uControllerContasPagar, uOrdemServicos, uControllerOrdemservicos, uServicos, uControllerServicos, uVenda_Produtos, uControllerVenda_Produtos, uColecaoservicos, uContasReceber, uControllerContasReceber;
  type Aplicacao = class
  private

  protected
    umaInter            : interfaces;
    umGerente           : TGerente;
    umproduto           : Produtos;
    umgrupo             : Grupos;
    umfabricante        : Fabricantes;
    umveiculo           : Veiculos;
    umpais              : Paises;
    umestado            : Estados;
    umacidade           : Cidades;
    umfornecedor        : Fornecedores;
    umcliente           : Clientes;
    umusuario           : Usuarios;
    umfuncionario       : Funcionarios;
    umamarca            : Marcas;
    ummodelo            : Modelos;
    umaformapagamento   : FormaPagamentos;
    umacondicao         : Condicoes;
    umacor              : Cores;
    umcombustivel       : Combustiveis;
    umacompra           : Compras;
    umacontapagar       : ContasPagar;
    umaordemservico     : OrdemServicos;
    umservico           : Servicos;
    umacontareceber     : ContasReceber;
    umavendaproduto     : Venda_Produtos;
    umdm                : TDM;
    umfrmlogin          : TFrmLogin;
    umactrlpais           : Controllerpaises;
    umactrlestado         : Controllerestados;
    umactrlcidade         : Controllercidades;
    umactrlproduto        : Controllerprodutos;
    umactrlcliente        : Controllerclientes;
    umactrlgrupo          : Controllergrupos;
    umactrlfabricante     : Controllerfabricantes;
    umactrlveiculo        : ControllerVeiculos;
    umactrlusuario        : Controllerusuarios;
    umactrlfuncionario    : Controllerfuncionarios;
    umactrlfornecedor     : Controllerfornecedores;
    umactrlmarca          : ControllerMarcas;
    umactrlmodelo         : ControllerModelos;
    umactrlformapagamento : ControllerFormaPagamentos;
    umactrlcondicao       : ControllerCondicoes;
    umactrlcor            : ControllerCores;
    umactrlcombustivel    : ControllerCombustiveis;
    umactrlcompra         : ControllerCompras;
    umactrlcontapagar     : ControllerContasPagar;
    umactrlordemservico   : ControllerOrdemServicos;
    umactrlservico        : ControllerServicos;
    umactrlcontareceber   : ControllerContasReceber;
    umactrlvendaproduto   : ControllerVenda_Produtos;

  public
    constructor CrieObj;
    destructor Destrua_se;
    procedure Execute_se;

end;

implementation

{ Aplicacao }

constructor Aplicacao.CrieObj;
begin
  umaInter            := Interfaces.CrieObj;
  umGerente           := TGerente.Create(nil);
  umproduto           := Produtos.Crieobj;
  umveiculo           := Veiculos.Crieobj;
  umfabricante        := Fabricantes.Crieobj;
  umgrupo             := Grupos.Crieobj;
  umpais              := Paises.Crieobj;
  umestado            := Estados.Crieobj;
  umacidade           := Cidades.Crieobj;
  umfornecedor        := Fornecedores.Crieobj;
  umcliente           := Clientes.Crieobj;
  umusuario           := Usuarios.Crieobj;
  umfuncionario       := Funcionarios.Crieobj;
  umamarca            := Marcas.crieobj;
  ummodelo            := Modelos.Crieobj;
  umacondicao         := Condicoes.crieobj;
  umaformapagamento   := FormaPagamentos.Crieobj;
  umacor              := Cores.Crieobj;
  umcombustivel       := Combustiveis.Crieobj;
  umacompra           := Compras.Crieobj;
  umacontapagar       := ContasPagar.Crieobj;
  umfrmlogin          := TFrmLogin.Create(nil);
  umaordemservico     := OrdemServicos.Crieobj;
  umservico           := Servicos.Crieobj;
  umacontareceber     := ContasReceber.Crieobj;
  umavendaproduto     := Venda_Produtos.Crieobj;

  umdm                := TDM.Create(nil);
  umactrlpais           := Controllerpaises.crieobj;
  umactrlestado         := Controllerestados.CrieObj;
  umactrlcidade         := Controllercidades.CrieObj;
  umactrlproduto        := Controllerprodutos.CrieObj;
  umactrlcliente        := Controllerclientes.CrieObj;
  umactrlgrupo          := Controllergrupos.CrieObj;
  umactrlfabricante     := Controllerfabricantes.CrieObj;
  umactrlveiculo        := Controllerveiculos.CrieObj;
  umactrlusuario        := Controllerusuarios.CrieObj;
  umactrlfuncionario    := Controllerfuncionarios.CrieObj;
  umactrlfornecedor     := Controllerfornecedores.CrieObj;
  umactrlmarca          := ControllerMarcas.CrieObj;
  umactrlmodelo         := ControllerModelos.CrieObj;
  umactrlcondicao       := ControllerCondicoes.CrieObj;
  umactrlformapagamento := ControllerFormapagamentos.CrieObj;
  umactrlcor            := ControllerCores.CrieObj;
  umactrlcombustivel    := ControllerCombustiveis.CrieObj;
  umactrlcompra         := ControllerCompras.CrieObj;
  umactrlcontapagar     := ControllerContasPagar.CrieObj;
  umactrlordemservico   := ControllerOrdemservicos.CrieObj;
  umactrlservico        := ControllerServicos.CrieObj;
  umactrlcontareceber   := ControllerContasReceber.CrieObj;
  umactrlvendaproduto   := ControllerVenda_Produtos.CrieObj;

  umactrlpais.setDM(umdm);
  umactrlestado.setDM(umdm);
  umactrlcidade.setDM(umdm);
  umactrlcliente.setDM(umdm);
  umactrlproduto.setDM(umdm);
  umactrlgrupo.setDM(umdm);
  umactrlfabricante.setDM(umdm);
  umactrlveiculo.setDM(umdm);
  umactrlusuario.setDM(umdm);
  umactrlfuncionario.setDM(umdm);
  umactrlfornecedor.setDM(umdm);
  umactrlestado.setctrlpais(umactrlpais);
  umactrlcidade.setctrlestado(umactrlestado);
  umactrlmarca.setDM(umdm);
  umactrlmodelo.setDM(umdm);
  umactrlcondicao.setDM(umdm);
  umactrlformapagamento.setDM(umdm);
  umactrlusuario.setDM(umdm);
  umactrlcor.setDM(umdm);
  umactrlcombustivel.setDM(umdm);
  umactrlcompra.setDM(umdm);
  umactrlcontapagar.setDM(umdm);
  umactrlordemservico.setDM(umdm);
  umactrlservico.setDM(umdm);
  umactrlcontareceber.setDM(umdm);
  umactrlvendaproduto.setDM(umdm);

  umactrlmodelo.setctrlmarca(umactrlmarca);
  umactrlveiculo.setctrlmodelo(umactrlmodelo);
  umactrlveiculo.setctrlcor(umactrlcor);
  umactrlveiculo.setctrlcombustivel(umactrlcombustivel);
  umactrlfuncionario.setctrlcidade(umactrlcidade);
  umactrlcliente.setctrlcidade(umactrlcidade);
  umactrlcliente.setctrlcondicao(umactrlcondicao);
  umactrlusuario.setctrlfuncionario(umactrlfuncionario);
  umactrlcondicao.setctrlformapagamento(umactrlformapagamento);
  umactrlfornecedor.setctrlcidade(umactrlcidade);
  umactrlfornecedor.setctrlformapagamento(umactrlcondicao);
  umactrlproduto.setctrlfabricante(umactrlfabricante);
  umactrlproduto.setctrlfornecedor(umactrlfornecedor);
  umactrlproduto.setctrlgrupo(umactrlgrupo);
  umactrlcompra.setctrlcondicao(umactrlcondicao);
  umactrlcompra.setctrlfornecedor(umactrlfornecedor);
  umactrlcompra.setctrlproduto(umactrlproduto);
  umactrlcompra.setctrlformapagamento(umactrlformapagamento);
  umactrlcontapagar.setctrlformapagamento(umactrlformapagamento);
  umactrlcontapagar.setctrlfornecedor(umactrlfornecedor);
  umactrlordemservico.setctrlcliente(umactrlcliente);
  umactrlordemservico.setctrlCor(umactrlcor);
  umactrlordemservico.setctrlusuario(umactrlusuario);
  umactrlordemservico.setctrlproduto(umactrlproduto);
  umactrlordemservico.setctrlmodelo(umactrlmodelo);
  umactrlordemservico.setctrlservico(umactrlservico);
  umactrlordemservico.setctrlcondicao(umactrlcondicao);
  umactrlordemservico.setctrlfuncionario(umactrlfuncionario);
  umactrlordemservico.setctrlvendaproduto(umactrlvendaproduto);
  umactrlcontareceber.setctrlformapagamento(umactrlformapagamento);
  umactrlcontareceber.setctrlCliente(umactrlcliente);
  umactrlvendaproduto.setctrlcondicao(umactrlcondicao);
  umactrlvendaproduto.setctrlcliente(umactrlcliente);
  umactrlvendaproduto.setctrlproduto(umactrlproduto);
  umactrlvendaproduto.setctrlformapagamento(umactrlformapagamento);

end;

destructor Aplicacao.Destrua_se;
begin
  umaInter.Destrua_se;
  umGerente.free;
  umproduto.Destrua_se;
  umveiculo.Destrua_se;
  umfabricante.Destrua_se;
  umgrupo.Destrua_se;
  umpais.Destrua_se;
  umestado.Destrua_se;
  umacidade.Destrua_se;
  umfornecedor.Destrua_se;
  umcliente.Destrua_se;
  umusuario.Destrua_se;
  umfuncionario.Destrua_se;
  umacondicao.destrua_se;
  ummodelo.Destrua_se;
  umamarca.destrua_se;
  umaformapagamento.Destrua_se;
  umacor.destrua_se;
  umcombustivel.Destrua_se;
  umacompra.Destrua_se;
  umacontapagar.Destrua_se;
  umfrmlogin.Free;
  umaordemservico.Destrua_se;
  umservico.Destrua_se;
  umavendaproduto.Destrua_se;
  umacontareceber.Destrua_se;

  umactrlpais.Destrua_se;
  umactrlestado.Destrua_se;
  umactrlcidade.Destrua_se;
  umactrlproduto.Destrua_se;
  umactrlcliente.Destrua_se;
  umactrlgrupo.Destrua_se;
  umactrlfabricante.Destrua_se;
  umactrlveiculo.Destrua_se;
  umactrlusuario.Destrua_se;
  umactrlfuncionario.Destrua_se;
  umactrlfornecedor.Destrua_se;
  umdm.Free;
  umactrlmarca.destrua_se;
  umactrlmodelo.Destrua_se;
  umactrlcondicao.Destrua_se;
  umactrlcor.destrua_se;
  umactrlcombustivel.Destrua_se;
  umactrlcompra.Destrua_se;
  umactrlcontapagar.Destrua_se;
  umactrlordemservico.Destrua_se;
  umactrlservico.Destrua_se;
  umactrlcontareceber.Destrua_se;
  umactrlvendaproduto.Destrua_se;
end;

procedure Aplicacao.Execute_se;
begin
  umGerente.ConhecaObj (umaInter, umproduto, umgrupo, umfabricante, umveiculo,  umpais, umestado, umacidade, umfornecedor, umcliente, umusuario, umfuncionario, umactrlpais,umactrlestado, umactrlcidade, umactrlproduto, umactrlcliente, umactrlgrupo, umactrlfabricante,
  umactrlveiculo, umactrlusuario, umactrlfuncionario, umactrlfornecedor, umamarca, umactrlmarca, ummodelo, umactrlmodelo, umacondicao, umactrlcondicao, umaformapagamento, umactrlformapagamento, umacor, umactrlcor, umcombustivel, umactrlcombustivel, umacompra, umactrlcompra,
  umacontapagar, umactrlcontapagar, umaordemservico, umactrlordemservico, umservico, umactrlservico, umavendaproduto, umactrlvendaproduto, umacontareceber, umactrlcontareceber );
  umfrmlogin.ShowModal;
  umGerente.ShowModal;
end;

end.
