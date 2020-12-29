unit uDaoGrupos;

interface

uses udao, uDM, DB, ugrupos, SysUtils;

type
  Daogrupos = class(dao)
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

{ Daogrupos }

function Daogrupos.Carregar(pObj: TObject): string;
var
  mgrupos: grupos;
begin
  mgrupos := grupos(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetgrupo.Active then
    umdm.dsetgrupo.Open;
  mgrupos.setCodigo(umdm.dsetgrupoID_GRUPO.Value);
  mgrupos.setgrupo(umdm.dsetgrupoGRUPO.Value);

end;

constructor Daogrupos.CrieObj;
begin

end;

destructor Daogrupos.Destrua_se;
begin

end;

function Daogrupos.Excluir(pObj: TObject): string;
begin
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetgrupo.Active then
    umdm.dsetgrupo.Open;
  umdm.dsetgrupo.Delete;
  umdm.trans.Commit;
end;

function Daogrupos.getds: Tdatasource;
begin
  result := umdm.dsgrupo;
end;

function Daogrupos.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from grupo order by grupo'
  else if ehnumero(pChave) then
    mSQL := 'select * from grupo where id_grupo =' + QuotedStr(pChave)
  else
    mSQL := 'select * from grupo where grupo =' + QuotedStr(pChave);
  umdm.dsetgrupo.Active := false;
  umdm.dsetgrupo.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetgrupo.Active then
    umdm.dsetgrupo.Open;
  result := '';
end;

function Daogrupos.Salvar(pObj: TObject): string;
var
  mgrupos: grupos;
begin
  mgrupos := grupos(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetgrupo.Active then
    umdm.dsetgrupo.Open;
  if mgrupos.getcodigo = 0 then
    umdm.dsetgrupo.Insert
  else
  umdm.dsetgrupo.Edit;
  umdm.dsetgrupoID_GRUPO.Value := mgrupos.getcodigo;
  umdm.dsetgrupoGRUPO.Value := mgrupos.getgrupo;
  umdm.dsetgrupo.Post;
  umdm.trans.Commit;
end;

procedure Daogrupos.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

end.
