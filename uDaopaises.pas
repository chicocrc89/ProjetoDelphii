unit uDaopaises;

interface

uses udao, uDM, DB, uPaises, SysUtils;

type
  Daopaises = class(dao)
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

{ Daopaises }

function Daopaises.Carregar(pObj: TObject): string;
var
  mpaises: Paises;
begin
  mpaises := Paises(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetpais.Active then
    umdm.dsetpais.Open;
  mpaises.setCodigo(umdm.dsetpaisID_PAIS.Value);
  mpaises.setpais(umdm.dsetpaisPAIS.Value);
  mpaises.setDDI(umdm.dsetpaisDDI.Value);
  mpaises.setsigra(umdm.dsetpaisSIGLA.Value);
  mpaises.setCadastro(umdm.dsetpaisDATA_CADASTRO.Value);
  mpaises.setUlt_Alt(umdm.dsetpaisULTIMA_ALTERACAO.Value);
end;

constructor Daopaises.CrieObj;
begin

end;

destructor Daopaises.Destrua_se;
begin

end;

function Daopaises.Excluir(pObj: TObject): string;
begin
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetpais.Active then
    umdm.dsetpais.Open;
  umdm.dsetpais.Delete;
  umdm.trans.Commit;
end;

function Daopaises.getds: Tdatasource;
begin
  result := umdm.dspais;
end;

function Daopaises.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from pais order by pais'
  else if ehnumero(pChave) then
    mSQL := 'select * from pais where id_pais =' + QuotedStr(pChave)
  else
    mSQL := 'select * from pais where pais like' + QuotedStr('%' + pChave + '%');
  umdm.dsetpais.Active := false;
  umdm.dsetpais.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetpais.Active then
    umdm.dsetpais.Open;
  result := '';
end;

function Daopaises.Salvar(pObj: TObject): string;
var
  mpaises: Paises;
begin
  mpaises := Paises(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetpais.Active then
    umdm.dsetpais.Open;
  if mpaises.getcodigo = 0 then
    umdm.dsetpais.Insert
  else
  umdm.dsetpais.Edit;
  umdm.dsetpaisID_PAIS.Value := mpaises.getcodigo;
  umdm.dsetpaisPAIS.Value := mpaises.getpais;
  umdm.dsetpaisDDI.Value := mpaises.getDDI;
  umdm.dsetpaisSIGLA.Value := mpaises.getsigla;
  umdm.dsetpaisDATA_CADASTRO.Value := mpaises.getCadastro;
  umdm.dsetpaisULTIMA_ALTERACAO.Value := mpaises.getUlt_Alt;
  umdm.dsetpais.Post;
  umdm.trans.Commit;
end;

procedure Daopaises.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

end.
