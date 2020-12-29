unit uControllerprodutos;

interface

uses uDM, DB, ucontroller, uControllerFabricantes, uControllerGrupos, uControllerFornecedores, uDaoProdutos, uProdutos, SysUtils;

type
  Controllerprodutos = class(controller)
  private

  protected
    umactrlfabricante   : ControllerFabricantes;
    umactrlgrupo        : ControllerGrupos;
    umactrlfornecedor   : ControllerFornecedores;
    umadaoproduto       : DaoProdutos;
  public
    constructor CrieObj;
    destructor Destrua_se;
    function Salvar(pObj: TObject): string; override;
    function Carregar(pObj: TObject): string; override;
    function Excluir(pObj: TObject): string; override;
    function Pesquisar(pChave: string): string; override;
    procedure setDM(pDM: TDM);
    function getds: Tdatasource;
    procedure setctrlfabricante(pObj: TObject);
    function getctrlfabricante: ControllerFabricantes;
    procedure setctrlfornecedor(pObj: TObject);
    function getctrlfornecedor: ControllerFornecedores;
    procedure setctrlgrupo(pObj: TObject);
    function getctrlgrupo: ControllerGrupos;
  end;

implementation

{ Controllerprodutos }


{ Controllerprodutos }

function Controllerprodutos.Carregar(pObj: TObject): string;
var
  mproduto: produtos;
begin
  self.umadaoproduto.Carregar(pObj);
  mproduto := produtos(pObj);
  umactrlfabricante.Pesquisar(inttostr(mproduto.getumfabricante.getcodigo));
  self.umactrlfabricante.Carregar(mproduto.getumfabricante);
  umactrlfornecedor.Pesquisar(inttostr(mproduto.getumfornecedor.getCodigo));
  self.umactrlfornecedor.Carregar(mproduto.getumfornecedor);
  self.umactrlgrupo.Pesquisar(inttostr(mproduto.getumgrupo.getCodigo));
  umactrlgrupo.Carregar(mproduto.getumgrupo);
end;

constructor Controllerprodutos.CrieObj;
begin
  self.umadaoproduto := DaoProdutos.CrieObj;
end;

destructor Controllerprodutos.Destrua_se;
begin
  self.umadaoproduto.Destrua_se;
end;

function Controllerprodutos.Excluir(pObj: TObject): string;
begin
  self.umadaoproduto.Excluir(pObj);
end;

function Controllerprodutos.getctrlfabricante: ControllerFabricantes;
begin
  result := umactrlfabricante;
end;

function Controllerprodutos.getctrlfornecedor: ControllerFornecedores;
begin
  result := umactrlfornecedor;
end;

function Controllerprodutos.getctrlgrupo: ControllerGrupos;
begin
  result := umactrlgrupo;
end;

function Controllerprodutos.getds: Tdatasource;
begin
  result := umadaoproduto.getds;
end;

function Controllerprodutos.Pesquisar(pChave: string): string;
begin
  self.umadaoproduto.Pesquisar(pChave);
end;

function Controllerprodutos.Salvar(pObj: TObject): string;
begin
  self.umadaoproduto.Salvar(pObj);
end;

procedure Controllerprodutos.setctrlfabricante(pObj: TObject);
begin
  umactrlfabricante := ControllerFabricantes(pObj);
end;

procedure Controllerprodutos.setctrlfornecedor(pObj: TObject);
begin
  umactrlfornecedor := ControllerFornecedores(pObj);
end;

procedure Controllerprodutos.setctrlgrupo(pObj: TObject);
begin
  umactrlgrupo := ControllerGrupos(pObj);
end;

procedure Controllerprodutos.setDM(pDM: TDM);
begin
  self.umadaoproduto.setDM(pDM);
end;

end.
