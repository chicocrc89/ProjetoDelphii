unit uControllerContasReceber;

interface

uses SysUtils, ucontroller, uDM, DB, uDaoContasReceber, uControllerFormaPagamentos, uControllerClientes, uContasReceber;

type
  ControllerContasReceber = class(controller)
  private

  protected
    umadaoContasReceber: DaoContasReceber;
    umactrlformapagamento: ControllerFormapagamentos;
    umactrlCliente : ControllerClientes;
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
    procedure setctrlCliente(pObj: TObject);
    function getctrlCliente: ControllerClientes;
  end;

implementation

{ ControllerContasReceber }

function ControllerContasReceber.Carregar(pObj: TObject): string;
var
  mContasReceber: ContasReceber;
begin
  self.umadaoContasReceber.Carregar(pObj);
  mContasReceber := ContasReceber(pObj);
  umactrlformapagamento.Pesquisar(inttostr(mContasReceber.getumaformapagamento.getcodigo));
  self.umactrlformapagamento.Carregar(mContasReceber.getumaformapagamento);
  umactrlCliente.Pesquisar(inttostr(mContasReceber.getumCliente.getCodigo));
  self.umactrlCliente.Carregar(mContasReceber.getumCliente);
end;

constructor ControllerContasReceber.CrieObj;
begin
  self.umadaoContasReceber := DaoContasReceber.CrieObj;
end;

destructor ControllerContasReceber.Destrua_se;
begin
  self.umadaoContasReceber.Destrua_se;
end;

function ControllerContasReceber.Excluir(pObj: TObject): string;
begin
  self.umadaoContasReceber.Excluir(pObj);
end;

function ControllerContasReceber.getctrlformapagamento: ControllerFormapagamentos;
begin
  result := umactrlformapagamento;
end;

function ControllerContasReceber.getctrlCliente: ControllerClientes;
begin
  result := umactrlCliente;
end;

function ControllerContasReceber.getds: Tdatasource;
begin
  result := umadaoContasReceber.getds;
end;

function ControllerContasReceber.Pesquisar(pChave: string): string;
begin
  self.umadaoContasReceber.Pesquisar(pChave);
end;

function ControllerContasReceber.Salvar(pObj: TObject): string;
begin
  self.umadaoContasReceber.Salvar(pObj);
end;

procedure ControllerContasReceber.setctrlformapagamento(pObj: TObject);
begin
  umactrlformapagamento := ControllerFormaPagamentos(pObj);
end;

procedure ControllerContasReceber.setctrlCliente(pObj: TObject);
begin
  umactrlCliente := ControllerClientes(pObj);
end;

procedure ControllerContasReceber.setDM(pDM: TDM);
begin
  self.umadaoContasReceber.setDM(pDM);
end;

end.
