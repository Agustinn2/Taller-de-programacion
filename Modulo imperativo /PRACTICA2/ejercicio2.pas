program ejercicio2;

const dimF = 300;

type 
	oficina = record
		codigoIde:integer;
		dniPropietario:integer;
		valorExpensa:real;
	end;
	
	vector = array [1..dimF] of oficina;




procedure cargarOficinas (var v:vector; var dimL:integer);

     procedure LeerOficina(var o:oficina);
     begin
		  writeln('Ingrese codigo de identificacion: ');
		  readln(o.codigoIde);
		  if(o.codigoIde <> -1) then
		  begin
			o.dniPropietario:= random(2000);
			o.valorExpensa:=random (100000);
		  end;
     end;

var
o:oficina;
begin

	LeerOficina(o);
	while (o.codigoIde <> -1) and (dimL < dimF) do
	begin
		 dimL:=dimL+1;
		 v[dimL]:=o;
		 LeerOficina(o);
	end;
end;

procedure ImprimirVector(v:vector; dimL:integer);
var i:integer;
begin
	for i:=1 to dimL do
	begin
		writeln ('Ide: ', v[i].codigoIde, ' | DNI: ',v[i].dniPropietario, ' | VALOR: $',v[i].valorExpensa:2:2);
	end;
end;
procedure OrdenarVectorInsercion(var v:vector; dimL:integer);
var i,j :integer; 
o:oficina;
begin
	 for i:=2 to dimL do 
	 begin
		o:=v[i];
		j:=i-1;
		while (j > 0) and (v[j].codigoIde > o.codigoIde)do
		begin	
			 v[j+1]:=v[j];
			 j:= j -1; 
		end;
		
		v[j+1]:=o;
	end;

end;

procedure OrdenarVectorSeleccion(var v:vector; dimL:integer);
var i,j,pos: integer;
o:oficina;
begin
	 for i:=1 to dimL-1 do 
	 begin
		pos:=i;
		for j:= i+1 to dimL do
		begin
			if(v[j].codigoIde < v[pos].codigoIde)then pos:=j;
		end;
		
		o:= v[pos];
		v[pos]:=v[i];
		v[i]:= o;

	end;
end;

var v:vector;
dimL:integer;
begin
	randomize;
	dimL:=0;
	cargarOficinas(v,dimL);
	ImprimirVector(v,dimL);
	OrdenarVectorInsercion(v,dimL);
	writeln();
	ImprimirVector(v,dimL);
	OrdenarVectorSeleccion(v,dimL);
	ImprimirVector(v,dimL);
end.
