program Ejer3;

type
	lista = ^nodo;
	
	nodo = record
	   elem:integer;
	   sig: lista;
	end;


procedure CargarLista (var pI:lista; num:integer);
var nuevo:lista;
begin
	new(nuevo);
	nuevo^.elem:= num;
	nuevo^.sig:= nil;
	
	if(pI = nil) then pI:=nuevo
	else
	begin
		nuevo^.sig:=pI;
		pI:=nuevo;
    end;
end;

procedure ImprimirLista(pI:lista);
var aux:lista;
begin
	aux:=pI;
	while(aux <> nil)do
	begin
		writeln(aux^.elem);
		aux:=aux^.sig;
    end;
end;
function buscar (pI:lista; valor:integer):boolean;
var encontre:boolean;
aux:lista;
begin
	encontre:=false;
	aux:=pI;
	while(aux <> nil) and (encontre = false)do
	begin
		if(aux^.elem = valor) then
		begin
			encontre:=true;
	    end
	    else
			aux:=aux^.sig;
   end;
buscar:=encontre;
end;

var
pri:lista;
num,valor:integer;
begin
	randomize;
	pri:=nil;
	num:= 100 + random(150 - 100 + 1);
	while(num <> 120) do 
	begin
		 CargarLista(pri,num);
		 num:= 100 + random(150 - 100 + 1)
	end;
	ImprimirLista(pri);
	writeln('Ingrese valor a buscar: ' );
	readln(valor);
	writeln(buscar(pri, valor));
end.
