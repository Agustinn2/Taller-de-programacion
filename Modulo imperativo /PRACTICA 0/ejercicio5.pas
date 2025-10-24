program ejer5;

type 
	rangoCliente = 0..50;
	rangoActividad = 1..5;

	fecha = record
		dia:integer;
		mes:integer;
		ano:integer;
	end;
	
	 cliente = record
		codigo:rangoCliente;
		actividad:rangoActividad;
		asistencia:fecha;
	 end;
	 
	 vector = array [rangoActividad] of integer;
	 
	 lista = ^nodo;
	 
	 nodo = record
		elem:cliente;
		sig: lista;
	 end;
	  
	 
procedure CargarListaOrdenada(var pI:lista; c:cliente);
var ant,act,nuevo:lista;

begin
	 new (nuevo);
	 nuevo^.elem:= c;
	 nuevo^.sig:= nil;
	 
	 if(pI = nil) then pI:=nuevo
	 else
	 begin
		ant:=pI; act:=pI;
		while(act <> nil) and (act^.elem.codigo < nuevo^.elem.codigo) do
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
			if(act<> nil)then
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

procedure ImprimirLista(pI:lista);
var aux:lista;
begin
	aux:=pI;
	while(aux <> nil) do
	begin
		writeln('codigo de cliente: ', aux^.elem.codigo);
		writeln('actividad: ', aux^.elem.actividad);
		writeln('ano: ',aux^.elem.asistencia.ano, ' mes: ',aux^.elem.asistencia.mes, ' dia: ',aux^.elem.asistencia.dia );
		writeln();
		aux:=aux^.sig;
	end;
end;

function CalcularAsistencia(pI:lista; valor:integer):integer;
var aux:lista;
cant:integer;
begin
	 aux:=pI;
	 cant:=0;
	 while(aux <> nil) do
	 begin
		if(aux^.elem.codigo = valor) then
		begin
			cant:=cant + 1;
		end;
	 aux:=aux^.sig;
	 end;
	CalcularAsistencia:= cant;
end;
procedure ContarAsistenciaPorActividad (pI:lista;var  v:vector);
var i:integer;
aux:lista;
begin
	 aux:=pI;
	 for i:=1 to 5 do 
	 begin
		v[i]:=0;
     end;
     while(aux <> nil)do
     begin
		v[aux^.elem.actividad]:= v[aux^.elem.actividad] + 1;
		aux:=aux^.sig;
	 end;
end;

function CalcularMax (v:vector): integer;
var maxAct,maxAsis,i:integer;
begin
	 maxAct:=-1;
	 maxAsis:=-1;
	 for i:=1 to 5 do
	 begin
		if(v[i] > maxAsis)then
		begin
			maxAsis:=v[i];
			maxAct:=i;
	    end;
	 end;
CalcularMax:=maxAct;

end;




var pri:lista;
c:cliente;
num:integer;
contador:vector;
begin
	pri:=nil;
	randomize;
	c.codigo:= random(20);
	while(c.codigo <> 0) do
	begin
		c.asistencia.dia:=random(30);
		c.asistencia.mes:=random(12);
		c.asistencia.ano:= 2020 + random(2025 - 2020 + 1);
		c.actividad:= 1 + random(4);
		CargarListaOrdenada(pri,c);
		c.codigo:=random(20);
	end;
    ImprimirLista(pri);
    writeln('Ingrese numero de cliente: ');
    readln(num);
    writeln('El cliente tiene ', CalcularAsistencia(pri, num), ' dias de asistencia.');
    ContarAsistenciaPorActividad(pri,contador);
    writeln('La actividad con mas asistencia es el numero: ', CalcularMax(contador));
end.
