program ejercicio3;


type rangoMes = 1..12;

	compra = record
		codJuego:integer;
		codCliente:integer;
		mes:rangoMes;
	end;
	
	infoCliente = record
		codCliente:integer;
		mes:rangoMes;
	end;
	
	lista = ^nodo;
	nodo = record
		dato:infoCliente;
		sig:lista;
	end;
	
	infoNodo = record
		codJuego:integer;
		infoC:lista;
	end;

	arbol = ^nodoArbol;
	nodoArbol = record
		dato:infoNodo;
		HI:arbol;
		HD:arbol;
	end;


procedure GenerarArbol(var a:arbol);

	procedure leerCompra (var c : compra);
	begin
		c.codCliente := Random(200);
		if (c.codCliente <> 0)
		then begin
		c.mes := Random(12) + 1;
		c.codJuego := Random(200) + 1000;
		end;
	end;
	
	procedure ArmarCliente(var cli:infoCliente; c:compra);
	begin
		cli.codCliente:=c.codCliente;
		cli.mes:=c.mes;
	end;
	
	
	procedure InsertarElemento(var a:arbol; c:compra);
	
		procedure AgregarAdelante(var pI:lista; dato:infoCliente);
		var nuevo:lista;
		begin
			 new(nuevo);
			 nuevo^.dato:=dato;
			 nuevo^.sig:=pI;
			 pI:=nuevo;
		end;

	var cliente:infoCliente;
	begin
		 if(a = nil)then
		 begin
			new (a);
			a^.dato.codJuego:=c.codJuego;
			a^.dato.infoC:=nil;
			ArmarCliente(cliente,c);
			AgregarAdelante(a^.dato.infoC, cliente);
			a^.HI:= nil; a^.HD:=nil;
		end
		else if (a^.dato.codJuego = c.codJuego) then begin
			ArmarCliente(cliente,c);
			AgregarAdelante(a^.dato.infoC,cliente)
		end
		else if (a^.dato.codJuego < c.codJuego)then
			InsertarElemento(a^.HD,c)
		else	
			InsertarElemento(a^.HI,c);
	end;

var c:compra;
begin
	 randomize;
	 a:=nil;
	 leerCompra(c);
	 while (c.codCliente <> 0)do
	 begin
		 InsertarElemento (a,c);
		 leerCompra (c)
	 end;
end;


procedure ImprimirLista(pI:lista);
	begin
		if (pI <> nil)then
		begin
			writeln(' Cliente ', pI^.dato.codCliente, ' | Mes ', pI^.dato.mes:2);
			ImprimirLista(pI^.sig);
		end;
	end;

procedure ImprimirArbol(a:arbol);
	procedure recorrerArbol(a:arbol);
	begin
		if (a <> nil)then
		begin
			 recorrerArbol(a^.HI);
			 writeln('Juego ', a^.dato.codJuego, ' | Compras:');
			 ImprimirLista(a^.dato.infoC);
			 writeln;
			 recorrerArbol(a^.HD);
		end;
	end;
	
begin
	 if(a = nil)then
		writeln('Arbol vacio.')
	 else begin
		writeln(' -------- COMPRAS DE VIDEOJUEGOS -------');
		writeln;
		recorrerArbol(a);
	 end;
end;

procedure IncisoB (a:arbol; var comprasL:lista);

	function BuscarCodJuego(a:arbol; cod:integer):lista;
	begin
		 if (a = nil)then
			BuscarCodJuego:= nil
		 else if (a^.dato.codJuego = cod)then
			BuscarCodJuego:=a^.dato.infoC
		 else if (cod < a^.dato.codJuego )then
			BuscarCodJuego:= BuscarCodJuego(a^.HI,cod)
		 else
			BuscarCodJuego:= BuscarCodJuego(a^.HD,cod);
	end;
var cod:integer;
begin
	 writeln;
	 writeln ('Ingrese codigo de videojuego: ');
	 readln(cod);
	 comprasL:= BuscarCodJuego(a,cod);
	 if (comprasL = nil)then
		writeln ('No hay compras realizas del codigo: ', cod)
	 else begin
		writeln;
		ImprimirLista(comprasL);
		writeln;
	end;
end;

procedure IncisoC (L: lista);
	 
	 function CalcularCantLista(pI:lista; mes:rangoMes):integer;
	 begin
		if (pI = nil)then
			CalcularCantLista:=0
		else 
			if (pI^.dato.mes = mes)then
				CalcularCantLista:= 1 + CalcularCantLista(pI^.sig,mes)
			else
				CalcularCantLista:= CalcularCantLista(pI^.sig,mes);
	 end;

var mes:rangoMes; cantCompras:integer;
begin
	 writeln ('Ingrese mes: ');
	 readln(mes);
	 cantCompras:= CalcularCantLista(L,mes);
	 if (L = nil)then
		writeln ('No hay compras registradas')
	 else begin
		writeln('La cantidad de compras del mes: ',cantCompras);
	end;
end;

var a:arbol; comprasL:lista; 
begin
	GenerarArbol(a);
	ImprimirArbol(a);
	IncisoB(a,comprasL);
	IncisoC(comprasL);
end.
