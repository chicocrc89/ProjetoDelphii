unit uControllerCondicoes;

interface

uses SysUtils, uController, uDM, uDaocondicoes, DB, uCondicoes, uControllerFormaPagamentos, uparcelas, uColecaoParcelas;

type
  Controllercondicoes = class(controller)
  private

  protected
    umadaocondicao: Daocondicoes;
    umactrlformapagamento : ControllerFormaPagamentos;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
    procedure setctrlformapagamento(pObj: TObject);
    function getctrlformapagamento: ControllerFormaPagamentos;
  end;

implementation

{ Controllerpais }

function Controllercondicoes.Carregar(pObj: TObject): string;
var mcondicoes : Condicoes;
    tamanho : integer;
    i: Integer;
    mcolecao : ColecaoParcelas;
    mparcela : Parcelas;
begin
  self.umadaocondicao.Carregar(pObj);
  mcondicoes := Condicoes (pObj);
  tamanho := mcondicoes.getumacolecaop.getQtd;
  for i := 1 to tamanho do
  begin
    mcolecao := ColecaoParcelas (mcondicoes.getumacolecaop);
    mparcela := Parcelas (mcolecao.Carrega(I));
    self.umactrlformapagamento.Pesquisar(inttostr(mparcela.getumaformapagamento.getCodigo));
    self.umactrlformapagamento.Carregar(mparcela.getumaformapagamento);
  end;
end;

constructor Controllercondicoes.CrieObj;
begin
  umadaocondicao := Daocondicoes.CrieObj;
end;

destructor Controllercondicoes.Destrua_se;
begin
  umadaocondicao.Destrua_se;
end;

function Controllercondicoes.Excluir(pObj: TObject): string;
begin
  self.umadaocondicao.Excluir(pObj);
end;

function Controllercondicoes.getctrlformapagamento: ControllerFormaPagamentos;
begin
  result := umactrlformapagamento;
end;

function Controllercondicoes.getds: Tdatasource;
begin
  result := umadaocondicao.getds;
end;

function Controllercondicoes.Pesquisar(pChave: string): string;
begin
  self.umadaocondicao.Pesquisar(pChave);
end;

function Controllercondicoes.Salvar(pObj: TObject): string;
begin
  self.umadaocondicao.Salvar(pObj);
end;

procedure Controllercondicoes.setctrlformapagamento(pObj: TObject);
begin
  umactrlformapagamento := ControllerFormaPagamentos (pObj);
end;

procedure Controllercondicoes.setDM(pDM: TDM);
begin
  self.umadaocondicao.setDM(pDM);
end;

end.
