program ejercicio4;
const vG:array [1..7] of string = ('literario', 'filosofia', 'arte', 'biologia', 'computacion', 'medicina','ingenieria');
type rangoGenero = 1..7;
	
	
	libro = record
		ISBN:integer;
		codAutor:integer;
		codGenero:rangoGenero;
	end;
	
	infoAutor = record
		codAutor:integer;
		cantLibros:integer;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato:infoAutor;
		HI:arbol;
		HD:arbol;
	end;
	
	infoGenero = record
		codGenero:rangoGenero;
		cantLibros:integer;
	end;
vGeneros = array [1..7] of  infoGenero;

procedure GenerarEstructuras(var a:arbol; var v:vGeneros);
	
	procedure leerLibro (var l : libro);
	begin
		l.ISBN := Random(1000);
		if (l.ISBN <> 0) then begin
		l.codAutor := Random(300) + 100;
		l.codGenero := Random(7) + 1;
		end;
	end;
	
	procedure InsertarElemento(var a:arbol; unLibro:libro);
	begin
		 if(a = nil)then
		 begin
			 new (a);
			 a^.dato.codAutor:=unLibro.codAutor;
			 a^.dato.cantLibros:=1;
			 a^.HI:=nil; a^.HD:=nil;
		 end
		 else if (unLibro.codAutor = a^.dato.codAutor)then
			a^.dato.cantLibros:= a^.dato.cantLibros + 1
		 else if(unLibro.codAutor < a^.dato.codAutor)then
			InsertarElemento(a^.HI,unLibro)
		 else
			InsertarElemento(a^.HD,unLibro);
	end;
	
	procedure InicializarVector(var v:vGeneros);
	var i:integer;
	begin
		for i:=1 to 7 do
		begin
			v[i].codGenero:= i;
			v[i].cantLibros:=0;
		end;
	end;
	
var l:libro;
begin
	 randomize;
	 a:=nil;
	 leerLibro(l);
	 InicializarVector(v);
	 while (l.ISBN <> 0) do
	 begin
		  InsertarElemento(a,l);
		  v[l.codGenero].cantLibros:= v[l.codGenero].cantLibros + 1;
		  leerLibro(l);
	 end;
end;
procedure OrdenarVectorDescendiente(var v:vGeneros);
var i,j:integer; item:infoGenero;
begin
	 for i:= 2 to 7 do
	 begin
		item:=v[i];
		j:= i - 1;
	    while (j > 0) and (v[j].cantLibros < item.CantLibros)do
	    begin
			 v[j+1]:=v[j];
			 j:=j-1;
		end;
		v[j+1]:=item;
	end;
end;

procedure ImprimirVector(v:vGeneros);
var i:integer;
begin
	 for i:=1 to 7 do
	 begin
		 writeln('Codigo genero: ', v[i].codGenero, ' | Cantidad de libros: ', v[i].cantLibros);
	 end;
end;

procedure ImprimirArbol (a:arbol);
begin
	 if(a <> nil)then
	 begin
		  ImprimirArbol(a^.HI);
		  writeln ('Codigo autor: ', a^.dato.codAutor, ' | Cantidad de libros: ', a^.dato.cantLibros);
		  ImprimirArbol(a^.HD);
	 end;
end;

procedure InformarCantLibrosEntreDosRangos (a:arbol; var cant:integer);
	function CalcularCantidad(a:arbol; valor1,valor2:integer):integer;
	begin
		 if (a = nil)then
			CalcularCantidad:=0
		 else if (a^.dato.codAutor >= valor1) and (a^.dato.codAutor <= valor2)then
			CalcularCantidad:= a^.dato.cantLibros + CalcularCantidad(a^.HI,valor1,valor2) + CalcularCantidad(a^.HD,valor1,valor2)
		 else if (a^.dato.codAutor < valor1)then
			CalcularCantidad:= CalcularCantidad(a^.HD,valor1,valor2)
		 else
			CalcularCantidad:=CalcularCantidad(a^.HI,valor1,valor2);
	end;

var codigo1,codigo2:integer;
begin
	writeln('Ingresar 1er codigo: ');
	readln(codigo1);
	writeln('Ingresar 2do codigo: ');
	readln(codigo2);
	if(codigo1 < codigo2)then
		cant:=CalcularCantidad(a,codigo1,codigo2)
	else
		cant:=CalcularCantidad (a, codigo2,codigo1);
    if (a = nil)then
		writeln ('Arbol vacio.')
	else if(cant = 0)then
		writeln('No hay libros dentro del rango.')
	else
		writeln('La cantidad de libros dentro del rango ',codigo1, ' y ',codigo2,' es: ',cant);
end;


var a:arbol; v:vGeneros; cant:integer;
begin
	GenerarEstructuras(a,v);
	OrdenarVectorDescendiente(v);
	writeln ('----- ARBOL -----');
	writeln;
	ImprimirArbol(a);
	writeln;
	writeln ('----- VECTOR -----');
	writeln;
	ImprimirVector(v);
	writeln;
	writeln ( 'El genero con mayor cantidad de libros es ',vG[v[1].codGenero]);
	writeln;
	InformarCantLibrosEntreDosRangos(a,cant);
end.
