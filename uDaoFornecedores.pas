unit uDaofornecedores;

interface

uses udao, ufornecedores, uDM, DB, uDaoCidades, uDaoCondicoes, SysUtils;

type
  Daofornecedores = class(dao)
  private

  protected
    umdm: TDM;
    umadaocidade: DaoCidades;
    umadaocondicao : DaoCondicoes;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
    procedure setdaocidade(pObj: TObject);
    procedure setdaocondicao (pObj : TObject);
    function valida_fornecedor (pObj : TObject): boolean;
  end;

implementation

{ Daofornecedores }

function Daofornecedores.Carregar(pObj: TObject): string;
var
  mfornecedores: fornecedores;
begin
  mfornecedores := fornecedores(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetfornecedor.Active then
    umdm.dsetfornecedor.Open;
  mfornecedores.setCodigo(umdm.dsetfornecedorID_fornecedor.Value);
  mfornecedores.setrazao(umdm.dsetfornecedorRAZAO.Value);
  mfornecedores.setcnpj(umdm.dsetfornecedorCNPJ.Value);
  mfornecedores.settp_fornecedor(umdm.dsetfornecedorTIPO_FORNECEDOR.Value);
  mfornecedores.setinsc_est(umdm.dsetfornecedorINSC_ESTADUAL.Value);
  mfornecedores.setnome_fantasia(umdm.dsetfornecedorFANTASIA.Value);
  mfornecedores.settel_comercial(umdm.dsetfornecedorTELEFONE.Value);
  mfornecedores.setcelular(umdm.dsetfornecedorCELULAR.Value);
  mfornecedores.setendereco(umdm.dsetfornecedorENDERECO.Value);
  mfornecedores.setnumero(umdm.dsetfornecedorNUMERO.Value);
  mfornecedores.setbairro(umdm.dsetfornecedorBAIRRO.Value);
  mfornecedores.setstatus(umdm.dsetfornecedorSTATUS.Value);
  mfornecedores.getumacidade.setCodigo(umdm.dsetfornecedorID_CIDADE.Value);
  mfornecedores.getumacondicao.setCodigo(umdm.dsetfornecedorID_CONDICAO.Value);
  mfornecedores.setCadastro(umdm.dsetfornecedorDATA_CADASTRO.Value);
  mfornecedores.setUlt_Alt(umdm.dsetfornecedorULTIMA_ALTERACAO.Value);
end;

constructor Daofornecedores.CrieObj;
begin
  umadaocidade := DaoCidades.CrieObj;
  umadaocondicao := DaoCondicoes.CrieObj;
end;

destructor Daofornecedores.Destrua_se;
begin
  umadaocidade.Destrua_se;
  umadaocondicao.Destrua_se;
end;

function Daofornecedores.Excluir(pObj: TObject): string;
begin
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetfornecedor.Active then
    umdm.dsetfornecedor.Open;
  umdm.dsetfornecedor.Delete;
  umdm.trans.Commit;
end;

function Daofornecedores.getds: Tdatasource;
begin
  result := umdm.dsfornecedor;
end;

function Daofornecedores.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from fornecedor'
  else if ehnumero(pChave) then
    mSQL := 'select * from fornecedor where id_fornecedor =' + QuotedStr(pChave)
  else
    mSQL := 'select * from fornecedor where razao =' + QuotedStr(pChave);
  umdm.dsetfornecedor.Active := false;
  umdm.dsetfornecedor.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetfornecedor.Active then
    umdm.dsetfornecedor.Open;
  result := '';
end;

function Daofornecedores.Salvar(pObj: TObject): string;
var
  mfornecedores: fornecedores;
  mdata : Tdate;
begin
  mfornecedores := fornecedores(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetfornecedor.Active then
    umdm.dsetfornecedor.Open;
  if mfornecedores.getcodigo = 0 then
    umdm.dsetfornecedor.Insert
  else
  begin
    mdata := now;
    umdm.dsetfornecedor.Edit;
  end;

  umdm.dsetfornecedorID_fornecedor.Value := mfornecedores.getcodigo;
  umdm.dsetfornecedorRAZAO.Value := mfornecedores.getrazao;
  umdm.dsetfornecedorCNPJ.Value := mfornecedores.getcnpj;
  umdm.dsetfornecedorTIPO_FORNECEDOR.Value := mfornecedores.gettp_fornecedor;
  umdm.dsetfornecedorINSC_ESTADUAL.Value := mfornecedores.getinsc_est;
  umdm.dsetfornecedorFANTASIA.Value := mfornecedores.getnome_fantasia;
  umdm.dsetfornecedorTELEFONE.Value := mfornecedores.gettel_comercial;
  umdm.dsetfornecedorCELULAR.Value := mfornecedores.getceular;
  umdm.dsetfornecedorENDERECO.Value := mfornecedores.getendereco;
  umdm.dsetfornecedorNUMERO.Value := mfornecedores.getnumero;
  umdm.dsetfornecedorBAIRRO.Value := mfornecedores.getbairro;
  umdm.dsetfornecedorSTATUS.Value := mfornecedores.getstatus;
  umdm.dsetfornecedorID_CIDADE.Value := mfornecedores.getumacidade.getCodigo;
  umdm.dsetfornecedorID_CONDICAO.Value := mfornecedores.getumacondicao.getCodigo;
  umdm.dsetfornecedorULTIMA_ALTERACAO.Value := mdata;
  umdm.dsetfornecedorDATA_CADASTRO.Value := mfornecedores.getCadastro;
  umdm.dsetfornecedor.Post;
  umdm.trans.Commit;
end;

procedure Daofornecedores.setdaocidade(pObj: TObject);
begin
  umadaocidade := DaoCidades(pObj);
end;


procedure Daofornecedores.setdaocondicao(pObj: TObject);
begin
  umadaocondicao := DaoCondicoes (pObj);
end;

procedure Daofornecedores.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

function Daofornecedores.valida_fornecedor(pObj: TObject): boolean;
var
mcpf : string;
mfornecedores : Fornecedores;
mSQL : string;
begin
  mfornecedores := Fornecedores(pObj);
  mcpf := mfornecedores.getcnpj;
  mSQL := 'select * from fornecedor where CNPJ =' + QuotedStr(mcpf);
  umdm.dsetfornecedor.Active := false;
  umdm.dsetfornecedor.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetfornecedor.Active then
    umdm.dsetfornecedor.Open;
  if umdm.dsetfornecedor.RecordCount = 0  then
    result := true
  else
    result := false;
  umdm.dsetfornecedor.Active := false;
end;

end.
