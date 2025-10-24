program probando;

type 
	lista = ^nodo;
	
	nodo = record
		num: integer;
		sig:lista;
	end;

procedure agregarAdelante(var pI:lista; num:integer);
var nuevo:lista;
begin
	 new (nuevo);
	 nuevo^.num:= num;
	 nuevo^.sig:=nil;
	 
	 if(pI = nil)then pI:=nuevo
	 else
	 begin
		nuevo^.sig:=pI;
		pI:=nuevo;
	 end;

end;

procedure InsertarOrdenado (var pI:lista; num:integer);
var nuevo,ant,act:lista;
begin
	 new(nuevo);
	 nuevo^.num:=num;
	 nuevo^.sig:=nil;
	
	 if(pI = nil) then pI:=nuevo
	 else
	 begin
		ant:=pI;
		act:=pI;
		while(act <> nil) and (act^.num < nuevo^.num)do
		begin
			 ant:=act;
			 act:=act^.sig;
	    end;
	    
	    if (act = pI) then
	    begin
			nuevo^.sig:=pI;
			pI:=nuevo;
		end
		else
		begin
			if(act <> nil) then
			begin
				 ant^.sig:= nuevo;
				 nuevo^.sig:=act;
		    end
			else
			begin
				ant^.sig:=nuevo;
				nuevo^.sig:=nil;
			end;
		end;
	end;
end;

procedure agregarAlFinal1(var L: lista; v: integer);
var
nuevo,aux : lista;
begin
     new(nuevo); // reservamos memoria
     nuevo^.num := v; // guardamos elemento
     nuevo^.sig := nil; // apuntamos al puntero inicial
     
     if(L = nil) then L := nuevo      // evaluamos si la lista esta vacia
     else begin
         aux:=L;                    //guardamos PI en aux2
         while(aux^.sig <> nil)do  // mientras no sea el ultimo de la lista
         begin
              aux:=aux^.sig;       //sigo recorriendo hasta llegar al ultimo
         end;
         aux^.sig:=nuevo;         // asignamos que apunte al nuevo numero
     end;
end;

procedure AgregarAlFinal2(var pI,ult:lista; p:pelicula);
	var nuevo:lista;
	begin
		 new (nuevo);
		 nuevo^.dato:=p;
		 nuevo^.sig:=nil;
		 
		 if(pI = nil) then
		 begin
			pI:=nuevo;
			ult:=nuevo;
		 end
		 else
		 begin
			ult^.sig:=nuevo;
			ult:=nuevo;
	     end;
     end;


procedure ImprimirLista ( pI: lista);
begin
	 if(pI <> nil)then
	 begin
		ImprimirLista(pI^.sig);
		writeln(pI^.num);
	end;

end;

var l:lista;
num,i:integer;
begin
	 l:=nil;
	 randomize;
	 for i:=1 to 10 do
	 begin
		num:=random (200);
		InsertarOrdenado(l,num);
	 end;
	 ImprimirLista(l);
	 writeln();
	 writeln (l^.num);

end.
