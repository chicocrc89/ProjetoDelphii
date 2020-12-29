unit uCombustiveis;

interface

Uses uGenerica;

type
  Combustiveis = class(Generica)
    private

    protected
      combustivel : string;
    public
      constructor Crieobj;
      destructor Destrua_se;
      procedure setcombustivel (pcombustivel : string);
      function getcombustivel : string;
      function clone : Combustiveis;
  end;



implementation

{ Combustiveis }

function Combustiveis.clone: Combustiveis;
begin
  result := Combustiveis.Crieobj;
  result.setCodigo(codigo);
  result.setcombustivel(combustivel);
  result.setCadastro(cadastro);
  result.setUlt_Alt(ult_alt);
end;

constructor Combustiveis.Crieobj;
begin

end;

destructor Combustiveis.Destrua_se;
begin

end;

function Combustiveis.getcombustivel: string;
begin
  result := combustivel;
end;

procedure Combustiveis.setcombustivel(pcombustivel: string);
begin
  combustivel := pcombustivel;
end;

end.
