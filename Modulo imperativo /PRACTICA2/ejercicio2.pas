program ejercicio2;

const max = 200;
	  min = 100;

type  lista = ^nodo;
	  
	  nodo = record
		 num:integer;
		 sig:lista;
	  end;
	   

procedure GenerarListaRecursivo (var pI:lista);
	
var numero:integer; nuevo:lista;
begin
	numero:= min + random(max - min + 1);
	if (numero <> 100) then
	begin
		 new(nuevo);
		 nuevo^.num:=numero;
		 nuevo^.sig:=pI;
		 pI:=nuevo;
		 GenerarListaRecursivo(pI);
	end;
end;

procedure ImprimirListaRecursivo(pI:lista);
begin
	if(pI <> nil)then
	begin
		writeln('numero: ', pI^.num);
		ImprimirListaRecursivo(pI^.sig);
	end;
end;

procedure ImprimirListaRecursivoInverso(pI:lista);
begin
	if(pI <> nil)then
	begin
		ImprimirListaRecursivoInverso(pI^.sig);
		writeln('numero: ', pI^.num);
	end;
end;

function ObtenerMinimo (pI:lista):integer;
	
	function BuscarMinimo(pI:lista; min: integer):integer;
	begin
		if(pI <> nil)then
		begin
			if(pI^.num < min)then
			begin
				min:=pI^.num;
			end;
			BuscarMinimo:= BuscarMinimo(pI^.sig, min);
		end
		else
			BuscarMinimo:=min;
	end;

var min:integer;
begin
	min:=999;
	ObtenerMinimo:=BuscarMinimo(pI,min);
end;

Function BuscarValor (pI:lista; valor:integer):boolean;

	function BuscarRecursivo(pI:lista; esta:boolean; valor:integer):boolean;
	begin
		if(pI <> nil) and (not esta)then
		begin
			 if(pI^.num = valor)then
			 begin
				 esta:=true;
			 end;
			 BuscarRecursivo:=BuscarRecursivo(pI^.sig, esta, valor);
		end
		else
		BuscarRecursivo:=esta;
	end;


var esta:boolean;
begin
	esta:=false;
	BuscarValor:=BuscarRecursivo(pI,esta,valor);
end;
var pri:lista; valor:integer;
begin
	 pri:=nil;
	 GenerarListaRecursivo(pri);
	 ImprimirListaRecursivo(pri);
	 writeln(' --- ORDEN INVERSO --- ' );
	 ImprimirListaRecursivoInverso(pri);
	 writeln('El valor minimo es: ', ObtenerMinimo(pri));
	 writeln( 'Ingrese valor a buscar: ');
	 readln(valor);
	 if (BuscarValor(pri,valor)) then
	 begin
		 writeln('Si se encuentra en la lista.');
	 end
	 else 
		writeln('No se encuentra en la lista.');
end.
