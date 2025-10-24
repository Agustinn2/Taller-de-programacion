program ejercicio2;

  
type rangoAnio = 2015..2024;
	 cadena15 = string [15];
	
	auto = record
	  patente:integer;
	  anio : rangoAnio;
	  marca:cadena15;
	  color:cadena15;
	  modelo:cadena15;
	 end;
	 
	 infoMarca = record
		color:cadena15;
		patente:integer;
	 end;
	 
	 lista = ^nodo;
	 nodo = record
		dato:infoMarca;
		sig:lista;
	 end;
	 
	 arbol = ^nodoArbol;
	 nodoArbol = record
		dato:auto;
		HI:arbol;
		HD:arbol;
	 end;

	 
	 arbol2 =^nodoArbol2;
	 nodoArbol2 = record
		marca:cadena15;
		autos:lista;
		HI: arbol2;
		HD: arbol2;
	 end;
	 
	 auto2 = record
	  patente:integer;
	  marca:cadena15;
	  color:cadena15;
	  modelo:cadena15;
	 end;
	 lista2 = ^nodo2; 
	 nodo2 = record
		dato: auto2;
		sig:lista2;
	 end;
	 
vector = array [rangoAnio] of lista2;
vMarcas = array [1..6] of cadena15; 
vColores = array [1..10]of cadena15;
vModelos = array [1..10]of cadena15;

const
  MARCAS_INI: vMarcas = ('Toyota','Volkswagen','Ford','Chevrolet','Renault' ,'MMM' );

  COLORES_INI: vColores = ( 'Blanco','Negro','Gris','Plata','Azul', 'Rojo','Verde','Amarillo','Naranja','Bordo' );

  MODELOS_INI: vModelos = ( 'Toyota Corolla','Volkswagen Gol','Ford Fiesta','Ford Focus', 'Chevrolet Onix','Peugeot 208','Renault Sandero','Fiat Cronos','Nissan Versa','Honda Civic');

procedure GenerarArboles(var a:arbol;var a2:arbol2);
	
	procedure CargarUnAuto (var a:auto; v:vMarcas; v2:vColores; v3:vModelos ;var info:infoMarca);
	begin
		 a.marca:= v[1+random(6)];
		 if (a.marca <> 'MMM')then
		 begin
			 a.patente:=random (5000);
			 a.anio:= 2015 + random(2025 - 2015 +1);
			 a.color:= v2[1+random (10)];
			 a.modelo:= v3[1+ random(10)];
			 info.color:= a.color;
			 info.patente:=a.patente;
		end;
	end;
	procedure InsertarElemento1(var a:arbol; unAuto:auto);
	begin
		 if(a = nil)then
		 begin
			 new(a);
			 a^.dato:=unAuto;
			 a^.HI:=nil;
			 a^.HI:=nil;
		 end
		 else if (a^.dato.patente > unAuto.patente)then
			InsertarElemento1(a^.HI,unAuto)
		 else if(a^.dato.patente < unAuto.patente)then
			InsertarElemento1(a^.HD,unAuto);

	end;
	procedure InsertarElemento2(var a:arbol2; dato:infoMarca; marca:cadena15);
		procedure AgregarAdelante(var pI:lista; dato:infoMarca);
		var nuevo:lista;
		begin
			 new (nuevo);
			 nuevo^.dato:=dato;
			 nuevo^.sig:= pI;
			 pI:=nuevo;
		end;
	
	begin
		if (a = nil)then
		begin
			 new (a);
			 a^.marca:= marca;
			 a^.autos:=nil;
			 agregarAdelante(a^.autos, dato);
			 a^.HI:=nil;a^.HD:=nil;
		end
		else if (a^.marca = marca)then
			agregarAdelante(a^.autos,dato)
		else if(a^.marca < marca)then
			InsertarElemento2(a^.HD,dato,marca)
		else
			InsertarElemento2(a^.HI,dato,marca);
	end;
var v:vMarcas; v2:vColores; v3:vModelos;
unAuto:auto;info:infoMarca;
begin
	 randomize;
	 a:=nil; a2:=nil;
	 v:=MARCAS_INI;
	 v2:=COLORES_INI;
	 v3:=MODELOS_INI;
	 CargarUnAuto(unAuto,v,v2,v3,info);
	 while (unAuto.marca <> 'MMM')do
	 begin
		  InsertarElemento1(a,unAuto);
		  InsertarElemento2(a2,info,unAuto.marca);
		  CargarUnAuto(unAuto,v,v2,v3,info);
	 end;
end;

procedure ImprimirArbolPatente(a: arbol);
begin
  if (a <> nil) then
  begin
    ImprimirArbolPatente(a^.HI);
    writeln('Patente=', a^.dato.patente,
            '  Anio=', a^.dato.anio,
            '  Marca=', a^.dato.marca,
            '  Color=', a^.dato.color,
            '  Modelo=', a^.dato.modelo);
    ImprimirArbolPatente(a^.HD);
  end;
end;

procedure ImprimirArbolMarcas(a: arbol2);
	
	procedure ImprimirListaAutos(pI: lista);
	begin
	while (pI<> nil) do
	begin
		writeln('   - Patente=', pI^.dato.patente, '  Color=', pI^.dato.color);
		pI := pI^.sig;
	end;
	end;

begin
  if (a <> nil) then
  begin
    ImprimirArbolMarcas(a^.HI);
    writeln('Marca: ', a^.marca);
    ImprimirListaAutos(a^.autos);
    writeln; 
    ImprimirArbolMarcas(a^.HD);
  end;
end;
procedure InformarCantAutosDeMarca(a:arbol);
	
	function CalcularCantAutos(a:arbol; marca:cadena15):integer;
	begin
		 if(a = nil)then 
			CalcularCantAutos:=0
		 else if(a^.dato.marca = marca)then
			CalcularCantAutos:= 1 + CalcularCantAutos(a^.HI,marca) + CalcularCantAutos(a^.HD,marca)
		 else
			CalcularCantAutos:= CalcularCantAutos(a^.HI,marca) + CalcularCantAutos(a^.HD,marca)
	end;


var cantAutos:integer; marca:cadena15;
begin
	writeln;
	writeln ('---- Cantidad de autos de la marca ----- ');
	writeln;
	writeln ('Ingresar marca: ');
	readln(marca);
	cantAutos:= CalcularCantAutos(a,marca);
	if (cantAutos <> 0)then
		writeln ('La cantidad de autos de la marca ',marca, ' es: ', cantAutos)
	else
		writeln('No se encontro ningun auto de la marca registrado.')
end;
procedure InformarCantAutosDeMarca2(a:arbol2);

	function contarLista(pI:lista):integer;
	begin
		 if( pI <> nil)then
			 contarLista:= 1 + contarLista(pI^.sig)
	     else
			contarLista:= 0;
	end;

	function CalcularCantAutos(a:arbol2; marca:cadena15):integer;
	begin
		 if(a = nil)then 
			CalcularCantAutos:=0
		 else if(a^.marca = marca)then
			CalcularCantAutos:= contarLista(a^.autos)
		 else if (marca < a^.marca)then
			CalcularCantAutos:= CalcularCantAutos(a^.HI,marca)
		 else
			CalcularCantAutos:=CalcularCantAutos(a^.HD,marca);
	end;


var cantAutos:integer; marca:cadena15;
begin
	writeln;
	writeln ('---- Cantidad de autos de la marca ----- ');
	writeln;
	writeln ('Ingresar marca: ');
	readln(marca);
	cantAutos:= CalcularCantAutos(a,marca);
	if (cantAutos <> 0)then
		writeln ('La cantidad de autos de la marca ',marca, ' es: ', cantAutos)
	else
		writeln('No se encontro ningun auto de la marca registrado.')
end;


procedure GenerarEstructuraVector(a:arbol; var v:vector);
	procedure InicializarVector(var v:vector);
	var i:integer;
	begin
		for i:=2015 to 2024 do
		begin 
			v[i]:=nil;
		end;
	end;
	procedure CargarDatosAuto(a:arbol;var auto:auto2);
	begin
		 if( a <> nil)then
		 begin
			  auto.patente:= a^.dato.patente;
			  auto.marca:= a^.dato.marca;
			  auto.color:= a^.dato.color;
			  auto.modelo:= a^.dato.modelo;
		 end;
	end;
	
	procedure agregarAdelante(var pI:lista2; dato:auto2);
	var nuevo:lista2;
	begin
		new (nuevo);
		nuevo^.dato:=dato;
		nuevo^.sig:=pI;
		pI:=nuevo;
	end;
	
	
	procedure recorrerArbol(a:arbol; var v:vector);
	var unAuto:auto2;
	begin
		 if(a <> nil)then
		 begin
			 CargarDatosAuto(a,unAuto);
			 agregarAdelante(v[a^.dato.anio],unAuto);
			 recorrerArbol(a^.HI,v);
			 recorrerArbol(a^.HD,v);
		 end;
	end;
	
begin
	 inicializarVector(v);
	 if (a = nil)then
		writeln('Arbol Vacio')
	 else begin
		recorrerArbol(a,v);
		writeln('Estructra inciso D generada.');
	 end;
end;

procedure ImprimirLista(L:lista2);
begin
  if (L = nil) then
    writeln('   (sin autos registrados)')
  else
  begin
    while (L <> nil) do
    begin
      writeln('   Patente: ', L^.dato.patente, 
              '  Marca: ', L^.dato.marca,
              '  Color: ', L^.dato.color,
              '  Modelo: ', L^.dato.modelo);
      L := L^.sig;
    end;
  end;
end;
procedure ImprimirVector(v:vector);
var i:integer;
begin
  writeln;
  writeln('----- Autos agrupados por anio -----');
  for i:=2015 to 2024 do
  begin
    writeln('Anio ', i, ':');
    ImprimirLista(v[i]);
    writeln;
  end;
end;
procedure InformarModeloDeAuto(a:arbol);

	function BuscarPorPatente(a:arbol; patente:integer):cadena15;
	begin
		 if(a = nil)then
			BuscarPorPatente:= 'N'
		 else if (a^.dato.patente = patente)then
			BuscarPorPatente:=a^.dato.modelo
		 else if (patente < a^.dato.patente)then
			BuscarPorPatente:=BuscarPorPatente(a^.HI,patente)
	     else
			BuscarPorPatente:=BuscarPorPatente(a^.HD,patente);
	end;

var patente:integer; modelo:cadena15;
begin
	writeln;
	writeln('-------- Modelo de la patente a buscar ------->');
	writeln;
	if(a <> nil)then
	begin
		writeln ('Ingrese patente a buscar: ');
		readln(patente);
		modelo:= BuscarPorPatente(a,patente);
		if (modelo = 'N')then
			writeln('No se encontro.')
		else
			writeln('El modelo es: ', modelo);
		writeln;
	end
	else
		writeln('Arbol vacio.')
end;



procedure InformarColorDeAuto(a:arbol2);

	function BuscarLista (pI : lista; patente:integer):cadena15;
	begin
		 if(pI = nil)then
			BuscarLista:= 'N'
		 else if (pI^.dato.patente = patente) then
			BuscarLista:= pI^.dato.color
		 else
			BuscarLista:= BuscarLista(pI^.sig, patente);
	end;
	
	procedure recorrerArbolLista(a:arbol2; patente:integer; var color:cadena15);
	begin
		 if (a <> nil) and ( color = 'N')then
		 begin
			  color:= BuscarLista (a^.autos , patente);
			  recorrerArbolLista(a^.HI,patente,color);
			  recorrerArbolLista(a^.HD,patente,color);	
		 end;
	end;
 
	function BuscarColorPorPatente(a:arbol2; patente:integer):cadena15;
	var color:cadena15;
	begin
		 color:='N';
		 recorrerArbolLista(a,patente,color);
		 BuscarColorPorPatente:=color;
	end;

var patente:integer; color:cadena15;
begin
	writeln;
	writeln('-------- Color de la patente a buscar ------->');
	writeln;
	if(a <> nil)then
	begin
		writeln ('Ingrese patente a buscar: ');
		readln(patente);
		color:= BuscarColorPorPatente(a,patente);
		if (color = 'N')then
			writeln('No se encontro.')
		else
			writeln('El color es: ', color);
		writeln;
	end
	else
		writeln('Arbol vacio.')
end;

var a:arbol;
a2:arbol2; v:vector;
begin
	GenerarArboles(a,a2);
	writeln;
	writeln('------------ ARBOL 1 --------------');
	writeln;
	ImprimirArbolPatente(a);
	writeln;
	writeln('------------ ARBOL 2 --------------');
	writeln;
	ImprimirArbolMarcas(a2);
	InformarCantAutosDeMarca(a);
	InformarCantAutosDeMarca2(a2);
	GenerarEstructuraVector(a,v);
	ImprimirVector(v);
	InformarModeloDeAuto(a);
	InformarColorDeAuto(a2);
end.
