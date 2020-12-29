unit ucontroller;

interface
  type controller = class
  private

  protected

  public
    constructor CrieObj;
    destructor  Destrua_se;
    function Salvar( pObj :  TObject ):            string;    virtual;
    function Carregar ( pObj : TObject ):          string;    virtual;
    function Excluir ( pObj : TObject ):           string;    virtual;
    function Pesquisar ( pChave : string):         string ;   virtual;
  end;

implementation
{ controller }

function controller.Carregar(pObj: TObject): string;
begin

end;

constructor controller.CrieObj;
begin

end;

destructor controller.Destrua_se;
begin

end;

function controller.Excluir(pObj: TObject): string;
begin

end;

function controller.Pesquisar(pChave: string): string;
begin

end;

function controller.Salvar(pObj: TObject): string;
begin

end;

end.
 