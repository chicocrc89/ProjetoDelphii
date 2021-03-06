unit uControllerContasPagar;

interface

uses SysUtils, ucontroller, uDM, DB, uDaocontaspagar, uControllerFormaPagamentos, uControllerFornecedores, ucontaspagar;

type
  Controllercontaspagar = class(controller)
  private

  protected
    umadaocontaspagar: Daocontaspagar;
    umactrlformapagamento: ControllerFormapagamentos;
    umactrlfornecedor : ControllerFornecedores;
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
    procedure setctrlfornecedor(pObj: TObject);
    function getctrlfornecedor: ControllerFornecedores;
  end;

implementation

{ Controllercontaspagar }

function Controllercontaspagar.Carregar(pObj: TObject): string;
var
  mcontaspagar: contaspagar;
begin
  self.umadaocontaspagar.Carregar(pObj);
  mcontaspagar := contaspagar(pObj);
  umactrlformapagamento.Pesquisar(inttostr(mcontaspagar.getumaformapagamento.getcodigo));
  self.umactrlformapagamento.Carregar(mcontaspagar.getumaformapagamento);
  umactrlfornecedor.Pesquisar(inttostr(mcontaspagar.getumfornecedor.getCodigo));
  self.umactrlfornecedor.Carregar(mcontaspagar.getumfornecedor);
end;

constructor Controllercontaspagar.CrieObj;
begin
  self.umadaocontaspagar := Daocontaspagar.CrieObj;
end;

destructor Controllercontaspagar.Destrua_se;
begin
  self.umadaocontaspagar.Destrua_se;
end;

function Controllercontaspagar.Excluir(pObj: TObject): string;
begin
  self.umadaocontaspagar.Excluir(pObj);
end;

function Controllercontaspagar.getctrlformapagamento: ControllerFormapagamentos;
begin
  result := umactrlformapagamento;
end;

function Controllercontaspagar.getctrlfornecedor: ControllerFornecedores;
begin
  result := umactrlfornecedor;
end;

function Controllercontaspagar.getds: Tdatasource;
begin
  result := umadaocontaspagar.getds;
end;

function Controllercontaspagar.Pesquisar(pChave: string): string;
begin
  self.umadaocontaspagar.Pesquisar(pChave);
end;

function Controllercontaspagar.Salvar(pObj: TObject): string;
begin
  self.umadaocontaspagar.Salvar(pObj);
end;

procedure Controllercontaspagar.setctrlformapagamento(pObj: TObject);
begin
  umactrlformapagamento := ControllerFormaPagamentos(pObj);
end;

procedure Controllercontaspagar.setctrlfornecedor(pObj: TObject);
begin
  umactrlfornecedor := ControllerFornecedores(pObj);
end;

procedure Controllercontaspagar.setDM(pDM: TDM);
begin
  self.umadaocontaspagar.setDM(pDM);
end;

end.
