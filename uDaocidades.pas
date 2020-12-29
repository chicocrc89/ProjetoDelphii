unit uDaocidades;

interface

uses udao, uCidades, uDM, DB, uDaoEstados, SysUtils;

type
  Daocidades = class(dao)
  private

  protected
    umdm: TDM;
    umadaoestado: DaoEstados;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    function Buscar(pChave: string): string;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
    procedure setdaoestado(pObj: TObject);
  end;

implementation

{ Daocidades }

function Daocidades.Buscar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from  cidade order by cidade'
  else if ehnumero(pChave) then
    mSQL := 'select * from CIDADE where id_cidade =' + QuotedStr(pChave)
  else
    mSQL := 'select * from CIDADE where cidade =' + QuotedStr(pChave);
  umdm.dsetcidade.Active := false;
  umdm.dsetcidade.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcidade.Active then
    umdm.dsetcidade.Open;
  result := 'kkkk';

end;

function Daocidades.Carregar(pObj: TObject): string;
var
  mcidades: Cidades;
begin
  mcidades := Cidades(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.view_cidade.Active then
    umdm.dsetcidade.Open;
  mcidades.setCodigo(umdm.view_cidadeID_CIDADE.Value);
  mcidades.setcidade(umdm.view_cidadeCIDADE01.Value);
  mcidades.setDDD(umdm.view_cidadeDDD.Value);
  mcidades.getumestado.setCodigo(umdm.view_cidadeID_ESTADO.Value);
  mcidades.setCadastro(umdm.view_cidadeDATA_CADASTRO.Value);
  mcidades.setUlt_Alt(umdm.view_cidadeULTIMA_ALTERACAO.Value);
end;

constructor Daocidades.CrieObj;
begin
  umadaoestado := DaoEstados.CrieObj;
end;

destructor Daocidades.Destrua_se;
begin
  umadaoestado.Destrua_se;
end;

function Daocidades.Excluir(pObj: TObject): string;
var mcidades: Cidades;
begin
  mcidades := Cidades(pObj);
  buscar(inttostr(mcidades.getCodigo));
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcidade.Active then
    umdm.dsetcidade.Open;
  umdm.dsetcidade.Delete;
  umdm.trans.Commit;
end;

function Daocidades.getds: Tdatasource;
begin
  result := umdm.dscidade;
end;

function Daocidades.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from  DADOS_CIDADE order by cidade01'
  else if ehnumero(pChave) then
    mSQL := 'select * from  DADOS_CIDADE where id_cidade =' + QuotedStr(pChave)
  else
    mSQL := 'select * from  DADOS_CIDADE where cidade01 =' + QuotedStr(pChave);
  umdm.view_cidade.Active := false;
  umdm.view_cidade.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.view_cidade.Active then
    umdm.view_cidade.Open;
  result := 'kkkk';
end;

function Daocidades.Salvar(pObj: TObject): string;
var
  mcidades: Cidades;
  mdata : Tdate;
begin
  mcidades := Cidades(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcidade.Active then
    umdm.dsetcidade.Open;
  if mcidades.getcodigo = 0 then
    umdm.dsetcidade.Insert
  else
  begin

    mdata := now;
    buscar(inttostr(mcidades.getCodigo));
    umdm.dsetcidade.Edit;

  end;
  umdm.dsetcidadeID_CIDADE.Value := mcidades.getcodigo;
  umdm.dsetcidadeCIDADE.Value := mcidades.getcidade;
  umdm.dsetcidadeDDD.Value := mcidades.getDDD;
  umdm.dsetcidadeID_ESTADO.Value := mcidades.getumestado.getcodigo;
  umdm.dsetcidadeULTIMA_ALTERACAO.Value := mdata;
  umdm.dsetcidadeDATA_CADASTRO.Value := mcidades.getCadastro;
  umdm.dsetcidade.Post;
  umdm.trans.Commit;
end;

procedure Daocidades.setdaoestado(pObj: TObject);
begin
  umadaoestado := DaoEstados(pObj);
end;

procedure Daocidades.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

end.
