program ejercicio2;
const dimF = 50;

type 
vector = array [1..dimF] of integer;

procedure CargarVector(min,max:integer; var v:vector;var cant:integer);
var 
ale:integer;
begin
	randomize;
	ale:= min + random (max - min + 1);
	while(ale <> 0) and (cant < dimF )do
	begin
	     cant:=cant + 1;
	     v[cant]:= ale;
		 ale:= min + random (max - min + 1);
    end;
end;

procedure ImprimirVector(v:vector; dimL:integer);
var i:integer;
begin
	for i:=1 to dimL do
	begin
		writeln('numero ', i , ': ', v[i]);
    end;
end;

procedure ImprimirVectorInverso(v:vector; dimL:integer);
var i:integer;
begin
	for i:=dimL downto 1 do
	begin
		writeln('numero ', i , ': ', v[i]);
    end;
end;
var
min,max,dimL: integer;
v:vector;
begin
	dimL:=0;
	writeln('Ingrese minimo: ');
	readln(min);
	writeln('Ingrese maximo: ');
	readln(max);
	CargarVector(min,max,v,dimL);
	ImprimirVector(v,dimL);
	writeln();
	ImprimirVectorInverso(v,dimL);
end.
