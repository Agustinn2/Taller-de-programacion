procedure OrdenarInsercion (var v:vector);
var valor, j,i:integer;

begin
	for i:=2 to dimF do
	begin
		valor:=v[i];
		j:=i-1;
		while(j > 0) and ( v[j] > valor )do
		begin
			v[j+1]:= v[j];
			j:=j-1;
		end;
		v[j+1]:=valor;
	end;

end;


procedure OrdenarSeleccion (var v:vector);
var j,i,pos,valor:integer;
begin
	for i:=1 to dimF-1 do
	begin
		pos:=i;
		for j:=i+1 to dimF do
		begin
			if(v[j] < v[pos])then pos:=j;
		end;
		
		valor:= v[pos];
		v[pos]:= v[i];
		v[i]:= valor;
	end;
end;


procedure busquedaDicotomica(v:vector; ini,fin:indice; valor:integer; var pos:indice);
var medio:indice;

begin
	pos:=-1;
	medio:=(ini + fin) div 2;
	while (ini <= fin) and (v[medio] <> valor)do
	begin
		 if (valor < v[medio])then
		 begin
			  fin:= medio -1;
		 end
		 else
		 begin
			ini:=medio + 1;
		 end;
		 medio:= (ini + fin) div 2;
	end;
	
	if (ini <= fin) and (v[medio] = valor)then
	begin
		pos:=medio;
	end;
end;











{TENIENDO DIML}

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


procedure ImprimirVectorRecursivo (v: vector; dimL: integer);
begin    
     if(dimL <> 0)then
     begin
     	 ImprimirVectorRecursivo(v,dimL - 1);
     	 writeln('numero: ',v[dimL]);
     end;
end; 


{NO TENIENDO DIML}


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

procedure ImprimirVector(v:vector; pos:integer);
begin
	 if(pos <= dimF)then
	 begin
		 writeln(v[pos]);
		 ImprimirVector(v,pos + 1);
	 end;
end;
