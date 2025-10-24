program Ejer4;

const MIN = 100;
MAX= 150;

type
	lista = ^nodo;
	
	nodo = record
	    elem: integer;
		sig: lista;
    end;
    
procedure CargarListaOrdenada (var pI: lista; valor: integer);
var ant, act, nuevo:lista;

begin
	new(nuevo);
	nuevo^.elem:= valor;
	nuevo^.sig:=nil;
	
	if(pI = nil) then pI:=nuevo
	else
	begin
		act:= pI; ant:=pI;
		while(act <> nil) and (act^.elem < nuevo^.elem) do
		begin
			ant:=act;
			act:=act^.sig;
		end;
		
		if(act = pI) then
			begin
				nuevo^.sig := pI;          //CASO 2 AGREGAR ADELANTE.
				pI:=nuevo;
			end
	
			else
				if(act <> nil) then
				begin
					ant^.sig:=nuevo;
					nuevo^.sig:=act;       //CASO 3 AGREGAR MEDIO
				end
				else
					begin
						ant^.sig:=nuevo;
						nuevo^.sig:=nil;   //CASO 4 AGREGAR AL FINAL.
					end;
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

function BuscarElementoOrdenado(pI:lista; valor:integer):boolean;
var aux:lista;
encontre:boolean;
begin
	encontre:=false;
	aux:=pI;
	while (aux <> nil) and (aux^.elem < valor) do
	begin
		aux:=aux^.sig;
	end;
	
	if(aux <> nil) and (aux^.elem = valor) then
	begin
		encontre:=true;
	end;
BuscarElementoOrdenado:=encontre;
end;


var
pri:lista;
num:integer;
begin
	randomize;
	pri:=nil;
	num:= 100 + random(150 - 100 + 1);
	while(num <> 120) do 
	begin
		 CargarListaOrdenada(pri,num);
		 num:= 100 + random(150 - 100 + 1)
	end;
	ImprimirLista(pri);
	writeln('Ingrese numero a buscar: ');
	readln(num);
	writeln(BuscarElementoOrdenado(pri,num));
end.	
