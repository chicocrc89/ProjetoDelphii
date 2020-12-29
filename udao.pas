unit udao;

interface
  type dao = class
  private

  protected

  public
    constructor CrieObj;
    destructor  Destrua_se;
    function Salvar( pObj :  TObject ):         string;    virtual;
    function Carregar ( pObj : TObject ):       string;    virtual;
    function Excluir ( pObj : TObject ):        string;    virtual;
    function Pesquisar ( pChave : string):      string ;   virtual;
    function ehnumero (pvalor : string): boolean;
  end;

implementation

{ dao }

function dao.Carregar(pObj: TObject): string;
begin

end;

constructor dao.CrieObj;
begin

end;

destructor dao.Destrua_se;
begin

end;

function dao.ehnumero(pvalor: string): boolean;
var x : integer;
    cod : integer;
begin
  val(pvalor, x, cod);
  result := (cod = 0);

end;

function dao.Excluir(pObj: TObject): string;
begin

end;

function dao.Pesquisar(pChave: string): string;
begin

end;

function dao.Salvar(pObj: TObject): string;
begin

end;

end.
 