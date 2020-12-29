unit uDaoFabricantes;

interface

uses udao, uDM, DB, ufabricantes, SysUtils;

type
  Daofabricantes = class(dao)
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

{ Daofabricantes }

function Daofabricantes.Carregar(pObj: TObject): string;
var
  mfabricantes: fabricantes;
begin
  mfabricantes := fabricantes(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetfabricante.Active then
    umdm.dsetfabricante.Open;
  mfabricantes.setCodigo(umdm.dsetfabricanteID_FABRICANTE.Value);
  mfabricantes.setfabricante(umdm.dsetfabricanteFABRICANTE.Value);
  mfabricantes.setcnpj(umdm.dsetfabricanteCNPJ.Value);
end;

constructor Daofabricantes.CrieObj;
begin

end;

destructor Daofabricantes.Destrua_se;
begin

end;

function Daofabricantes.Excluir(pObj: TObject): string;
begin
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetfabricante.Active then
    umdm.dsetfabricante.Open;
  umdm.dsetfabricante.Delete;
  umdm.trans.Commit;
end;

function Daofabricantes.getds: Tdatasource;
begin
  result := umdm.dsfabricante;
end;

function Daofabricantes.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from fabricante order by fabricante'
  else if ehnumero(pChave) then
    mSQL := 'select * from fabricante where id_fabricante =' + QuotedStr(pChave)
  else
    mSQL := 'select * from fabricante where fabricante =' + QuotedStr(pChave);
  umdm.dsetfabricante.Active := false;
  umdm.dsetfabricante.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetfabricante.Active then
    umdm.dsetfabricante.Open;
  result := '';
end;

function Daofabricantes.Salvar(pObj: TObject): string;
var
  mfabricantes: fabricantes;
begin
  mfabricantes := fabricantes(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetfabricante.Active then
    umdm.dsetfabricante.Open;
  if mfabricantes.getcodigo = 0 then
    umdm.dsetfabricante.Insert
  else
  umdm.dsetfabricante.Edit;
  umdm.dsetfabricanteID_FABRICANTE.Value := mfabricantes.getcodigo;
  umdm.dsetfabricanteFABRICANTE.Value := mfabricantes.getfabricante;
  umdm.dsetfabricanteCNPJ.Value := mfabricantes.getcnpj;
  umdm.dsetfabricante.Post;
  umdm.trans.Commit;
end;

procedure Daofabricantes.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

end.
