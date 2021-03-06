unit uDaoServicos;

interface

uses udao, uservicos, uDM, DB, uDaoFabricantes, uDaoFornecedores,uDaoGrupos, SysUtils;

type
  Daoservicos = class(dao)
  private

  protected
    umdm: TDM;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
  end;

implementation

{ Daoservicos }

function Daoservicos.Carregar(pObj: TObject): string;
var
  mservicos: servicos;
begin
  mservicos := servicos(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetservico.Active then
    umdm.dsetservico.Open;
  mservicos.setCodigo(umdm.dsetservicoID_SERVICO.Value);
  mservicos.setdescricao(umdm.dsetservicoDESCRICAO.Value);
  mservicos.setcusto(umdm.dsetservicoCUSTO.Value);
  mservicos.setpreco_venda(umdm.dsetservicoPRECO_VENDA.Value);
  mservicos.setobs(umdm.dsetservicoOBS.Value);
  mservicos.setCadastro(umdm.dsetservicoDATA_CADASTRO.Value);
  mservicos.setUlt_Alt(umdm.dsetservicoULTIMA_ALTERACAO.Value);
end;

constructor Daoservicos.CrieObj;
begin

end;

destructor Daoservicos.Destrua_se;
begin

end;

function Daoservicos.Excluir(pObj: TObject): string;
begin
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetservico.Active then
    umdm.dsetservico.Open;
  umdm.dsetservico.Delete;
  umdm.trans.Commit;
end;

function Daoservicos.getds: Tdatasource;
begin
  result := umdm.dsservico;
end;

function Daoservicos.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from servico'
  else if ehnumero(pChave) then
    mSQL := 'select * from servico where id_servico =' + QuotedStr(pChave)
  else
    mSQL := 'select * from servico where servico =' + QuotedStr(pChave);
  umdm.dsetservico.Active := false;
  umdm.dsetservico.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetservico.Active then
    umdm.dsetservico.Open;
  result := '';
end;

function Daoservicos.Salvar(pObj: TObject): string;
var
  mservicos: servicos;
  mdata : Tdate;
begin
  mservicos := servicos(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetservico.Active then
    umdm.dsetservico.Open;
  if mservicos.getcodigo = 0 then
    umdm.dsetservico.Insert
  else
  begin
    mdata := now;
    umdm.dsetservico.Edit;
  end;
  umdm.dsetservicoID_servico.Value := mservicos.getCodigo;
  umdm.dsetservicoDESCRICAO.Value := mservicos.getdescricao;
  umdm.dsetservicoCUSTO.Value := mservicos.getcusto;
  umdm.dsetservicoPRECO_VENDA.Value := mservicos.getpreco_venda;
  umdm.dsetservicoOBS.Value := mservicos.getobs;
  umdm.dsetservicoDATA_CADASTRO.Value := mservicos.getCadastro;
  umdm.dsetservicoULTIMA_ALTERACAO.Value := mservicos.getUlt_Alt;
  umdm.dsetservico.Post;
  umdm.trans.Commit;
end;

procedure Daoservicos.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

end.
