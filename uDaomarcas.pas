unit uDaomarcas;

interface

uses udao, uDM, DB, umarcas, SysUtils;

type
  Daomarcas = class(dao)
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

{ Daomarcas }

function Daomarcas.Carregar(pObj: TObject): string;
var
  mmarcas: marcas;
begin
  mmarcas := marcas(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetpais.Active then
    umdm.dsetpais.Open;
  mmarcas.setCodigo(umdm.dsetmarcaID_MARCA.Value);
  mmarcas.setmarca(umdm.dsetmarcaMARCA.Value);
end;

constructor Daomarcas.CrieObj;
begin

end;

destructor Daomarcas.Destrua_se;
begin

end;

function Daomarcas.Excluir(pObj: TObject): string;
begin
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.DSetmarca.Active then
    umdm.DSetmarca.Open;
  umdm.DSetmarca.Delete;
  umdm.trans.Commit;
end;

function Daomarcas.getds: Tdatasource;
begin
  result := umdm.dsmarca;
end;

function Daomarcas.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from marca order by marca'
  else if ehnumero(pChave) then
    mSQL := 'select * from marca where id_marca =' + QuotedStr(pChave)
  else
    mSQL := 'select * from marca where marca =' + QuotedStr(pChave);
  umdm.DSetmarca.Active := false;
  umdm.DSetmarca.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.DSetmarca.Active then
    umdm.DSetmarca.Open;
  result := '';
end;

function Daomarcas.Salvar(pObj: TObject): string;
var
  mmarcas: marcas;
begin
  mmarcas := marcas(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.DSetmarca.Active then
    umdm.DSetmarca.Open;
  if mmarcas.getcodigo = 0 then
    umdm.DSetmarca.Insert
  else
    umdm.DSetmarca.Edit;
  umdm.dsetmarcaID_MARCA.Value := mmarcas.getcodigo;
  umdm.dsetmarcaMARCA.Value := mmarcas.getmarca;
  umdm.DSetmarca.Post;
  umdm.trans.Commit;
end;

procedure Daomarcas.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

end.
