unit uDaoFuncionarios;

interface

uses udao, ufuncionarios, uDM, DB, uDaoCidades, SysUtils;

type
  Daofuncionarios = class(dao)
  private

  protected
    umdm: TDM;
    umadaocidade: DaoCidades;
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
  end;

implementation

{ Daofuncionarios }

function Daofuncionarios.Carregar(pObj: TObject): string;
var
  mfuncionarios: funcionarios;
begin
  mfuncionarios := funcionarios(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetfuncionario.Active then
    umdm.dsetfuncionario.Open;
  mfuncionarios.setCodigo(umdm.dsetfuncionarioID_FUNCIONARIO.Value);
  mfuncionarios.setnome(umdm.dsetfuncionarioNOME.Value);
  mfuncionarios.setcargo(umdm.dsetfuncionarioCARGO.Value);
  mfuncionarios.setcpf(umdm.dsetfuncionarioCPF.Value);
  mfuncionarios.setdatanasc(umdm.dsetfuncionarioNASCIMENTO.Value);
  mfuncionarios.setendereco(umdm.dsetfuncionarioENDERECO.Value);
  mfuncionarios.setnumero(umdm.dsetfuncionarioNUMERO.Value);
  mfuncionarios.setbairro(umdm.dsetfuncionarioBAIRRO.Value);
  mfuncionarios.getumacidade.setCodigo(umdm.dsetfuncionarioID_CIDADE.Value);
  mfuncionarios.setcelular(umdm.dsetfuncionarioCELULAR.Value);
  mfuncionarios.settelefone(umdm.dsetfuncionarioTELEFONE.Value);
  mfuncionarios.setsexo(umdm.dsetfuncionarioSEXO.Value);
  mfuncionarios.setstatus(umdm.dsetfuncionarioSTATUS.Value);
  mfuncionarios.setemail(umdm.dsetfuncionarioEMAIL.Value);
  mfuncionarios.setcomissao(umdm.dsetfuncionarioCOMISSAO.Value);
end;

constructor Daofuncionarios.CrieObj;
begin
  umadaocidade := DaoCidades.CrieObj;
end;

destructor Daofuncionarios.Destrua_se;
begin
  umadaocidade.Destrua_se;
end;

function Daofuncionarios.Excluir(pObj: TObject): string;
begin
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetfuncionario.Active then
    umdm.dsetfuncionario.Open;
  umdm.dsetfuncionario.Delete;
  umdm.trans.Commit;
end;

function Daofuncionarios.getds: Tdatasource;
begin
  result := umdm.dsfuncionario;
end;

function Daofuncionarios.Pesquisar(pChave: string): string;
var
  mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from funcionario'
  else if ehnumero(pChave) then
    mSQL := 'select * from funcionario where id_funcionario =' +
      QuotedStr(pChave)
  else
    mSQL := 'select * from funcionario where nome =' + QuotedStr(pChave);
  umdm.dsetfuncionario.Active := false;
  umdm.dsetfuncionario.SelectSQL.Text := mSQL;
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetfuncionario.Active then
    umdm.dsetfuncionario.Open;
  result := '';
end;

function Daofuncionarios.Salvar(pObj: TObject): string;
var
  mfuncionarios: funcionarios;
begin
  mfuncionarios := funcionarios(pObj);
  if not umdm.trans.Active then
    umdm.trans.Active := true;
  if not umdm.dsetfuncionario.Active then
    umdm.dsetfuncionario.Open;
  if mfuncionarios.getcodigo = 0 then
    umdm.dsetfuncionario.Insert
  else
    umdm.dsetfuncionario.Edit;
  umdm.dsetfuncionarioID_FUNCIONARIO.Value := mfuncionarios.getcodigo;
  umdm.dsetfuncionarioNOME.Value := mfuncionarios.getnome;
  umdm.dsetfuncionarioCARGO.Value := mfuncionarios.getcargo;
  umdm.dsetfuncionarioSEXO.Value := mfuncionarios.getsexo;
  umdm.dsetfuncionarioTELEFONE.Value := mfuncionarios.gettelefone;
  umdm.dsetfuncionarioCELULAR.Value := mfuncionarios.getcelular;
  umdm.dsetfuncionarioNASCIMENTO.Value := mfuncionarios.getdatanasc;
  umdm.dsetfuncionarioEMAIL.Value := mfuncionarios.getemail;
  umdm.dsetfuncionarioCOMISSAO.Value := mfuncionarios.getcomissao;
  umdm.dsetfuncionarioENDERECO.Value := mfuncionarios.getendereco;
  umdm.dsetfuncionarioNUMERO.Value := mfuncionarios.getnumero;
  umdm.dsetfuncionarioBAIRRO.Value := mfuncionarios.getbairro;
  umdm.dsetfuncionarioID_CIDADE.Value := mfuncionarios.getumacidade.getcodigo;
  umdm.dsetfuncionarioSTATUS.Value := mfuncionarios.getstatus;
  umdm.dsetfuncionarioCPF.Value := mfuncionarios.getcpf;
  umdm.dsetfuncionario.Post;
  umdm.trans.Commit;
end;

procedure Daofuncionarios.setdaocidade(pObj: TObject);
begin
  umadaocidade := DaoCidades(pObj);
end;

procedure Daofuncionarios.setDM(pDM: TDM);
begin
  umdm := pDM;
end;

end.
