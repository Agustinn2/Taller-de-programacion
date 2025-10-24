program ejercicio3;

const dimF = 20;
	  min = 300;
	  max = 1550;
type indice = -1..dimF;
	 vector = array [1..dimF] of integer;
	 

procedure CargarVector(var v:vector);
	
	procedure  CargarVectorRecursivo(var v:vector; pos:integer);
	begin
		if(pos <= dimF)then
		begin
			v[pos]:= min + random(max - min +1);
			CargarVectorRecursivo(v,pos + 1);
		end;
	end;

begin
	 randomize;
	 CargarVectorRecursivo(v,1);

end;

procedure OrdenarVectorInsercion (var v:vector);
var i,j:integer; valor:integer;
begin
	 for i:=2 to dimF do
	 begin
		j:=i-1;
		valor:=v[i];
		while (j > 0) and (v[j] > valor)do
		begin
			 v[j+1]:=v[j];
			 j:=j-1;
		end;
		v[j+1]:=valor;
	 end;
end;

{ procedure OrdenarVectorSeleccion (var v:vector);
var i,j,pos:integer;
valor:integer;
begin 
	for i:=1 to dimL-1 do
	begin
		pos:=i;
		for j:=i+1 to dimL do
		begin
			if(v[j] < v[pos])then pos:=j;
		end;
		
		valor := v[pos];
		v[pos]:= v[i];
		v[i]:=valor;
	end;
end; }

Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
var medio:indice;
begin
	 pos:=-1;
	 medio:=(ini + fin) div 2;
	 while (ini <= fin) and (v[medio] <> dato)do
	 begin
		  if(dato < v[medio])then
		  begin
			   fin:=medio - 1;
		  end
		  else
		  begin
			   ini:=medio + 1;
		  end;
		  medio:= (ini+fin) div 2;
	 end;

	 if (ini <= fin) and (dato = v[medio])then
	 begin
		pos:=medio;
	 end;
end;

procedure ImprimirVector(v:vector; pos:integer);
begin
	 if(pos <= dimF)then
	 begin
		 writeln(v[pos]);
		 ImprimirVector(v,pos + 1);
	 end;
end;


var v:vector;
ini,fin,pos:indice;
valor:integer;
begin
	ini:=1; fin:=dimF;
	CargarVector(v);
	OrdenarVectorInsercion(v);
	ImprimirVector(v,1);
	writeln('Ingrese valor a buscar: ');
	readln(valor);
	busquedaDicotomica(v,ini,fin,valor,pos);
	if(pos <> -1)then
	begin
		writeln('El valor se encuentra en el vector en la posicion: ', pos);
	end
	else writeln('El valor no se encuentra en el vector.');
end.
