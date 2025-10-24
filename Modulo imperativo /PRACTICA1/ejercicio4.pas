program ejercicio4;

type rangoRubro = 1..6;

	
	producto = record
		codigo:integer;
		codigoRubro:rangoRubro;
		precio:real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato:producto;
		sig:lista;
	end;
	
	vector = array [rangoRubro] of lista;
	vectorRubros = array [1..20] of producto;
	
procedure CargarDatos(var v:vector);

	procedure InsertarOrdenado(var pI:lista; p:producto);
	var nuevo,ant,act:lista;	
	begin
		 new (nuevo);
		 nuevo^.dato:=p;
		 nuevo^.sig:=nil;
		 
		 if(pI = nil)then pI:=nuevo
		 else
		 begin
			ant:=pI; act:=pI;
			while(act <> nil) and (act^.dato.codigo < nuevo^.dato.codigo)do
			begin
				 ant:=act;
				 act:=act^.sig;
			end;
			
			if(act = pI) then
			begin	
				nuevo^.sig:=pI;
				pI:=nuevo;
			end
			
			else
			begin
				if(act <> nil)then
				begin
					ant^.sig:=nuevo;
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
	procedure LeerProducto (var p:producto);
	begin
		writeln('Ingrese precio del producto: ' );
		readln(p.precio);
		if(p.precio <> -1)then
		begin
			p.codigo:=random(2000);
			p.codigoRubro:=  1 + random (6);
		end;
	end;
	procedure Inicializar(var v:vector);
	var i:integer;
	begin
		for i:=1 to 6 do
		begin
			v[i]:=nil;
		end;
	end;
	
var
p:producto;
begin
	Inicializar(v);
	LeerProducto(p);
	while (p.precio <> -1) do
	begin
		 InsertarOrdenado(v[p.codigoRubro],p);
		 LeerProducto(p);
	end;
end;

procedure ImprimirVector(v:vector);
var i:integer;
aux:lista;
begin
	for i:=1 to 6 do
	begin
	     aux:=v[i];
		 writeln(' ---- RUBRO ',i,' ----');
		 while(aux <> nil) do
		 begin
			 writeln('CODIGO: ', aux^.dato.codigo, ' PRECIO: ', aux^.dato.precio:2:2);
		     aux:=aux^.sig;
		 end;
	end;
end;


procedure CargarVectorRubro(pI:lista;var v:vectorRubros; var dimL:integer);
var aux:lista; 
begin
	 aux:=pI;
     dimL:=0;
	 while(dimL < 20) and (aux <> nil)do
	 begin
		  dimL:=dimL + 1;
		  v[dimL]:=aux^.dato;
		  aux:=aux^.sig;
     end;
end;
procedure ImprimirVectorRubro(v: vectorRubros; dimL: integer);
var
  i: integer;
begin
  writeln();
  writeln('Productos del rubro 3 (maximo 20):');
  for i := 1 to dimL do
    writeln('Codigo: ', v[i].codigo, '  Precio: ', v[i].precio:2:2);
end;


procedure OrdenarVectorSeleccion(var v:vectorRubros; dimL:integer );
var pos,j,i:integer;
item:producto;
begin
	 for i:=1 to dimL-1 do
	 begin
		 pos:=i;
		 for j:=i+1 to dimL do
		 begin
			if (v[j].precio < v[pos].precio) then pos:=j;
		 end;
		 
		item:=v[pos];
		v[pos]:= v[i];
		v[i]:=item;
	end;

end;

function CalcularPromedio(v:vectorRubros; dimL:integer):real;
var i:integer;
total:real; prom:real;
begin
	 total:=0;
	 for i:=1 to dimL do
	 begin
		total:= total + v[i].precio;
	 end;
	 if (dimL > 0)then prom:= total / dimL
	 else prom:=0;	 
	 
CalcularPromedio:=prom;
end;
var
	rubros:vector;
	vRubros:vectorRubros; dimL:integer;
begin
	 randomize;
	 CargarDatos(rubros);
	 ImprimirVector(rubros);
	 CargarVectorRubro(rubros[3],vRubros,dimL);
	 ImprimirVectorRubro(vRubros, dimL);
	 OrdenarVectorSeleccion(vRubros,dimL);
	 ImprimirVectorRubro(vRubros, dimL);
	 writeln('El promedio de precio de RUBRO 3 es: ', CalcularPromedio(vRubros,dimL):2:2);
end.
