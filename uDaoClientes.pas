unit uDaoClientes;

interface

uses udao, uclientes, uDM, DB, uDaoCidades, uDaoCondicoes, SysUtils;

type
  Daoclientes = class(dao)
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
    function valida_cliente (pObj : TObject): boolean;
  end;

implementation

{ Daoclientes }

function Daoclientes.Carregar(pObj: TObject): string;
var
  mclientes: clientes;
begin
  mclientes := clientes(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcliente.Active then
    umdm.dsetcliente.Open;
  mclientes.setCodigo(umdm.dsetclienteID_CLIENTE.Value);
  mclientes.setnome(umdm.dsetclienteNOME.Value);
  mclientes.setdata_nasc(umdm.dsetclienteDATA_NASC.Value);
  mclientes.settpcliente(umdm.dsetclienteTPCLIENTE.Value);
  mclientes.setsexo(umdm.dsetclienteSEXO.Value);
  mclientes.setnacionalidade(umdm.dsetclienteNACIONALIDADE.Value);
  mclientes.setcnpj_cpf(umdm.dsetclienteCNPJ_CPF.Value);
  mclientes.setinscest_rg(umdm.dsetclienteINSCEST_RG.Value);
  mclientes.setemail(umdm.dsetclienteEMAIL.Value);
  mclientes.setlimite(umdm.dsetclienteLIMITE.Value);
  mclientes.setcelular(umdm.dsetclienteCELULAR.Value);
  mclientes.settelefone(umdm.dsetclienteTELEFONE.Value);
  mclientes.setponto_ref(umdm.dsetclientePONTO_REF.Value);
  mclientes.setendereco(umdm.dsetclienteENDERECO.Value);
  mclientes.setnumero(umdm.dsetclienteNUMERO.Value);
  mclientes.setbairro(umdm.dsetclienteBAIRRO.Value);
  mclientes.getumacidade.setCodigo(umdm.dsetclienteID_CIDADE.Value);
  mclientes.getumacondicao.setCodigo(umdm.dsetclienteID_CONDICAO.Value);
  mclientes.setstatus(umdm.dsetclienteSTATUS.Value);
  mclientes.setCadastro(umdm.dsetclienteDATA_CADASTRO.Value);
  mclientes.setUlt_Alt(umdm.dsetclienteULTIMA_ALTERACAO.Value);
end;

constructor Daoclientes.CrieObj;
begin
  umadaocidade := DaoCidades.CrieObj;
  umadaocondicao := DaoCondicoes.CrieObj;
end;

destructor Daoclientes.Destrua_se;
begin
  umadaocidade.Destrua_se;
  umadaocondicao.Destrua_se;
end;

function Daoclientes.Excluir(pObj: TObject): string;
begin
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcliente.Active then
    umdm.dsetcliente.Open;
  umdm.dsetcliente.Delete;
  umdm.trans.Commit;
end;

function Daoclientes.getds: Tdatasource;
begin
  result := umdm.dscliente;
end;

function Daoclientes.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from cliente'
  else if ehnumero(pChave) then
    mSQL := 'select * from cliente where id_cliente =' + QuotedStr(pChave)
  else
    mSQL := 'select * from cliente where nome =' + QuotedStr(pChave);
  umdm.dsetcliente.Active := false;
  umdm.dsetcliente.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcliente.Active then
    umdm.dsetcliente.Open;
  result := '';
end;

function Daoclientes.Salvar(pObj: TObject): string;
var
  mclientes: clientes;
  mdata : Tdate;
begin
  mclientes := clientes(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcliente.Active then
    umdm.dsetcliente.Open;
  if mclientes.getcodigo = 0 then
    umdm.dsetcliente.Insert
  else
  begin
    mdata := now;
    umdm.dsetcliente.Edit;
  end;

  umdm.dsetclienteID_CLIENTE.Value := mclientes.getcodigo;
  umdm.dsetclienteNOME.Value := mclientes.getnome;
  umdm.dsetclienteDATA_NASC.Value := mclientes.getdata_nasc;
  umdm.dsetclienteTPCLIENTE.Value := mclientes.gettpcliente;
  umdm.dsetclienteSEXO.Value := mclientes.getsexo;
  umdm.dsetclienteNACIONALIDADE.Value := mclientes.getnacionalidade;
  umdm.dsetclienteCNPJ_CPF.Value := mclientes.getcnpj_cpf;
  umdm.dsetclienteINSCEST_RG.Value := mclientes.getinscest_rg;
  umdm.dsetclienteEMAIL.Value := mclientes.getemail;
  umdm.dsetclienteLIMITE.Value := mclientes.getlimite;
  umdm.dsetclienteCELULAR.Value := mclientes.getcelular;
  umdm.dsetclienteTELEFONE.Value := mclientes.gettelefone;
  umdm.dsetclientePONTO_REF.Value := mclientes.getponto_ref;
  umdm.dsetclienteENDERECO.Value := mclientes.getendereco;
  umdm.dsetclienteNUMERO.Value := mclientes.getnumero;
  umdm.dsetclienteBAIRRO.Value := mclientes.getbairro;
  umdm.dsetclienteID_CIDADE.Value := mclientes.getumacidade.getcodigo;
  umdm.dsetclienteID_CONDICAO.Value := mclientes.getumacondicao.getCodigo;
  umdm.dsetclienteSTATUS.Value := mclientes.getstatus;
  umdm.dsetclienteULTIMA_ALTERACAO.Value := mdata;
  umdm.dsetclienteDATA_CADASTRO.Value := mclientes.getCadastro;
  umdm.dsetcliente.Post;
  umdm.trans.Commit;
end;

procedure Daoclientes.setdaocidade(pObj: TObject);
begin
  umadaocidade := DaoCidades(pObj);
end;


procedure Daoclientes.setdaocondicao(pObj: TObject);
begin
  umadaocondicao := DaoCondicoes (pObj);
end;

procedure Daoclientes.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

function Daoclientes.valida_cliente(pObj: TObject): boolean;
var
mcpf : string;
mclientes : Clientes;
mSQL : string;
begin
  mclientes := clientes(pObj);
  mcpf := mclientes.getcnpj_cpf;
  mSQL := 'select * from cliente where CNPJ_CPF =' + QuotedStr(mcpf);
  umdm.dsetcliente.Active := false;
  umdm.dsetcliente.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetcliente.Active then
    umdm.dsetcliente.Open;
  if umdm.dsetcliente.RecordCount = 0  then
    result := true
  else
    result := false;
  umdm.dsetcliente.Active := false;
end;

end.
