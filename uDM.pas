unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  IBX.IBCustomDataSet, FireDAC.Comp.Client, IBX.IBDatabase, IBX.IBQuery,
  Data.Win.ADODB, System.Actions, Vcl.ActnList;

type
  TDM = class(TDataModule)
    banco: TIBDatabase;
    dsetpais: TIBDataSet;
    dsetestado: TIBDataSet;
    dsetestadoID_ESTADO: TIntegerField;
    dsetestadoESTADO: TIBStringField;
    dsetestadoUF: TIBStringField;
    dsetestadoID_PAIS: TIntegerField;
    dsetestadoDATA_CADASTRO: TDateField;
    dsetestadoULTIMA_ALTERACAO: TDateField;
    dsetpaisID_PAIS: TIntegerField;
    dsetpaisPAIS: TIBStringField;
    dsetpaisDDI: TIBStringField;
    dsetpaisSIGLA: TIBStringField;
    dsetpaisDATA_CADASTRO: TDateField;
    dsetpaisULTIMA_ALTERACAO: TDateField;
    dspais: TDataSource;
    dsestado: TDataSource;
    dscidade: TDataSource;
    dsetmarca: TIBDataSet;
    dsmarca: TDataSource;
    dsetmarcaID_MARCA: TIntegerField;
    dsetmarcaMARCA: TIBStringField;
    dsmodelo: TDataSource;
    dsveiculo: TDataSource;
    dsfuncionario: TDataSource;
    dsetfuncionario: TIBDataSet;
    dsetfuncionarioID_FUNCIONARIO: TIntegerField;
    dsetfuncionarioNOME: TIBStringField;
    dsetfuncionarioCARGO: TIBStringField;
    dsetfuncionarioSEXO: TIBStringField;
    dsetfuncionarioTELEFONE: TIBStringField;
    dsetfuncionarioCELULAR: TIBStringField;
    dsetfuncionarioNASCIMENTO: TDateField;
    dsetfuncionarioEMAIL: TIBStringField;
    dsetfuncionarioCOMISSAO: TFloatField;
    dsetfuncionarioENDERECO: TIBStringField;
    dsetfuncionarioNUMERO: TIntegerField;
    dsetfuncionarioBAIRRO: TIBStringField;
    dsetfuncionarioID_CIDADE: TIntegerField;
    dsetfuncionarioSTATUS: TIBStringField;
    dsetfuncionarioCPF: TIBStringField;
    dscliente: TDataSource;
    dsetusuario: TIBDataSet;
    dsusuario: TDataSource;
    dsetusuarioID_USUARIO: TIntegerField;
    dsetusuarioNOME: TIBStringField;
    dsetusuarioUSUARIO: TIBStringField;
    dsetusuarioSENHA: TIBStringField;
    dsetusuarioPERMISSAO: TIBStringField;
    dsetusuarioID_FUNCIONARIO: TIntegerField;
    dsetusuarioSTATUS: TIBStringField;
    dsetusuarioDATA_CADASTRO: TDateField;
    dsetusuarioULTIMA_ALTERACAO: TDateField;
    dsetusuarioID_ALTEROU: TIntegerField;
    dsetmodelo: TIBDataSet;
    dsetmodeloID_MODELO: TIntegerField;
    dsetmodeloMODELO: TIBStringField;
    dsetmodeloID_MARCA: TIntegerField;
    dsetfabricante: TIBDataSet;
    dsfabricante: TDataSource;
    dsetfabricanteID_FABRICANTE: TIntegerField;
    dsetfabricanteFABRICANTE: TIBStringField;
    dsetfabricanteCNPJ: TIBStringField;
    dsformapagamento: TDataSource;
    dsetformapag: TIBDataSet;
    dsetformapagID_FORMAPAGAMENTO: TIntegerField;
    dsetformapagFORMA_PAGAMENTO: TIBStringField;
    dsetgrupo: TIBDataSet;
    dsgrupo: TDataSource;
    dsetgrupoID_GRUPO: TIntegerField;
    dsetgrupoGRUPO: TIBStringField;
    dscor: TDataSource;
    dsetcor: TIBDataSet;
    dsetcorID_COR: TIntegerField;
    dsetcorCOR: TIBStringField;
    dsetcorDATA_CADASTRO: TDateField;
    dsetcorULTIMA_ALTERACAO: TDateField;
    dscombustivel: TDataSource;
    dsetcombustivel: TIBDataSet;
    dsetcombustivelID_COMBUSTIVEL: TIntegerField;
    dsetcombustivelCOMBUSTIVEL: TIBStringField;
    dsetcombustivelDATA_CADASTRO: TDateField;
    dsetcombustivelULTIMA_ALTERACAO: TDateField;
    dsetmarcaDATA_CADASTRO: TDateField;
    dsetmarcaULTIMA_ALTERACAO: TDateField;
    dsetmodeloDATA_CADASTRO: TDateField;
    dsetmodeloULTIMA_ALTERACAO: TDateField;
    dsetfuncionarioDATA_CADASTRO: TDateField;
    dsetfuncionarioULTIMA_ALTERACAO: TDateField;
    dsetformapagDATA_CADASTRO: TDateField;
    dsetformapagULTIMA_ALTERACAO: TDateField;
    dsetfabricanteDATA_CADASTRO: TDateField;
    dsetfabricanteULTIMA_ALTERACAO: TDateField;
    dsetgrupoDATA_CADASTRO: TDateField;
    dsetgrupoULTIMA_ALTERACAO: TDateField;
    view_cidade: TIBDataSet;
    view_cidadeID_CIDADE: TIntegerField;
    view_cidadeCIDADE01: TIBStringField;
    view_cidadeDDD: TIBStringField;
    view_cidadeID_ESTADO: TIntegerField;
    view_cidadeESTADO01: TIBStringField;
    view_cidadeDATA_CADASTRO: TDateField;
    view_cidadeULTIMA_ALTERACAO: TDateField;
    dsetcidade: TIBDataSet;
    dsetcidadeID_CIDADE: TIntegerField;
    dsetcidadeCIDADE: TIBStringField;
    dsetcidadeDDD: TIBStringField;
    dsetcidadeID_ESTADO: TIntegerField;
    dsetcidadeDATA_CADASTRO: TDateField;
    dsetcidadeULTIMA_ALTERACAO: TDateField;
    dsfornecedor: TDataSource;
    dsetproduto: TIBDataSet;
    dsproduto: TDataSource;
    trans: TIBTransaction;
    dsetparcela: TIBDataSet;
    dsetparcelaDIAS_PRAZO: TIntegerField;
    dsetparcelaID_FORMAPAGAMENTO: TIntegerField;
    dsetparcelaPERCENTUAL: TFloatField;
    dsetparcelaDATA_CADASTRO: TDateField;
    dsetparcelaDATA_ALTERACAO: TDateField;
    dsetparcelaNUM_PARCELA: TIntegerField;
    dsetparcelaID_CONDICAO: TIntegerField;
    dsparcela: TDataSource;
    dscompra: TDataSource;
    dsetcompra: TIBDataSet;
    dsetcompraNUMERO_NOTA: TIntegerField;
    dsetcompraSTATUS: TIBStringField;
    dsetcompraDATA_ENTRADA: TDateField;
    dsetcompraDATA_EMISSAO: TDateField;
    dsetcompraID_FORNECEDOR: TIntegerField;
    dsetcompraID_CONDICAO: TIntegerField;
    dsetcompraDATA_CANCELAMENTO: TDateField;
    dsetcompraOUTRAS_DESPESAS: TIBBCDField;
    dsetcompraTOTAL_PRODUTOS: TIBBCDField;
    dsetcompraTOTAL_COMPRA: TIBBCDField;
    dsetcompraSEGURO: TIBBCDField;
    dsetcompraVALOR_FRETE: TIBBCDField;
    dsetcompraTOTAL_DESCONTO: TIBBCDField;
    dsetcompraSERIE: TIBStringField;
    dsetcompraMODELO: TIBStringField;
    dsetprodutoID_PRODUTO: TIntegerField;
    dsetprodutoPRODUTO: TIBStringField;
    dsetprodutoCOD_BARRAS: TIBStringField;
    dsetprodutoID_FABRICANTE: TIntegerField;
    dsetprodutoID_FORNECEDOR: TIntegerField;
    dsetprodutoSTATUS: TIBStringField;
    dsetprodutoMARGEM: TFloatField;
    dsetprodutoUND: TIBStringField;
    dsetprodutoESTOQUE: TIntegerField;
    dsetprodutoTIPO_PRODUTO: TIBStringField;
    dsetprodutoID_GRUPO: TIntegerField;
    dsetprodutoOBS_PRODUTO: TIBStringField;
    dsetprodutoDATA_CADASTRO: TDateField;
    dsetprodutoULTIMA_ALTERACAO: TDateField;
    dsetprodutoPRECO_COMPRA: TIBBCDField;
    dsetprodutoPRECO_VENDA: TIBBCDField;
    dsetprodutoCUSTO_PRODUTO: TIBBCDField;
    dscontaspagar: TDataSource;
    dsetcontaspagar: TIBDataSet;
    dsetcontaspagarNUMERO_NOTA: TIntegerField;
    dsetcontaspagarSERIE: TIBStringField;
    dsetcontaspagarMODELO: TIBStringField;
    dsetcontaspagarID_FORNECEDOR: TIntegerField;
    dsetcontaspagarDATA_EMISSAO: TDateField;
    dsetcontaspagarNUMERO_PARCELA: TIntegerField;
    dsetcontaspagarVALOR_PARCELA: TIBBCDField;
    dsetcontaspagarDATA_VENCIMENTO: TDateField;
    dsetcontaspagarDATA_PAGAMENTO: TDateField;
    dsetcontaspagarJUROS: TFloatField;
    dsetcontaspagarMULTA: TIBBCDField;
    dsetcontaspagarVALOR_PAGO: TIBBCDField;
    dsetcontaspagarID_FORMAPAGAMENTO: TIntegerField;
    dsetcontaspagarDATA_CADASTRO: TDateField;
    dsetcontaspagarULTIMA_ALTERACAO: TDateField;
    dsetcontaspagarID_USUARIO: TIntegerField;
    dsetcontaspagarDESCONTO: TIBBCDField;
    dsetitem_compra: TIBDataSet;
    dsitem_compra: TDataSource;
    dsetitem_compraNUMERO_NOTA: TIntegerField;
    dsetitem_compraSERIE: TIBStringField;
    dsetitem_compraMODELO: TIBStringField;
    dsetitem_compraID_FORNECEDOR: TIntegerField;
    dsetitem_compraID_PRODUTO: TIntegerField;
    dsetitem_compraQTD: TIntegerField;
    dsetitem_compraVALOR_UNITARIO: TIBBCDField;
    dsetitem_compraVALOR_TOTAL: TIBBCDField;
    dsetitem_compraDATA_CADASTRO: TDateField;
    dsetitem_compraULTIMA_ALTERACAO: TDateField;
    dsordemservico: TDataSource;
    dsetservico: TIBDataSet;
    dsservico: TDataSource;
    dsetservicoID_SERVICO: TIntegerField;
    dsetservicoDESCRICAO: TIBStringField;
    dsetservicoCUSTO: TIBBCDField;
    dsetservicoPRECO_VENDA: TIBBCDField;
    dsetservicoOBS: TIBStringField;
    dsetservicoDATA_CADASTRO: TDateField;
    dsetservicoULTIMA_ALTERACAO: TDateField;
    dsetveiculo: TIBDataSet;
    dsetveiculoID_VEICULO: TIntegerField;
    dsetveiculoID_MODELO: TIntegerField;
    dsetveiculoCHASSI: TIBStringField;
    dsetveiculoPLACA: TIBStringField;
    dsetveiculoANO: TIBStringField;
    dsetveiculoQUILOMETRAGEM: TLargeintField;
    dsetveiculoID_COMBUSTIVEL: TIntegerField;
    dsetveiculoID_COR: TIntegerField;
    dsetveiculoDATA_CADASTRO: TDateField;
    dsetveiculoULTIMA_ALTERACAO: TDateField;
    dsetcondicao: TIBDataSet;
    dscondicao: TDataSource;
    dsetcondicaoID_CONDICAO: TIntegerField;
    dsetcondicaoCONDICAO: TIBStringField;
    dsetcondicaoJUROS: TFloatField;
    dsetcondicaoQTD_PARCELA: TIntegerField;
    dsetcondicaoDATA_CADASTRO: TDateField;
    dsetcondicaoULTIMA_ALTERACAO: TDateField;
    dsetcontasreceber: TIBDataSet;
    dsetitem_venda: TIBDataSet;
    dsetcontasreceberNUMERO_NOTA: TIntegerField;
    dsetcontasreceberSERIE: TIBStringField;
    dsetcontasreceberMODELO: TIBStringField;
    dsetcontasreceberID_CLIENTE: TIntegerField;
    dsetcontasreceberDATA_EMISSAO: TDateField;
    dsetcontasreceberNUMERO_PARCELA: TIntegerField;
    dsetcontasreceberVALOR_PARCELA: TIBBCDField;
    dsetcontasreceberDATA_VENCIMENTO: TDateField;
    dsetcontasreceberDATA_PAGAMENTO: TDateField;
    dsetcontasreceberJUROS: TFloatField;
    dsetcontasreceberMULTA: TIBBCDField;
    dsetcontasreceberVALOR_PAGO: TIBBCDField;
    dsetcontasreceberID_FORMAPAGAMENTO: TIntegerField;
    dsetcontasreceberDATA_CADASTRO: TDateField;
    dsetcontasreceberULTIMA_ALTERACAO: TDateField;
    dsetcontasreceberID_USUARIO: TIntegerField;
    dsetcontasreceberDESCONTO: TIBBCDField;
    dscontasreceber: TDataSource;
    dsitem_venda: TDataSource;
    dsvenda_produto: TDataSource;
    dsetitem_vendaNUMERO_NOTA: TIntegerField;
    dsetitem_vendaSERIE: TIBStringField;
    dsetitem_vendaMODELO: TIBStringField;
    dsetitem_vendaID_CLIENTE: TIntegerField;
    dsetitem_vendaID_PRODUTO: TIntegerField;
    dsetitem_vendaQTD: TIntegerField;
    dsetitem_vendaVALOR_UNITARIO: TIBBCDField;
    dsetitem_vendaVALOR_TOTAL: TIBBCDField;
    dsetitem_vendaDATA_CADASTRO: TDateField;
    dsetitem_vendaULTIMA_ALTERACAO: TDateField;
    dsetservico_venda: TIBDataSet;
    dsservico_venda: TDataSource;
    dsetproduto_ordemservico: TIBDataSet;
    dsproduto_ordemservico: TDataSource;
    dsetservico_ordemservico: TIBDataSet;
    dsservico_ordemservico: TDataSource;
    dsetcontasreceber_ordemservico: TIBDataSet;
    dscontasreceber_ordemservico: TDataSource;
    dsetservico_vendaNUMERO_NOTA: TIntegerField;
    dsetservico_vendaSERIE: TIBStringField;
    dsetservico_vendaMODELO: TIBStringField;
    dsetservico_vendaID_CLIENTE: TIntegerField;
    dsetservico_vendaID_SERVICO: TIntegerField;
    dsetservico_vendaQTD: TIntegerField;
    dsetservico_vendaVALOR_UNITARIO: TIBBCDField;
    dsetservico_vendaVALOR_TOTAL: TIBBCDField;
    dsetservico_vendaVALOR_DESCONTO: TIBBCDField;
    dsetservico_vendaPERC_DESCONTO: TFloatField;
    dsetproduto_ordemservicoNUMERO_OS: TIntegerField;
    dsetproduto_ordemservicoID_CLIENTE: TIntegerField;
    dsetproduto_ordemservicoID_PRODUTO: TIntegerField;
    dsetproduto_ordemservicoQTD: TIntegerField;
    dsetproduto_ordemservicoVALOR_UNITARIO: TIBBCDField;
    dsetproduto_ordemservicoVALOR_TOTAL: TIBBCDField;
    dsetproduto_ordemservicoVALOR_DESCONTO: TIBBCDField;
    dsetproduto_ordemservicoPERC_DESCONTO: TFloatField;
    dsetproduto_ordemservicoDATA_CADASTRO: TDateField;
    dsetproduto_ordemservicoULTIMA_ALTERACAO: TDateField;
    dsetservico_ordemservicoNUMERO_OS: TIntegerField;
    dsetservico_ordemservicoID_CLIENTE: TIntegerField;
    dsetservico_ordemservicoID_SERVICO: TIntegerField;
    dsetservico_ordemservicoQTD: TIntegerField;
    dsetservico_ordemservicoVALOR_UNITARIO: TIBBCDField;
    dsetservico_ordemservicoVALOR_TOTAL: TIBBCDField;
    dsetservico_ordemservicoVALOR_DESCONTO: TIBBCDField;
    dsetservico_ordemservicoPERC_DESCONTO: TFloatField;
    dsetservico_ordemservicoID_FUNCIONARIO: TIntegerField;
    dsetservico_ordemservicoDATA_CADASTRO: TDateField;
    dsetservico_ordemservicoULTIMA_ALTERACAO: TDateField;
    dsetcontasreceber_ordemservicoNUMERO_OS: TIntegerField;
    dsetcontasreceber_ordemservicoID_CLIENTE: TIntegerField;
    dsetcontasreceber_ordemservicoDATA_EMISSAO: TDateField;
    dsetcontasreceber_ordemservicoNUMERO_PARCELA: TIntegerField;
    dsetcontasreceber_ordemservicoVALOR_PARCELA: TIBBCDField;
    dsetcontasreceber_ordemservicoDATA_VENCIMENTO: TDateField;
    dsetcontasreceber_ordemservicoDATA_PAGAMENTO: TDateField;
    dsetcontasreceber_ordemservicoJUROS: TFloatField;
    dsetcontasreceber_ordemservicoMULTA: TIBBCDField;
    dsetcontasreceber_ordemservicoVALOR_PAGO: TIBBCDField;
    dsetcontasreceber_ordemservicoID_FORMAPAGAMENTO: TIntegerField;
    dsetcontasreceber_ordemservicoID_USUARIO: TIntegerField;
    dsetcontasreceber_ordemservicoVALOR_DESCONTO: TIBBCDField;
    dsetcontasreceber_ordemservicoDATA_CADASTRO: TDateField;
    dsetcontasreceber_ordemservicoULTIMA_ALTERACAO: TDateField;
    dsetcliente: TIBDataSet;
    dsetclienteID_CLIENTE: TIntegerField;
    dsetclienteNOME: TIBStringField;
    dsetclienteDATA_NASC: TDateField;
    dsetclienteSEXO: TIBStringField;
    dsetclienteTPCLIENTE: TIBStringField;
    dsetclienteNACIONALIDADE: TIBStringField;
    dsetclienteCNPJ_CPF: TIBStringField;
    dsetclienteINSCEST_RG: TIBStringField;
    dsetclienteEMAIL: TIBStringField;
    dsetclienteLIMITE: TFloatField;
    dsetclienteCELULAR: TIBStringField;
    dsetclienteTELEFONE: TIBStringField;
    dsetclientePONTO_REF: TIBStringField;
    dsetclienteENDERECO: TIBStringField;
    dsetclienteNUMERO: TIBStringField;
    dsetclienteBAIRRO: TIBStringField;
    dsetclienteID_CIDADE: TIntegerField;
    dsetclienteID_CONDICAO: TIntegerField;
    dsetclienteSTATUS: TIBStringField;
    dsetclienteDATA_CADASTRO: TDateField;
    dsetclienteULTIMA_ALTERACAO: TDateField;
    dsetordemservico: TIBDataSet;
    dsetordemservicoID_OS: TIntegerField;
    dsetordemservicoDATA_EMISSAO: TDateField;
    dsetordemservicoHORA: TTimeField;
    dsetordemservicoID_USUARIO: TIntegerField;
    dsetordemservicoSTATUS: TIBStringField;
    dsetordemservicoID_CLIENTE: TIntegerField;
    dsetordemservicoOBS: TIBStringField;
    dsetordemservicoTOTAL_PRODUTOS: TIBBCDField;
    dsetordemservicoTOTAL_SERVICOS: TIBBCDField;
    dsetordemservicoOUTRAS_DESPESAS: TIBBCDField;
    dsetordemservicoDESCONTO: TIBBCDField;
    dsetordemservicoTOTAL_OS: TIBBCDField;
    dsetordemservicoDATA_CADASTRO: TDateField;
    dsetordemservicoULTIMA_ALTERACAO: TDateField;
    dsetordemservicoID_COR: TIntegerField;
    dsetordemservicoID_MODELO: TIntegerField;
    dsetordemservicoANO_VEICULO: TIBStringField;
    dsetordemservicoPLACA_VEICULO: TIBStringField;
    dsetordemservicoID_CONDICAO: TIntegerField;
    dsetordemservicoPROBLEMA_VEICULO: TIBStringField;
    dsetfornecedor: TIBDataSet;
    dsetfornecedorID_FORNECEDOR: TIntegerField;
    dsetfornecedorRAZAO: TIBStringField;
    dsetfornecedorTIPO_FORNECEDOR: TIBStringField;
    dsetfornecedorSTATUS: TIBStringField;
    dsetfornecedorFANTASIA: TIBStringField;
    dsetfornecedorCNPJ: TIBStringField;
    dsetfornecedorINSC_ESTADUAL: TIBStringField;
    dsetfornecedorCELULAR: TIBStringField;
    dsetfornecedorTELEFONE: TIBStringField;
    dsetfornecedorENDERECO: TIBStringField;
    dsetfornecedorNUMERO: TIntegerField;
    dsetfornecedorBAIRRO: TIBStringField;
    dsetfornecedorID_CIDADE: TIntegerField;
    dsetfornecedorID_CONDICAO: TIntegerField;
    dsetfornecedorDATA_CADASTRO: TDateField;
    dsetfornecedorULTIMA_ALTERACAO: TDateField;
    dsetvenda_produto: TIBDataSet;
    dsetvenda_produtoNUMERO_NOTA: TIntegerField;
    dsetvenda_produtoSERIE: TIBStringField;
    dsetvenda_produtoMODELO: TIBStringField;
    dsetvenda_produtoSTATUS: TIBStringField;
    dsetvenda_produtoDATA_VENDA: TDateField;
    dsetvenda_produtoHORA_VENDA: TTimeField;
    dsetvenda_produtoDATA_EMISSAO: TDateField;
    dsetvenda_produtoID_CLIENTE: TIntegerField;
    dsetvenda_produtoID_CONDICAO: TIntegerField;
    dsetvenda_produtoDATA_CANCELAMENTO: TDateField;
    dsetvenda_produtoHORA_CANCELAMENTO: TTimeField;
    dsetvenda_produtoTOTAL_PRODUTOS: TIBBCDField;
    dsetvenda_produtoTOTAL_DESCONTO: TIBBCDField;
    dsetvenda_produtoTOTAL_VENDA: TIBBCDField;
    dsetvenda_produtoID_USUARIO_CANCELAMENTO: TIntegerField;
    dsetvenda_servico: TIBDataSet;
    dsvenda_servico: TDataSource;
    dsetvenda_servicoNUMERO_NOTA: TIntegerField;
    dsetvenda_servicoDATA_VENDA: TDateField;
    dsetvenda_servicoDATA_EMISSAO: TDateField;
    dsetvenda_servicoHORA_VENDA: TTimeField;
    dsetvenda_servicoID_CLIENTE: TIntegerField;
    dsetvenda_servicoID_CONDICAO: TIntegerField;
    dsetvenda_servicoDATA_CANCELAMENTO: TDateField;
    dsetvenda_servicoHORA_CANCELAMENTO: TTimeField;
    dsetvenda_servicoID_USUARIO_CANCELAMENTO: TIntegerField;
    dsetvenda_servicoTOTAL_SERVICOS: TIBBCDField;
    dsetvenda_servicoTOTAL_VENDA: TIBBCDField;
    dsetvenda_servicoTOTAL_DESCONTO: TIBBCDField;
    dsetvenda_servicoSERIE: TIBStringField;
    dsetvenda_servicoMODELO: TIBStringField;
    dsetvenda_servicoSTATUS: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

end.
