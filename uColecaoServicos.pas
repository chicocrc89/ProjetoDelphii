unit uColecaoServicos;

interface
  uses SysUtils, uColecao, uItem;
  type colecaoservicos = Class(colecao)
  private
  protected

  public
    function Pesquisa( pitem: string; pQuero: boolean ): integer;
end;
implementation

function colecaoservicos.Pesquisa(pitem: string; pQuero: boolean): integer;
var k : integer;
begin
     k:= 1;
     if qtd <= 0 then
        result:= 1
     else
     begin
         while ( k <= qtd ) and ( pitem > Item(itens[k]).getumproduto.getdescricao) do
                inc(k);
         if ( k > qtd) then begin
             if pQuero then
                result:= 0
             else
                result:= k;
         end
         else {nao cheguei ao final - posso ter encontrado ou nao}
         if (pitem = item (itens[k]).getumproduto.getdescricao)then begin
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

