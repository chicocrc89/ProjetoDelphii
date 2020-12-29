unit uDaoModelos;

interface

uses udao, umodelos, uDM, DB, uDaoMarcas, SysUtils;

type
  Daomodelos = class(dao)
  private

  protected
    umdm: TDM;
    umadaomarca: DaoMarcas;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
    procedure setdaomarca(pObj: TObject);
  end;

implementation

{ Daomodelos }

function Daomodelos.Carregar(pObj: TObject): string;
var
  mmodelos: modelos;
begin
  mmodelos := modelos(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcidade.Active then
    umdm.dsetcidade.Open;
  mmodelos.setCodigo(umdm.dsetmodeloID_MODELO.Value);
  mmodelos.setmodelo(umdm.dsetmodeloMODELO.Value);
  mmodelos.getumamarca.setcodigo(umdm.dsetmodeloID_MARCA.Value);
end;

constructor Daomodelos.CrieObj;
begin
  umadaomarca := DaoMarcas.CrieObj;
end;

destructor Daomodelos.Destrua_se;
begin
  umadaomarca.Destrua_se;
end;

function Daomodelos.Excluir(pObj: TObject): string;
begin
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetmodelo.Active then
    umdm.dsetmodelo.Open;
  umdm.dsetmodelo.Delete;
  umdm.trans.Commit;
end;

function Daomodelos.getds: Tdatasource;
begin
  result := umdm.dsmodelo;
end;

function Daomodelos.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from modelo order by modelo'
  else if ehnumero(pChave) then
    mSQL := 'select * from modelo where id_modelo =' + QuotedStr(pChave)
  else
    mSQL := 'select * from modelo where modelo =' + QuotedStr(pChave);
  umdm.dsetmodelo.Active := false;
  umdm.dsetmodelo.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetmodelo.Active then
    umdm.dsetmodelo.Open;
  result := '';
end;

function Daomodelos.Salvar(pObj: TObject): string;
var
  mmodelos: modelos;
begin
  mmodelos := modelos(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetmodelo.Active then
    umdm.dsetmodelo.Open;
  if mmodelos.getcodigo = 0 then
    umdm.dsetmodelo.Insert
  else
    umdm.dsetmodelo.Edit;
  umdm.dsetmodeloID_MODELO.Value := mmodelos.getcodigo;
  umdm.dsetmodeloMODELO.Value := mmodelos.getmodelo;
  umdm.dsetmodeloID_MARCA.Value := mmodelos.getumamarca.getcodigo;
  umdm.dsetmodelo.Post;
  umdm.trans.Commit;

end;

procedure Daomodelos.setdaomarca(pObj: TObject);
begin
  umadaomarca := DaoMarcas(pObj);
end;

procedure Daomodelos.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

end.
