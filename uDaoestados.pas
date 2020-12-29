unit uDaoestados;

interface

uses udao, uDM, DB, uDaoPaises, uEstados, uPaises, SysUtils;

type
  Daoestados = class(dao)
  private

  protected
    umadaopais: DaoPaises;
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
    procedure setdaopais(pObj: TObject);

  end;

implementation

{ Daoestados }

function Daoestados.Carregar(pObj: TObject): string;
var
  mestados: Estados;
begin
  mestados := Estados(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetestado.Active then
    umdm.dsetestado.Open;
  mestados.setCodigo(umdm.dsetestadoID_ESTADO.Value);
  mestados.setestado(umdm.dsetestadoESTADO.Value);
  mestados.setUF(umdm.dsetestadoUF.Value);
  mestados.getumpais.setCodigo(umdm.dsetestadoID_PAIS.Value);
  mestados.setCadastro(umdm.dsetestadoDATA_CADASTRO.Value);
  mestados.setUlt_Alt(umdm.dsetestadoULTIMA_ALTERACAO.Value);
end;

constructor Daoestados.CrieObj;
begin
  umadaopais := DaoPaises.CrieObj;
end;

destructor Daoestados.Destrua_se;
begin
  umadaopais.Destrua_se;
end;

function Daoestados.Excluir(pObj: TObject): string;
begin
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetestado.Active then
    umdm.dsetestado.Open;
  umdm.dsetestado.Delete;
  umdm.trans.Commit;
end;

function Daoestados.getds: Tdatasource;
begin
  result := umdm.dsestado;
end;

function Daoestados.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from estado order by estado'
  else if ehnumero(pChave) then
    mSQL := 'select * from estado where id_estado =' + QuotedStr(pChave)
  else
    mSQL := 'select * from estado where estado =' + QuotedStr(pChave);
  umdm.dsetestado.Active := false;
  umdm.dsetestado.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetestado.Active then
    umdm.dsetestado.Open;
  result := '';

end;

function Daoestados.Salvar(pObj: TObject): string;
var
  mestados: Estados;
begin
  mestados := Estados(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetestado.Active then
    umdm.dsetestado.Open;
  if mestados.getcodigo = 0 then
    umdm.dsetestado.Insert
  else
    umdm.dsetestado.Edit;
  umdm.dsetestadoID_ESTADO.Value := mestados.getcodigo;
  umdm.dsetestadoESTADO.Value := mestados.getestado;
  umdm.dsetestadoUF.Value := mestados.getUF;
  umdm.dsetestadoID_PAIS.Value := mestados.getumpais.getcodigo;
  umdm.dsetestadoULTIMA_ALTERACAO.Value := mestados.getCadastro;
  umdm.dsetestadoDATA_CADASTRO.Value := mestados.getUlt_Alt;
  umdm.dsetestado.Post;
  umdm.trans.Commit;
end;

procedure Daoestados.setdaopais(pObj: TObject);
begin
  umadaopais := DaoPaises(pObj);
end;

procedure Daoestados.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

end.
