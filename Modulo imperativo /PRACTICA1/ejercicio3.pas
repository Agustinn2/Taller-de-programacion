program ejercicio3;

type rangoGenero = 1..8;
	
	 pelicula = record
		codigo:integer;
		genero:rangoGenero;
		puntaje:real;
	 end;
	  
	 maxInfo = record
		codigo : integer;
		puntaje: real;
	 end;
	 
	 lista = ^nodo;
	 
	 nodo = record
		dato:pelicula;
		sig:lista;
	 end;
	 
	 vector = array [rangoGenero] of lista;
	 vectorUltimo = array [rangoGenero] of lista;
	 vectorContador = array [rangoGenero] of maxInfo;

	 
procedure CargarDatos (var v:vector);

	procedure Inicializar (var v: vector; var vUlt:vectorUltimo);
	var i:integer;
	begin
		for i:=1 to 8 do 
		begin
			v[i]:=nil;
			vUlt[i]:=nil;
		end;
	end;
	
	procedure LeerPelicula (var p:pelicula);
	begin
		 writeln('Ingrese codigo de pelicula: ');
		 readln(p.codigo);
		 if(p.codigo <> -1) then
		 begin
			p.genero:= 1 + random (8);
			p.puntaje:= random (10);
		 end;
	end;
		 
	procedure AgregarAlFinal(var pI,ult:lista; p:pelicula);
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

var p:pelicula; vUlt:vectorUltimo;
begin
	Inicializar(v,vUlt);
	LeerPelicula(p);
	while (p.codigo <> -1) do 
	begin
		 AgregarAlFinal(v[p.genero],vUlt[p.genero], p);
		 LeerPelicula(p);
    end;

end;

procedure ObtenerMaximos (v:vector; var vCont:vectorContador);
	
	procedure BuscarMaximos (pI:lista; var max:maxInfo);
	var aux:lista;
	begin
		aux:=pI;
		max.puntaje:= -1;
		max.codigo:=0;
		while (aux <> nil)do
		begin
			 if (aux^.dato.puntaje > max.puntaje) then
			 begin
				  max.puntaje:=aux^.dato.puntaje;
				  max.codigo:=aux^.dato.codigo;
			 end;
			 aux:=aux^.sig;
	    end;
	end;

var i:integer;
maximo:maxInfo;
begin
	for i:=1 to 8 do
	begin
		 BuscarMaximos(v[i],maximo);
		 vCont[i].codigo:= maximo.codigo;
		 vCont[i].puntaje:= maximo.puntaje;
	end;
end;

procedure OrdenarVectorInsercion(var v:vectorContador);
var i,j:integer;
info:maxInfo;
begin
	 for i:=2 to 8 do
	 begin
		  info:=v[i];
		  j:=i-1;
		  while(j > 0) and (v[j].puntaje > info.puntaje) do
		  begin
			   v[j+1]:=v[j];
			   j:=j-1;
	      end;
	      v[j+1]:=info;
	 end;

end;

procedure ImprimirVector(v:vector);
var i:integer; aux:lista;
begin
	 for i:=1 to 8 do
	 begin
		  aux:=v[i];
		  writeln('-- GENERO ', i ,' --');
		  while(aux <> nil) do
		  begin
			   writeln('CODIGO: ', aux^.dato.codigo, ' | PUNTAJE: ', aux^.dato.puntaje:2:2 );
			   aux:=aux^.sig;
		  end;
     end;
end;
procedure ImprimirVectorContador(v:vectorContador);
var i:integer;
begin
	 for i:=1 to 8 do
	 begin
		  writeln('CODIGO : ', v[i].codigo , ' | PUNTAJE: ',v[i].puntaje:2:2 , ' | GENERO: ', i);
	 end;
end;

var	peliculas:vector;
vContador:vectorContador;
begin
	 randomize;
	 CargarDatos(peliculas);
	 ImprimirVector(peliculas);
	 ObtenerMaximos (peliculas,vContador);
	 writeln();
	 ImprimirVectorContador(vContador);
	 writeln();
	 OrdenarVectorInsercion(vContador);
	 ImprimirVectorContador(vContador);
	 writeln('El codigo de la pelicula con mayor puntaje es: ', vContador[8].codigo, ' y el codigo con menor puntaje es: ', vContador[1].codigo);
end.
