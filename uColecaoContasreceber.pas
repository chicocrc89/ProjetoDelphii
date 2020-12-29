unit uColecaoContasreceber;

interface
  uses SysUtils, uColecao, ucontasreceber;
  type colecaocontasreceber = Class(colecao)
  private

  protected

  public
    function Pesquisa( pcontareceber: integer; pQuero: boolean ): integer;
end;

implementation

function colecaocontasreceber.Pesquisa(pcontareceber: integer; pQuero: boolean): integer;
var k : integer;
begin
     k:= 1;
     if qtd <= 0 then
        result:= 1
     else
     begin
         while ( k <= qtd ) and ( pcontareceber > contasreceber(itens[k]).getnumero_parcela) do
                inc(k);
         if ( k > qtd) then begin
             if pQuero then
                result:= 0
             else
                result:= k;
         end
         else {nao cheguei ao final - posso ter encontrado ou nao}
         if (pcontareceber = contasreceber (itens[k]).getnumero_parcela) then begin
             if pQuero then
                result:= k
             else
                result:= 0;
         end else
         if pQuero then
            result:= 0
         else
            result:= k;
     end;
end;

end.

