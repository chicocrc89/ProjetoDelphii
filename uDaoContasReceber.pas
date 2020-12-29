unit uDaoContasReceber;

interface

uses udao, uContasReceber, uDM, DB, uDaoClientes, uDaoFormaPagamentos, SysUtils;

type
  DaoContasReceber = class(dao)
  private

  protected
    umdm: TDM;
    umadaoCliente: DaoClientes;
    umadaoformapagamento : DaoFormaPagamentos;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
    procedure setdaoformapagamento(pObj: TObject);
    procedure setdaoCliente (pObj : TObject);
  end;

implementation

{ DaoContasReceber }

function DaoContasReceber.Carregar(pObj: TObject): string;
var
  mContasReceber: ContasReceber;
begin
  mContasReceber := ContasReceber(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetContasReceber.Active then
    umdm.dsetContasReceber.Open;
  mContasReceber.Setnumero_nota( umdm.dsetContasReceberNUMERO_NOTA.Value);
  mContasReceber.Setserie(umdm.dsetContasReceberSERIE.Value);
  mContasReceber.setmodelo(umdm.dsetContasReceberMODELO.Value);
  mContasReceber.getumCliente.setCodigo(umdm.dsetContasReceberID_Cliente.Value);
  mContasReceber.setdata_emissao(umdm.dsetContasReceberDATA_EMISSAO.Value);
  mContasReceber.setnumero_parcela(umdm.dsetContasReceberNUMERO_PARCELA.Value);
  mContasReceber.setvalor_parcela(umdm.dsetContasReceberVALOR_PARCELA.Value);
  mContasReceber.setdata_vencimento(umdm.dsetContasReceberDATA_VENCIMENTO.Value);
  mContasReceber.setdata_pagamento(umdm.dsetContasReceberDATA_PAGAMENTO.Value);
  mContasReceber.setjuros(umdm.dsetContasReceberJUROS.Value);
  mContasReceber.setmulta(umdm.dsetContasReceberMULTA.Value);
  mContasReceber.setdesconto(umdm.dsetContasReceberDESCONTO.Value);
  mContasReceber.setvalor_pago(umdm.dsetContasReceberVALOR_PAGO.Value);
  mContasReceber.getumaformapagamento.setCodigo(umdm.dsetContasReceberID_FORMAPAGAMENTO.Value);
  mContasReceber.setCadastro(umdm.dsetContasReceberDATA_CADASTRO.Value);
  mContasReceber.setUlt_Alt(umdm.dsetContasReceberULTIMA_ALTERACAO.Value);
end;

constructor DaoContasReceber.CrieObj;
begin
  umadaoformapagamento := DaoFormaPagamentos.CrieObj;
  umadaoCliente := DaoClientes.CrieObj;
end;

destructor DaoContasReceber.Destrua_se;
begin
  umadaoformapagamento.Destrua_se;
  umadaoCliente.Destrua_se;
end;

function DaoContasReceber.Excluir(pObj: TObject): string;
begin
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetContasReceber.Active then
    umdm.dsetContasReceber.Open;
  umdm.dsetContasReceber.Delete;
  umdm.trans.Commit;
end;

function DaoContasReceber.getds: Tdatasource;
begin
  result := umdm.dsContasReceber;
end;

function DaoContasReceber.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from contas_receber'
  else if ehnumero(pChave) then
    mSQL := 'select * from contas_receber where numero_nota =' + QuotedStr(pChave)
  else
    mSQL := 'select * from contas_receber where razao =' + QuotedStr(pChave);
  umdm.dsetContasReceber.Active := false;
  umdm.dsetContasReceber.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetContasReceber.Active then
    umdm.dsetContasReceber.Open;
  result := '';
end;

function DaoContasReceber.Salvar(pObj: TObject): string;
var
  mContasReceber: ContasReceber;
  mdata : Tdate;
begin
  mContasReceber := ContasReceber(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetContasReceber.Active then
    umdm.dsetContasReceber.Open;
  if mContasReceber.getCodigo = 0 then
    umdm.dsetContasReceber.Insert
  else
  begin
    mdata := now;
    umdm.dsetContasReceber.Edit;
  end;
  umdm.dsetContasReceberNUMERO_NOTA.Value := mContasReceber.getnumero_nota;
  umdm.dsetContasReceberSERIE.Value := mContasReceber.getserie;
  umdm.dsetContasReceberMODELO.Value := mContasReceber.getmodelo;
  umdm.dsetContasReceberID_Cliente.Value := mContasReceber.getumCliente.getCodigo;
  umdm.dsetContasReceberDATA_EMISSAO.Value := mContasReceber.getdata_emissao;
  umdm.dsetContasReceberNUMERO_PARCELA.Value := mContasReceber.getnumero_parcela;
  umdm.dsetContasReceberVALOR_PARCELA.Value := mContasReceber.getvalor_parcela;
  umdm.dsetContasReceberDATA_VENCIMENTO.Value := mContasReceber.getdata_vencimento;
  umdm.dsetContasReceberDATA_PAGAMENTO.Value := mContasReceber.getdata_pagamento;
  umdm.dsetContasReceberJUROS.Value := mContasReceber.getjuros;
  umdm.dsetContasReceberMULTA.Value := mContasReceber.getmulta;
  umdm.dsetContasReceberVALOR_PAGO.Value := mContasReceber.getvalor_pago;
  umdm.dsetContasReceberID_FORMAPAGAMENTO.Value := mContasReceber.getumaformapagamento.getCodigo;
  umdm.dsetContasReceberULTIMA_ALTERACAO.Value := mdata;
  umdm.dsetContasReceberDATA_CADASTRO.Value := mContasReceber.getCadastro;
  umdm.dsetContasReceberDESCONTO.Value := mContasReceber.getdesconto;
  umdm.dsetContasReceber.Post;
  umdm.trans.Commit;
end;

procedure DaoContasReceber.setdaoformapagamento(pObj: TObject);
begin
  umadaoformapagamento := DaoFormaPagamentos(pObj);
end;


procedure DaoContasReceber.setdaoCliente(pObj: TObject);
begin
  umadaoCliente := DaoClientes (pObj);
end;

procedure DaoContasReceber.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

end.
