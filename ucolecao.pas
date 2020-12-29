unit uColecao;

interface
         type
         colecao = class
           private
           protected
             itens : array[1..100] of TObject;
             qtd: integer;
           public
             constructor crieObj;
             destructor destrua_se;
             procedure setQtd ( pQtd: integer );
             function getQtd : integer;
             procedure insere( pObj: TObject; pos : integer);
             procedure remove( pos:  integer);
             procedure insereFim( pObj: TObject);
             function Carrega( pos: integer): TObject;
             function VCVazia: boolean;
             function VCCheia: boolean;
           end;

implementation

{ colecao }

constructor colecao.crieObj;
begin
    qtd:= 0;
end;

destructor colecao.destrua_se;
var k: integer;
begin
     for k:= 1 to qtd do begin
         itens[k].FreeInstance;
     end;
end;

procedure colecao.setQtd(pQtd: integer);
begin
    qtd:= pQtd;
end;

function colecao.getQtd: integer;
begin
   result:= qtd;
end;

procedure colecao.insere(pObj: TObject; pos: integer);
var k: integer;
begin
    if (pos = qtd + 1)then
       self.insereFim(pObj)
    else
    begin
         inc(qtd);
         for k:= qtd downto (pos + 1) do begin
             itens[k]:= itens[k-1];
         end;
         itens[pos]:= pObj;
    end;
end;

procedure colecao.remove(pos: integer);
var k:integer;
    pObj : TObject;
begin
     pObj:= itens[pos];
     for k:= pos to qtd do
         itens[k]:= itens[k+1];
     dec(qtd);
end;

procedure colecao.insereFim(pObj: TObject);
begin
    inc(qtd);
    itens[qtd]:= pObj;
end;

function colecao.Carrega(pos: integer):TObject;
begin
   result:= itens[pos];
end;

function colecao.VCVazia: boolean;
begin
    result:= ( qtd = 0 );
end;

function colecao.VCCheia: boolean;
begin
   result:= ( qtd = 100);
end;

end.

