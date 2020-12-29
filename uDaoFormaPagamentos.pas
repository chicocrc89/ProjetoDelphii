unit uDaoFormaPagamentos;

interface

uses udao, uDM, DB, uformapagamentos, SysUtils;

type
  Daoformapagamentos = class(dao)
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

{ Daoformapagamentos }

function Daoformapagamentos.Carregar(pObj: TObject): string;
var
  mformapagamentos: formapagamentos;
begin
  mformapagamentos := formapagamentos(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetformapag.Active then
    umdm.dsetformapag.Open;
  mformapagamentos.setCodigo(umdm.dsetformapagID_FORMAPAGAMENTO.Value);
  mformapagamentos.setpagamento(umdm.dsetformapagFORMA_PAGAMENTO.Value);
end;

constructor Daoformapagamentos.CrieObj;
begin

end;

destructor Daoformapagamentos.Destrua_se;
begin

end;

function Daoformapagamentos.Excluir(pObj: TObject): string;
begin
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetformapag.Active then
    umdm.dsetformapag.Open;
  umdm.dsetformapag.Delete;
  umdm.trans.Commit;
end;

function Daoformapagamentos.getds: Tdatasource;
begin
  result := umdm.dsformapagamento;
end;

function Daoformapagamentos.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from forma_pagamento order by forma_pagamento'
  else if ehnumero(pChave) then
    mSQL := 'select * from forma_pagamento where id_formapagamento =' +
      QuotedStr(pChave)
  else
    mSQL := 'select * from forma_pagamento where forma_pagamento =' +
      QuotedStr(pChave);
  umdm.dsetformapag.Active := false;
  umdm.dsetformapag.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetformapag.Active then
    umdm.dsetformapag.Open;
  result := '';
end;

function Daoformapagamentos.Salvar(pObj: TObject): string;
var
  mformapagamentos: formapagamentos;
begin
  mformapagamentos := formapagamentos(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetformapag.Active then
    umdm.dsetformapag.Open;
  if mformapagamentos.getcodigo = 0 then
    umdm.dsetformapag.Insert
  else
    umdm.dsetformapag.Edit;
  umdm.dsetformapagID_FORMAPAGAMENTO.Value := mformapagamentos.getcodigo;
  umdm.dsetformapagFORMA_PAGAMENTO.Value := mformapagamentos.getpagamento;
  umdm.dsetformapag.Post;
  umdm.trans.Commit;
end;

procedure Daoformapagamentos.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

end.
