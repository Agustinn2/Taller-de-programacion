program ejericio1;

const dimF = 300;

type 
	 expensa = record
		codigoIde:integer;
		dniPropietario:integer;
		valor : real;
	 end;
	 
	 vector = array [1..dimF] of expensa;
	 
	 
procedure CargarInformacionExpensa(var v:vector; var dimL:integer);
	
	procedure CargarExpensa(var e:expensa);
	begin
		 e.codigoIde:= random (20);
		 if (e.codigoIde <> 0)then
		 begin
			e.dniPropietario:= 1000 + random (2000 - 1000 + 1);
			e.valor:= random (50) *100;
		 end;
	end;


var e:expensa;
begin
	randomize;
	dimL:=0;
	CargarExpensa(e);
	while (e.codigoIde <> 0)do
	begin
		 dimL:=dimL + 1;
		 v[dimL]:= e;
		 CargarExpensa(e);
	end;
end;

procedure OrdenarVectorInsercion (var v:vector; dimL:integer);
var i,j:integer;
	e:expensa;
begin
	 for i:=2 to dimL do
	 begin
		  j:=i-1;
		  e:= v[i];
		  while (j > 0) and (v[j].codigoIde > e.codigoIde)do
		  begin
			   v[j+1]:= v[j];
			   j:= j-1;
		  end;
		  
		 v[j+1]:=e;
	 end;
	
end;

procedure ImprimirVector(v:vector; dimL:integer);
var i :integer;
begin
	for i:=1 to dimL do
	begin
		writeln ('Oficina || Codigo identificacion: ', v[i].codigoIde, ' DNI propietario: ', v[i].dniPropietario, ' Valor: ', v[i].valor:0:2);
	end;

end;

procedure InformarBusqueda (v:vector; dimL:integer);

	procedure BusquedaDicotomica (v:vector; dimL, cod:integer; var pos:integer);
	var ini,fin,medio:integer;
	begin
		 pos:=0;
		 ini:=1;
		 fin:=dimL;
		 medio:= (ini + fin) div 2;
		 while (ini <= fin)and (v[medio].codigoIde <>  cod)do
		 begin
			  if (cod < v[medio].codigoIde)then
					fin:=medio -1
			  else 
				  ini:=medio + 1;
			  medio:=(ini + fin)div 2;
		 end;
		 if (ini <= fin) and (v[medio].codigoIde = cod)then
			pos:=medio;	
	end;
	
var pos,cod:integer;
begin
	writeln ('Ingresar codigo de oficina: ');
	readln (cod);
	BusquedaDicotomica(v,dimL,cod,pos);
	if (pos = 0)then
		writeln ('No se encontro dicha oficina.')
	else
		writeln ('El dni de dicha oficina es: ', v[pos].dniPropietario);
end;
function CalcularMontoTotal(v:vector; dimL:integer):real;

begin
	 if(dimL = 0)then
	    CalcularMontoTotal:=0
	 else
		CalcularMontoTotal:= v[dimL].valor + CalcularMontoTotal(v,dimL-1);
end;

var v:vector;
	dimL:integer;
	montoTotal:real;
begin
	CargarInformacionExpensa(v,dimL);
	if (dimL = 0)then
		writeln ('Vector vacio.')
	else begin
	OrdenarVectorInsercion(v,dimL);
	ImprimirVector (v,dimL);
	InformarBusqueda(v,dimL);
	montoTotal:= CalcularMontoTotal(v,dimL);
	writeln('El monto total de expensa es: ',montoTotal:0:2);
	end;
end.
