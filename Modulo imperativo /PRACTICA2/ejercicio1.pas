program ejercicio1;

const dimF = 15;
      min = 10;
      max = 155;
type vector = array [1..dimF] of integer;
     

procedure CargarVector (var v: vector; var dimL: integer);

  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var valor: integer;
  begin
    valor:= min + random (max - min + 1);
    if ((valor <> 20 ) and (dimL < dimF)) 
    then begin
          dimL:= dimL + 1;
          v[dimL]:= valor;
          CargarVectorRecursivo (v, dimL);
         end;
  end;
  
begin
  dimL:= 0;
  CargarVectorRecursivo (v, dimL);
end;
 
procedure ImprimirVector (v: vector; dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        write(v[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('----');
     writeln;
     writeln;
End;     

procedure ImprimirVectorRecursivo (v: vector; dimL: integer);
begin    
     if(dimL <> 0)then
     begin
     	 ImprimirVectorRecursivo(v,dimL - 1);
     	 writeln('numero: ',v[dimL]);
     end;
end; 


    
function Sumar (v: vector; dimL: integer): integer; 

  function SumarRecursivo (v: vector; pos, dimL: integer): integer;

  Begin
    if (pos <= dimL)  
    then SumarRecursivo:= SumarRecursivo (v, pos + 1, dimL) + v[pos]  
    else SumarRecursivo:=0  
  End;
 
var pos: integer; 
begin
 pos:= 1;
 Sumar:= SumarRecursivo (v, pos, dimL);
end;

function  ObtenerMaximo (v: vector; dimL: integer): integer;

	function BuscarMaximoRecursivo (v:vector; dimL,max:integer):integer;
	begin
		 if(dimL <> 0)then
		 begin
			  if(v[dimL] > max)then
			  begin
				 max:=v[dimL];
			  end;
		     BuscarMaximoRecursivo:= BuscarMaximoRecursivo(v,dimL-1,max);
	     end
	     else
	     BuscarMaximoRecursivo:=max;
	end;


var max:integer;
begin
	max:=-1;
	ObtenerMaximo:=BuscarMaximoRecursivo(v,dimL,max);
end;     
     
function  BuscarValor (v: vector; dimL, valor: integer): boolean;

	function BuscarRecursivo (v:vector; dimL,valor:integer; esta:boolean ):boolean;
	begin
		if(dimL <> 0) and (not esta)then
		begin
			if(v[dimL] = valor)then
			begin
				esta:=true;
			end;
			BuscarRecursivo:= BuscarRecursivo(v,dimL-1,valor,esta);
		end
		else
			BuscarRecursivo:=esta;
	end;
				
var esta:boolean;
begin
	esta:=false;
	BuscarValor:= BuscarRecursivo(v,dimL,valor,esta);
end; 

procedure ImprimirDigitos(v:vector; dimL:integer);

	procedure ImprimirDigitosRecursivo(valor:integer);
	begin
		if (valor >= 10)then
		begin
			ImprimirDigitosRecursivo(valor div 10);
		end;
		write(' ',valor mod 10);
	end;
	
var i:integer;
begin    
     for i := 1 to dimL do
	 begin
		  write('Digitos del numero ', v[i], ':');
          ImprimirDigitosRecursivo(v[i]);
          writeln();
	 end;	        		
          
end; 

var dimL, suma, maximo, valor: integer; 
    v: vector;
    encontre: boolean;
Begin
  randomize;
  CargarVector (v, dimL);
  writeln;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                       ImprimirVector (v, dimL);
                      ImprimirVectorRecursivo (v, dimL);
                     end;
  writeln;
  writeln;                   
  suma:= Sumar(v, dimL);
  writeln;
  writeln;
  writeln('La suma de los valores del vector es ', suma); 
  writeln;
  writeln;
  maximo:= ObtenerMaximo(v, dimL);
  writeln;
  writeln;
  writeln('El maximo del vector es ', maximo); 
  writeln;
  writeln;
  write ('Ingrese un valor a buscar: ');
  read (valor);
  encontre:= BuscarValor(v, dimL, valor);
  writeln;
  writeln;
  if (encontre) then writeln('El ', valor, ' esta en el vector')
                else writeln('El ', valor, ' no esta en el vector');
                
  writeln;
  writeln;
  ImprimirDigitos (v, dimL);
end.
