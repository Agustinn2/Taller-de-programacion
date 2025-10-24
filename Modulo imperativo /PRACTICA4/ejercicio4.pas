program ejercicio4;


type  rangoMes = 1..12;
	  rangoDia = 1..31;
	  
	  fecha = record
		mes:rangoMes;
		dia: rangoDia;
	  end;
	  
	  prestamo = record 
		ISBN:integer;
		numeroSocio:integer;
		fechaPrestamo : fecha;
		cantDiasPrestados : integer;
	  end;
	  
	  prestamoL = record
		numeroSocio:integer;
		fechaPrestamo:fecha;
		cantDiasPrestados : integer;
	  end;
	  
	  infoCantidad = record
		 ISBN:integer;
		 cant:integer;
	  end;
	  
	  arbol3 = ^nodoarbol3;
	  
	  nodoArbol3 = record
		dato:infoCantidad;
		HI:arbol3;
		HD:arbol3;
	  end;
	  
	  
	  lista = ^nodo;
	  nodo = record
		dato:prestamoL;
		sig:lista;
	  end;
	  
	  arbol = ^nodoArbol;
	  
	  nodoArbol = record
		dato:prestamo;
		HI:arbol;
		HD:arbol;
	  end;
	  
	  arbol2 = ^nodoArbol2;
	  
	  nodoArbol2 = record
		ISBN:integer;
		prestamos: lista;
		HI:arbol2;
		HD:arbol2;
	  end;
		
procedure GenerarArbol(var a:arbol; var a2:arbol2);
	procedure CargarUnPrestamo(var p:prestamo;var pL:prestamoL);
	begin
		  p.ISBN:= random (20);
		  if (p.ISBN <> 0)then
		  begin
			   p.numeroSocio:= 1 + random(20);
			   p.fechaPrestamo.mes:= 1 + random (12);
			   p.fechaPrestamo.dia:= 1 + random(31);
			   p.cantDiasPrestados:= 1 + random (10);
			   pL.numeroSocio:=p.numeroSocio;
			   pL.fechaPrestamo.mes:=p.fechaPrestamo.mes;
			   pL.fechaPrestamo.dia:=p.fechaPrestamo.dia;
			   pL.cantDiasPrestados:= p.cantDiasPrestados;
		  end;
	end;
	procedure InsertarPrestamo1(var a:arbol; p:prestamo);
	begin
		if( a = nil)then
		begin
			new (a);
			a^.dato:= p;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if (p.ISBN >= a^.dato.ISBN) then
			InsertarPrestamo1(a^.HD,p)
		else
			InsertarPrestamo1(a^.HI,p);
	end;
	
	procedure InsertarPrestamo2(var a:arbol2; p:prestamoL; ISBN:integer);
		
		procedure AgregarAdelante(var pI:lista; p:prestamoL);
		var nuevo:lista;
		begin
			 new (nuevo);
			 nuevo^.dato:=p;
			 nuevo^.sig:=pI;
			 pI:=nuevo;
		end;	

	begin
		 if (a = nil)then
		 begin
			  new (a);
			  a^.prestamos:=nil;
			  a^.ISBN:=ISBN;
			  AgregarAdelante(a^.prestamos,p);
			  a^.HI:=nil;
			  a^.HD:=nil;
		 end
		 else if (a^.ISBN = ISBN) then
			AgregarAdelante(a^.prestamos,p)
		 else if (ISBN < a^.ISBN)then
			InsertarPrestamo2(a^.HI,p,ISBN)
		 else
			InsertarPrestamo2(a^.HD,p,ISBN);
	end;
			
var p:prestamo; pL:prestamoL;
begin
	  a:=nil;
	  a2:=nil;
	  randomize;
	  CargarUnPrestamo(p,pL);
	  while (p.ISBN <> 0)do
	  begin
		   InsertarPrestamo1(a,p);
		   InsertarPrestamo2(a2,pL,p.ISBN);
		   CargarUnPrestamo(p,pL);
	  end;
end;

procedure ImprimirArbol1(a: arbol);
begin
  if (a <> nil) then
  begin
    ImprimirArbol1(a^.HI);
    writeln('ISBN: ', a^.dato.ISBN,
            '  Socio: ', a^.dato.numeroSocio,
            '  Fecha: ', a^.dato.fechaPrestamo.dia, '/', a^.dato.fechaPrestamo.mes,
            '  Dias Prestado: ', a^.dato.cantDiasPrestados);
    ImprimirArbol1(a^.HD);
  end;
end;
procedure ImprimirArbol2(a: arbol2);
	procedure ImprimirListaPrestamos(L: lista);
	begin
		while (L <> nil) do
		begin
			writeln('   Socio: ', L^.dato.numeroSocio,
            '  Fecha: ', L^.dato.fechaPrestamo.dia, '/', L^.dato.fechaPrestamo.mes,
            '  Dias Prestado: ', L^.dato.cantDiasPrestados);
			L := L^.sig;
		end;
end;


begin
  if (a <> nil) then
  begin
    ImprimirArbol2(a^.HI);
    writeln('ISBN: ', a^.ISBN);
    ImprimirListaPrestamos(a^.prestamos);
    ImprimirArbol2(a^.HD);
  end;
end;
procedure InformarISBNmasGrande(a:arbol);

	function BuscarISBNmayor (a:arbol):integer;
	begin
		 if(a = nil)then 
			BuscarISBNmayor:=-9999
		 else if (a^.HD = nil) then 
			BuscarISBNmayor:=a^.dato.ISBN
		 else
			BuscarISBNmayor:=BuscarISBNmayor(a^.HD);
	end;
var ISBNmayor:integer;
begin
	writeln;
	writeln ('---- ISBN MAS GRANDE ----');
	ISBNmayor:= BuscarISBNmayor(a);
	writeln;
	if (ISBNmayor = -9999) then 
		writeln ('Arbol vacio.')
	else 
		writeln ('EL ISBN ES: ', ISBNmayor);
	writeln;
end;

procedure InformarISBNmasChico (a:arbol2);
	
	function BuscarISBNchico(a:arbol2):integer;
	begin
		 if (a = nil)then 
			BuscarISBNchico:=-9999
		 else if (a^.HI = nil)then
			BuscarISBNchico:=a^.ISBN
		 else
			BuscarISBNchico:=BuscarISBNchico(a^.HI);
	end;

var ISBNmenor:integer;
begin
	writeln;
	writeln ('---- ISBN MAS CHICO ----');
	ISBNmenor:= BuscarISBNchico(a);
	writeln;
	if (ISBNmenor = -9999) then 
		writeln ('Arbol vacio.')
	else 
		writeln ('EL ISBN ES: ', ISBNmenor);
	writeln;
end;
procedure InformarCantidadDeSocio (a:arbol);
	
	function CalcularCantidadPrestamos (a:arbol; valor:integer):integer;
	begin
		if (a = nil)then
			CalcularCantidadPrestamos:= 0
		else if (a^.dato.numeroSocio = valor)then
		    CalcularCantidadPrestamos:= 1 + CalcularCantidadPrestamos(a^.HI,valor) + CalcularCantidadPrestamos(a^.HD,valor)
		else
			CalcularCantidadPrestamos:=CalcularCantidadPrestamos(a^.HI,valor) + CalcularCantidadPrestamos(a^.HD,valor);
	end;

var numSocio,cantPrestamos:integer;
begin
	writeln;
	writeln ('---- Cantidad de prestamos ---- ARBOL 1  ----');
	writeln;
	if (a <> nil) then
	begin
		writeln ('Ingrese numero de socio : ');
		readln(numSocio);
		cantPrestamos:= CalcularCantidadPrestamos(a,numSocio);
        writeln ('La cantidad de prestamos del socio ', numSocio, ' es: ',cantPrestamos);
	end
	else
		writeln ('Arbol vacio.');
end;

procedure InformarCantidadDeSocio2 (a:arbol2);

	function CalcularCantPrestamos (a:arbol2; valor:integer):integer;
	
		function ContarPrestamosLista (pI:lista; valor:integer):integer;
		var cant:integer;
		begin
			  cant:=0;
			  while (pI <> nil)do
			  begin
				   if(pI^.dato.numeroSocio = valor)then
						cant:=cant + 1;
				   pI:=pI^.sig;
			  end;
			ContarPrestamosLista:=cant;
		end;
		
	begin
		 if(a = nil) then
			CalcularCantPrestamos:=0
		 else 
			CalcularCantPrestamos:= ContarPrestamosLista(a^.prestamos, valor)
									+ CalcularCantPrestamos(a^.HI,valor) 
									+ CalcularCantPrestamos(a^.HD,valor);
	end;

var numSocio,cantPrestamos:integer;
begin
	writeln;
	writeln ('---- Cantidad de prestamos ---- ARBOL 2  ----');
	writeln;
	if (a <> nil) then
	begin
		writeln ('Ingrese numero de socio: ');
		readln(numSocio);
		cantPrestamos:= CalcularCantPrestamos(a,numSocio);
        writeln ('La cantidad de prestamos del socio ', numSocio, ' es: ',cantPrestamos);
	end
	else
		writeln ('Arbol vacio.');
end;

procedure GenerarEstructuraContador(a:arbol; var a3:arbol3);

	procedure recorrerArbol(a:arbol; var a3:arbol3);
		
		procedure generarArbol (var a:arbol3; ISBN:integer);
		begin
			 if (a = nil)then
			 begin
				  new (a);
				  a^.dato.ISBN := ISBN;
				  a^.dato.cant:= 1;
				  a^.HI:=nil;
				  a^.HD:=nil;
			 end
			 else if (a^.dato.ISBN = ISBN)then
				a^.dato.cant:=a^.dato.cant+1
			 else if (ISBN < a^.dato.ISBN)then
				generarArbol(a^.HI,ISBN)
			 else
				generarArbol(a^.HD,ISBN)
		end;
		
	begin
		 if (a <> nil)then
		 begin
			  generarArbol(a3, a^.dato.ISBN);
			  recorrerArbol(a^.HI,a3);
			  recorrerArbol(a^.HD,a3);
	     end;
	end;

begin
	a3:=nil;
	if(a = nil)then
		writeln('Arbol vacio imposible generar estructura.')
	else begin
		writeln;
		writeln('GENERANDO ARBOL 3...');
		recorrerArbol(a,a3);
		writeln('Arbol generado correctamente.');
		end;
end;

procedure ImprimirArbolContador(a3: arbol3);
begin
  if a3 <> nil then
  begin
    ImprimirArbolContador(a3^.HI);
    writeln('ISBN: ', a3^.dato.ISBN, '  ->  Cantidad de prestamos: ', a3^.dato.cant);
    ImprimirArbolContador(a3^.HD);
  end;
end;
function CalcularPrestamos(pI:lista):integer;
		begin
			 if (pI = nil)then
			  CalcularPrestamos:=0
			 else 
			  CalcularPrestamos:= 1 + CalcularPrestamos(pI^.Sig);
		end;
procedure GenerarEstructuraContadorLista(a2:arbol2; var a4:arbol3);
	procedure recorrerArbol(a2:arbol2; var a4:arbol3);
		procedure generarArbol(var a:arbol3; cant,isbn:integer);
		begin
			 if (a = nil)then
			 begin
				 new (a);
				 a^.dato.ISBN:=isbn;
				 a^.dato.cant:=cant;
				 a^.HI:=nil;
				 a^.HD:=nil;
			end
			else if (isbn < a^.dato.ISBN)then
				generarArbol(a^.HI,cant,isbn)
			else
				generarArbol(a^.HD,cant,isbn);
		end;
	var cantElemLista:integer;
	begin
		 if (a2 <> nil)then
		 begin
			  cantElemLista:=CalcularPrestamos(a2^.prestamos);
			  generarArbol (a4, cantElemLista, a2^.ISBN);
			  recorrerArbol(a2^.HI,a4);
			  recorrerArbol(a2^.HD,a4);
		 end;
    end;

begin
	a4:=nil;
	if (a2 = nil)then
		writeln('Arbol vacio imposible generar estructura.')
	else begin
		writeln;
		writeln('GENERANDO ARBOL 4...');
		recorrerArbol(a2,a4);
		writeln('Arbol generado correctamente.');
		end;	
end;

procedure InformarCantidadDePrestamosEntreDosRangos(a:arbol);

	function CalcularCantidadEntreDosValores(a:arbol; valor1,valor2:integer):integer;
	begin
		 if(a = nil)then 
			CalcularCantidadEntreDosValores:=0
		 else if (a^.dato.ISBN >= valor1 ) and (a^.dato.ISBN <= valor2)then
			CalcularCantidadEntreDosValores:=1 + CalcularCantidadEntreDosValores(a^.HI,valor1,valor2) + CalcularCantidadEntreDosValores(a^.HD,valor1,valor2)
		 else if (a^.dato.ISBN < valor1)then
			CalcularCantidadEntreDosValores:= CalcularCantidadEntreDosValores(a^.HD,valor1,valor2)
		 else
			CalcularCantidadEntreDosValores:=CalcularCantidadEntreDosValores(a^.HI,valor1,valor2);
	end;
var cant,valor1,valor2:integer;
begin
	 writeln;
	 writeln ('---- Cantidad de prestamos entre dos rangos ARBOL 1 ---- ');
	 writeln;
	 if(a = nil)then
		writeln('Arbol vacio.')
	 else
	 begin
		writeln('Ingrese valor 1: ');
		readln(valor1);
		writeln ('Ingrese valor 2: ');
		readln(valor2);
		if (valor1 < valor2)then
			cant:=CalcularCantidadEntreDosValores(a,valor1,valor2)
		else
			cant:=CalcularCantidadEntreDosValores(a,valor2,valor1);

		writeln ('La cantidad de prestamos entre el valor ',valor1, ' y ',valor2, ' es: ',cant);
	end;

end;
procedure InformarCantidadDePrestamosEntreDosRangosLista(a:arbol2);

	function CalcularCantidadEntreDosValores(a:arbol2; valor1,valor2:integer):integer;
	begin
		 if(a = nil)then 
			CalcularCantidadEntreDosValores:=0
		 else if (a^.ISBN >= valor1 ) and (a^.ISBN <= valor2)then
			CalcularCantidadEntreDosValores:=CalcularPrestamos(a^.prestamos) + CalcularCantidadEntreDosValores(a^.HI,valor1,valor2) + CalcularCantidadEntreDosValores(a^.HD,valor1,valor2)
		 else if (a^.ISBN < valor1)then
			CalcularCantidadEntreDosValores:= CalcularCantidadEntreDosValores(a^.HD,valor1,valor2)
		 else
			CalcularCantidadEntreDosValores:=CalcularCantidadEntreDosValores(a^.HI,valor1,valor2);
	end;


var valor1,valor2,cant:integer;
begin
	 writeln;
	 writeln ('---- Cantidad de prestamos entre dos rangos ARBOL 2 ---- ');
	 writeln;
	 if(a = nil)then
		writeln('Arbol vacio.')
	 else
	 begin
		writeln('Ingrese valor 1: ');
		readln(valor1);
		writeln ('Ingrese valor 2: ');
		readln(valor2);
		if (valor1 < valor2)then
			cant:=CalcularCantidadEntreDosValores(a,valor1,valor2)
		else
			cant:=CalcularCantidadEntreDosValores(a,valor2,valor1);

		writeln ('La cantidad de prestamos entre el valor ',valor1, ' y ',valor2, ' es: ',cant);
	end;
end;

var a:arbol; a2:arbol2; a3,a4:arbol3;
begin
	GenerarArbol(a,a2);
	writeln('--- Arbol 1 (nodo = prestamo) ---');
	ImprimirArbol1(a);
	writeln;
	writeln('--- Arbol 2 (nodo = ISBN con lista) ---');
	ImprimirArbol2(a2);
    InformarISBNmasGrande(a);
	InformarISBNmasChico (a2);
	InformarCantidadDeSocio (a);
	InformarCantidadDeSocio2 (a2);
	GenerarEstructuraContador(a,a3);
	writeln;
	writeln('--- Resumen de prestamos por ISBN ARBOL 3 ---');
	ImprimirArbolContador(a3);
	GenerarEstructuraContadorLista(a2,a4);
	writeln;
	writeln('--- Resumen de prestamos por ISBN ARBOL 4---');
	ImprimirArbolContador(a4);
	InformarCantidadDePrestamosEntreDosRangos(a);
	InformarCantidadDePrestamosEntreDosRangosLista(a2);
end.	  
 
