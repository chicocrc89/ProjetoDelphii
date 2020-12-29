unit uDaocombustiveis;

interface

uses udao, uDM, DB, ucombustiveis, SysUtils;

type
  Daocombustiveis = class(dao)
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

{ Daocombustiveis }

function Daocombustiveis.Carregar(pObj: TObject): string;
var
  mcombustiveis: combustiveis;
begin
  mcombustiveis := combustiveis(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcombustivel.Active then
    umdm.dsetcombustivel.Open;
  mcombustiveis.setCodigo(umdm.dsetcombustivelID_combustivel.Value);
  mcombustiveis.setcombustivel(umdm.dsetcombustivelcombustivel.Value);
  mcombustiveis.setCadastro(umdm.dsetcombustivelDATA_CADASTRO.Value);
  mcombustiveis.setUlt_Alt(umdm.dsetcombustivelULTIMA_ALTERACAO.Value);

end;

constructor Daocombustiveis.CrieObj;
begin

end;

destructor Daocombustiveis.Destrua_se;
begin

end;

function Daocombustiveis.Excluir(pObj: TObject): string;
begin
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcombustivel.Active then
    umdm.dsetcombustivel.Open;
  umdm.dsetcombustivel.Delete;
  umdm.trans.Commit;
end;

function Daocombustiveis.getds: Tdatasource;
begin
  result := umdm.dscombustivel;
end;

function Daocombustiveis.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from combustivel order by combustivel'
  else if ehnumero(pChave) then
    mSQL := 'select * from combustivel where id_combustivel =' + QuotedStr(pChave)
  else
    mSQL := 'select * from combustivel where combustivel =' + QuotedStr(pChave);
  umdm.dsetcombustivel.Active := false;
  umdm.dsetcombustivel.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcombustivel.Active then
    umdm.dsetcombustivel.Open;
  result := '';
end;

function Daocombustiveis.Salvar(pObj: TObject): string;
var
  mcombustiveis: combustiveis;
  mdata : Tdate;
begin
  mcombustiveis := combustiveis(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcombustivel.Active then
    umdm.dsetcombustivel.Open;
  if mcombustiveis.getcodigo = 0 then
    umdm.dsetcombustivel.Insert
  else
  begin
    mdata := now;
    umdm.dsetcombustivel.Edit;
  end;
    umdm.dsetcombustivelID_combustivel.Value := mcombustiveis.getcodigo;
    umdm.dsetcombustivelcombustivel.Value := mcombustiveis.getcombustivel;
    umdm.dsetcombustivelULTIMA_ALTERACAO.Value := mdata;
    umdm.dsetcombustivelDATA_CADASTRO.Value := mcombustiveis.getCadastro;
    umdm.dsetcombustivel.Post;
    umdm.trans.Commit;
end;

procedure Daocombustiveis.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

end.
