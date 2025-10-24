program ejercicio2;


type rangoEdad = 12..100;
     cadena15 = string [15];
     socio = record
               numero: integer;
               nombre: cadena15;
               edad: rangoEdad;
             end;
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: socio;
                    HI: arbol;
                    HD: arbol;
                 end;
     
procedure GenerarArbol (var a: arbol);
{ Implementar un modulo que almacene informacion de socios de un club en un arbol binario de busqueda. De cada socio se debe almacenar numero de socio, 
nombre y edad. La carga finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio. La informacion de cada socio debe generarse
aleatoriamente. }

  Procedure CargarSocio (var s: socio);
  var vNombres:array [0..9] of string= ('Ana', 'Jose', 'Luis', 'Ema', 'Ariel', 'Pedro', 'Lena', 'Lisa', 'Martin', 'Lola'); 
  
  begin
    s.numero:= random (51) * 100;
    If (s.numero <> 0)
    then begin
           s.nombre:= vNombres[random(10)];
           s.edad:= 12 + random (79);
         end;
  end;  
  
  Procedure InsertarElemento (var a: arbol; elem: socio);
  Begin
    if (a = nil) 
    then begin
           new(a);
           a^.dato:= elem; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.numero < a^.dato.numero) 
         then InsertarElemento(a^.HI, elem)
         else InsertarElemento(a^.HD, elem); 
  End;

var unSocio: socio;  
Begin
 writeln;
 writeln ('----- Ingreso de socios y armado del arbol ----->');
 writeln;
 a:= nil;
 CargarSocio (unSocio);
 while (unSocio.numero <> 0)do
  begin
   writeln ('Numero generado: ', unSocio.numero);
   InsertarElemento (a, unSocio);
   CargarSocio (unSocio);
  end;
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;

procedure InformarSociosOrdenCreciente (a: arbol);
{ Informar los datos de los socios en orden creciente. }
  
  procedure InformarDatosSociosOrdenCreciente (a: arbol);
  begin
    if (a <> nil) then begin
        InformarDatosSociosOrdenCreciente (a^.HI);
        writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
        InformarDatosSociosOrdenCreciente (a^.HD);
    end;
  end;

Begin
 writeln;
 writeln ('----- Socios en orden creciente por numero de socio ----->');
 writeln;
 InformarDatosSociosOrdenCreciente (a);
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;

procedure InformarSociosOrdenDecreciente (a:arbol);
	procedure InformarDatosSociosOrdenDecreciente (a:arbol);
	begin
		if (a <> nil) then begin
		InformarDatosSociosOrdenDecreciente(a^.HD);
		writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
		InformarDatosSociosOrdenDecreciente(a^.HI);
		end;
	end;


begin
 writeln;
 writeln ('----- Socios en orden decreciente por numero de socio ----->');
 writeln;
 if(a = nil)then writeln('No hay socios registrados.')
 else begin
 InformarDatosSociosOrdenDecreciente (a);
 end;
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;

procedure InformarNumeroSocioConMasEdad (a: arbol);
{ Informar el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor.  }

     procedure actualizarMaximo(var maxValor,maxElem : integer; nuevoValor, nuevoElem : integer);
	begin
	  if (nuevoValor >= maxValor) then
	  begin
		maxValor := nuevoValor;
		maxElem := nuevoElem;
	  end;
	end;
	
	
	procedure NumeroMasEdad (a: arbol; var maxEdad: integer; var maxNum: integer);
	begin
	   if (a <> nil) then
	   begin
		  actualizarMaximo(maxEdad,maxNum,a^.dato.edad,a^.dato.numero);
		  numeroMasEdad(a^.hi, maxEdad,maxNum);
		  numeroMasEdad(a^.hd, maxEdad,maxNum);
	   end; 
	end;

var maxEdad, maxNum: integer;
begin
  writeln;
  writeln ('----- Informar Numero Socio Con Mas Edad ----->');
  writeln;
  maxEdad := -1;
  NumeroMasEdad (a, maxEdad, maxNum);
  if (maxEdad = -1) 
  then writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Numero de socio con mas edad: ', maxNum);
         writeln;
       end;
  writeln;
  writeln ('//////////////////////////////////////////////////////////');
  writeln;
end;

procedure AumentarEdadNumeroImpar (var a: arbol);
{Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios que se les aumento la edad.}
  
  function AumentarEdad (a: arbol): integer;
  var resto: integer;
  begin
     if (a = nil) 
     then AumentarEdad:= 0
     else begin
            resto:= a^.dato.edad mod 2;
            if (resto = 1) then a^.dato.edad:= a^.dato.edad + 1;
            AumentarEdad:= resto + AumentarEdad (a^.HI) + AumentarEdad (a^.HD);
          end;  
  end;
begin
  writeln;
  writeln ('----- Cantidad de socios con edad aumentada ----->');
  writeln;
  writeln ('Cantidad: ', AumentarEdad (a));
  writeln;
  writeln;
  writeln ('//////////////////////////////////////////////////////////');
  writeln;
end;

procedure InformarExistenciaNombreSocio (a:arbol);

	function BuscarExistenciaNombre(a:arbol;nombre:cadena15):boolean;
	var existe:boolean;
	begin
		 if ( a = nil) then existe:=false
		 else begin
				if (a^.dato.nombre = nombre)then existe:=true
				else begin
						existe:= BuscarExistenciaNombre(a^.HI,nombre) or (BuscarExistenciaNombre(a^.HD,nombre));
					 end;
			  end;
		BuscarExistenciaNombre:=existe;
	end;
	

var dato:cadena15; 
begin
	writeln ('Ingrese nombre a buscar: ');
	readln (dato);
	writeln;
	writeln ('----- Buscar existencia de nombre de socio ----->');
	writeln;
	if (BuscarExistenciaNombre(a,dato)) then writeln('Si existe.')
	else begin
		writeln('No existe.');
		end;
	writeln;
	writeln;
	writeln ('//////////////////////////////////////////////////////////');
	writeln;
end;



function ContarSocios(a:arbol):integer;
	begin
		 if(a = nil) then ContarSocios:=0
		 else begin
				 ContarSocios:= 1 + ContarSocios(a^.HI) + ContarSocios(a^.HD);
			  end;
	end;

procedure InformarCantidadSocios(a:arbol);

	
begin
	writeln;
	writeln ('----- Cantidad de socios ----->');
	writeln;
    writeln(ContarSocios(a));
	writeln;
	writeln;
	writeln ('//////////////////////////////////////////////////////////');
	writeln;
end;

procedure InformarPromedioDeEdad (a: arbol);

	  function SumarEdades (a:arbol):integer;
	  begin
		   if (a = nil) then SumarEdades:=0
		   else begin
					SumarEdades:= a^.dato.edad + SumarEdades(a^.HI) + SumarEdades(a^.HD);
				end;
				
	  end;
	
begin
	writeln;
	writeln ('----- Promedio de edades ----->');
	writeln;
	writeln ( (SumarEdades(a) / ContarSocios(a)):0:2);
	writeln;
	writeln;
	writeln ('//////////////////////////////////////////////////////////');
	writeln;
end;

procedure InformarNumeroSocioMasGrande (a:arbol);
	function BuscarMaxSocio (a:arbol):integer;
	begin
		 if (a = nil)then BuscarMaxSocio:=-9999
		 else begin
				if (a^.HD = nil) then BuscarMaxSocio:= a^.dato.numero
				else begin
						BuscarMaxSocio:= BuscarMaxSocio(a^.HD);
					 end;
			  end;
	end;
	
var mayorNumeroSocio:integer;
begin
	writeln;
	writeln ('----- Numero de socio mas grande ----->');
	writeln;
	mayorNumeroSocio:=  BuscarMaxSocio(a);
	if (mayorNumeroSocio = -9999)then writeln ('Arbol vacio.')
	else begin
			writeln('El numero de socio mas grande es: ', mayorNumeroSocio);
	     end;
	writeln;
	writeln;
	writeln ('//////////////////////////////////////////////////////////');
	writeln;

end;
procedure InformarSocioNumeroMasChicos (a:arbol);

	function BuscarMinSocio (a:arbol):socio;
	var s:socio;
	begin
		  s.numero:= -1;
		  if(a = nil)then BuscarMinSocio:= s
		  else begin
				  if (a^.HI = nil) then BuscarMinSocio:= a^.dato
				  else begin
						BuscarMinSocio:=BuscarMinSocio(a^.HI);
					   end;
				end;
	end;
					    


var unSocio:socio;
begin
	writeln;
	writeln ('----- Datos del socio con el numero mas chico ----->');
	writeln;
	unSocio:= BuscarMinSocio(a);
	if (unSocio.numero = -1) then writeln ('Arbol vacio.')
	else begin
			writeln('Numero: ', unSocio.numero, '  Nombre: ', unSocio.nombre, ' Edad: ', unSocio.edad);
		 end;
	writeln;
	writeln;
	writeln ('//////////////////////////////////////////////////////////');
	writeln;
end;

procedure InformarSiExisteSocio(a:arbol);
	
	
	
	function BuscarExistenciaValor(a: arbol; valor: integer): boolean;
	begin
		if (a = nil) then
			BuscarExistenciaValor := false
		else if (valor = a^.dato.numero) then
			BuscarExistenciaValor := true
		else if (valor < a^.dato.numero) then
			BuscarExistenciaValor := BuscarExistenciaValor(a^.HI, valor)
		else
		BuscarExistenciaValor := BuscarExistenciaValor(a^.HD, valor);
end;
	
	
	
	
	
	{function BuscarExistenciaValor (a:arbol; valor:integer):boolean;
	begin
		 if (a = nil) or (valor < 0) then BuscarExistenciaValor:=false
		 else begin
				if (a^.dato.numero = valor) then BuscarExistenciaValor:=true
				else begin
						if(a^.dato.numero < valor) then BuscarExistenciaValor:= BuscarExistenciaValor(a^.HD,valor)
						else begin
								BuscarExistenciaValor:= BuscarExistenciaValor(a^.HI,valor);
							 end;
					 end;
			  end;
			  
	end;}


var valor:integer; existe:boolean;
begin
	writeln;
	writeln ('----- Informar si existe tal numero  ----->');
	writeln;
	writeln('Ingrese numero de socio a buscar: ');
	readln (valor);
	existe:= BuscarExistenciaValor(a,valor);
	if (not existe) then writeln ('No existe')
	else begin
		writeln('Si existe');
		 end;
	writeln;
	writeln;
	writeln ('//////////////////////////////////////////////////////////');
	writeln;
end;

procedure InformarCantidadEntreDosRangos (a:arbol);

	function CalcularCantidad (a:arbol; valor1, valor2:integer):integer;
	begin
		 if (a = nil)then CalcularCantidad:=0
		 else if (a^.dato.numero >= valor1) and (a^.dato.numero <= valor2) then 
			CalcularCantidad:= 1 + CalcularCantidad(a^.HI,valor1,valor2) + CalcularCantidad(a^.HD,valor1,valor2)
		 else if (a^.dato.numero < valor1)then
			CalcularCantidad:= CalcularCantidad(a^.HD,valor1,valor2)
		 else
			CalcularCantidad:=CalcularCantidad(a^.HI,valor1,valor2);
	end;


var valor1,valor2:integer; cant:integer;
begin
	writeln;
	writeln ('----- Informar cantidad de socios entre dos valores  ----->');
	writeln;
	writeln ('Ingrese valor 1: ');
	readln(valor1);
	writeln ('Ingrese valor 2: ');
	readln(valor2);
	if (valor1 < valor2)then 
		cant:=CalcularCantidad(a,valor1,valor2)
	else
		cant:=CalcularCantidad(a,valor2,valor1);
	writeln('La cantidad de socios entre el valor ', valor1 ,' y ',valor2, ' es: ',cant);
	writeln;
	writeln;
	writeln ('//////////////////////////////////////////////////////////');
	writeln;
end;


var a: arbol; 
Begin
  randomize;
  GenerarArbol (a);
  InformarSociosOrdenCreciente (a);
  InformarSociosOrdenDecreciente (a); 
  InformarNumeroSocioConMasEdad (a);
  AumentarEdadNumeroImpar (a);
  InformarSociosOrdenCreciente (a);
  InformarExistenciaNombreSocio (a);
  InformarCantidadSocios (a);
  InformarPromedioDeEdad (a);
  InformarNumeroSocioMasGrande(a);
  InformarSocioNumeroMasChicos(a);
  InformarSiExisteSocio(a);
  InformarCantidadEntreDosRangos(a);
End.
