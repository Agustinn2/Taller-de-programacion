program ejercicio3;

type rangoNota = 1..10;
	   rangoFecha = 1..31;
	 
	 finalesAlumnos = record
		codigoMateria:integer;
		fecha:rangoFecha;
		nota:rangoNota;
	 end;
	 
	 infoAlumno = record
		legajo : integer;
		promedio:real;
	 end;
	 
	 listaInfo = ^nodoInfo;
	 
	 nodoInfo = record
		dato:infoAlumno;
		sig:listaInfo;
	 end;
	 
	 lista = ^nodo;
	 
	 nodo = record
		dato:finalesAlumnos;
		sig:lista;
	 end;
	 
	 
	 arbol = ^nodoArbol;
	 
	 nodoArbol = record
		legajo:integer;
		dato:lista;
		HI:arbol;
		HD:arbol;
	 end;

procedure GenerarArbol(var a :arbol);

		procedure CargarUnFinal (var f:finalesAlumnos; var legajo:integer);
		begin
				legajo:=random (20);
				if (legajo <> 0)then
				begin	
						f.codigoMateria:=random(200);
						f.fecha:=1 + random (31);
						f.nota:= 1 + random (10);
				end;
		end;
		
		procedure AgregarAdelante(var pI:lista; dato:finalesAlumnos);
		var nuevo:lista;
		begin
				new (nuevo);
				nuevo^.dato:=dato;
				nuevo^.sig:=pI;
				pI:=nuevo;
		end;
		
		procedure InsertarFinales(var a:arbol; dato:finalesAlumnos; legajo: integer);
		begin
				if (a = nil)then
				begin
						new (a);
					  a^.dato:=nil;
					  a^.legajo:=legajo;
						AgregarAdelante(a^.dato,dato);
					  a^.HI:=nil;
					  a^.HD:=nil;
				end
				else if(legajo < a^.legajo)then
					begin
							InsertarFinales(a^.HI,dato,legajo);
					end
					else if(legajo > a^.legajo)then
						begin
								InsertarFinales(a^.HD,dato,legajo);
						end
						else
								AgregarAdelante(a^.dato,dato);
	   end;
					  
var final:finalesAlumnos; legajo:integer;
begin
		randomize;
 		CargarUnFinal(final,legajo);
 		while (legajo <> 0)do
 		begin	
				InsertarFinales(a,final,legajo);
				CargarUnFinal(final,legajo);
		end;
end;

procedure ImprimirArbol (a:arbol);
		procedure ImprimirFinales(pI:lista);
		begin
				if(pI <>nil)then
				begin
						writeln('  CODIGO DE MATERIA: [',pI^.dato.codigoMateria, '] FECHA: [', pI^.dato.fecha, '] NOTA: [', pI^.dato.nota,']');
						ImprimirFinales(pI^.sig);
				end;
		end;

begin
		 if (a <> nil)then
		 begin
				 ImprimirArbol(a^.HI);
				 writeln('  ------------- ALUMNO LEGAJO ',a^.legajo, ' ---------------  ');
				 writeln('  ----------------  FINALES  ------------------  ');
				 writeln;
				 ImprimirFinales(a^.dato);
				 writeln;
				 writeln;
				 ImprimirArbol(a^.HD);
		 end;
end;

		function ContarLegajosImpares(a:arbol):integer;
		var resto:integer;
		begin
			 if (a = nil)then
			 begin
				  resto:=0;
			 end
			 else 
			 begin
				  resto:=a^.legajo mod 2;
			   	  resto:= resto + ContarLegajosImpares(a^.HI) + ContarLegajosImpares(a^.HD);
             end;
             ContarLegajosImpares:=resto;
	 end;

	
		 
procedure InformarAlumnoAprobados (a:arbol);
	
	function ContarFinalesAprobados(pI:lista):integer;
	begin
		 if (pI = nil)then ContarFinalesAprobados:=0
		 else
		 begin
			  if(pI^.dato.nota >= 4)then ContarFinalesAprobados:= 1 + ContarFinalesAprobados(pI^.sig)
			  else
			  ContarFinalesAprobados:=ContarFinalesAprobados(pI^.sig);
		 end;
	end;
	
begin
	if (a <> nil)then
	begin
		writeln('Legajo: ', a^.legajo, '  |  Finales aprobados: ', ContarFinalesAprobados(a^.dato));
		writeln;
		InformarAlumnoAprobados(a^.HI);
		InformarAlumnoAprobados(a^.HD);
	end;
end;

function ObtenerMayoresPromedio(a:arbol; valor:real):listaInfo;

	procedure AgregarInfo(var pI: listaInfo; leg: integer; prom: real);
	var
	nuevo: listaInfo;
	begin
		new(nuevo);
		nuevo^.dato.legajo := leg;
		nuevo^.dato.promedio := prom;
		nuevo^.sig := pI;
		pI := nuevo;
		
	end;

	function PromedioFinales(pI: lista): real;
		
		procedure Acumular(pI:lista; var cant,suma:integer);
		begin
			if (pI <> nil)then
			begin
				 suma:= suma + pI^.dato.nota;
				 cant:= cant + 1 ;
				 Acumular (pI^.sig, cant,suma);
			end;
		end;
	var
	suma, cant: integer;
	begin
		suma := 0; cant := 0;
		Acumular(pI,cant,suma);
		if cant = 0 then
			PromedioFinales := 0
		else
		PromedioFinales := suma / cant;
	end;

	procedure RecolectarMayores(a:arbol; valor:real; var pI:listaInfo);
	var p:real;
	begin
		if (a <> nil)then
		begin
			RecolectarMayores(a^.HI,valor,pI);
			p:=PromedioFinales(a^.dato);
			if( p > valor)then AgregarInfo(pI,a^.legajo,p);
			RecolectarMayores(a^.HD,valor,pI);
		end;
	end;

var pI:listaInfo;
	
begin
	 pI:=nil;
	 RecolectarMayores (a,valor,pI);
	 ObtenerMayoresPromedio:=pI; 
end;

procedure ImprimirPromedios (pI:listaInfo);
begin
	if (pI <> nil)
	begin
		 writeln ('Legajo: ',pI^.dato.legajo, ' Promedio: ', pI^.dato.promedio:0:2);
		 ImprimirPromedios(pI^.sig);
    end;
end;

var a:arbol; valor:real; pri: listaInfo; 
begin
	a:=nil;
	GenerarArbol(a);
	ImprimirArbol(a);
	writeln ('La cantidad de legajos impares es: ',ContarLegajosImpares(a));
	writeln;
	InformarAlumnoAprobados (a);
	writeln ('Ingresar valor real: ');
	readln(valor);
	pri:= ObtenerMayoresPromedio (a, valor);
	if(pri <> nil)then
	begin
		writeln('Los alumnos que superan el promedio ', valor:0:2, ' son: ');
		ImprimirPromedios (pri);
	end
	else begin
		writeln('Ningun alumno supera el promedio.');
		end;
end.
