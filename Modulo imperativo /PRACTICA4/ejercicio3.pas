program ejercicio3;

type	
	producto = record
	  codigo:integer;
	  cantidadTotal:integer;
	  montoTotal:real;
	end;
	
	venta = record
		codVenta:integer;
		codProducto:integer;
		cantUnidad:integer;
		precioUnitario:integer;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato:producto;
		HI:arbol;
		HD:arbol;
	end;


procedure GenerarArbol (var a:arbol);

	procedure CargarUnaVenta(var v:venta);
	begin
		 writeln('Ingrese codigo de venta: ');
		 readln(v.codVenta);
		 if (v.codVenta <> -1)then
		 begin
			v.codProducto:= 100 + random(50)*100;
			v.cantUnidad:= 1 + random (10);
			v.precioUnitario:= 500 + random(2000 - 500 + 1);
		end;
	end;
	

	Function CalcularMontoTotal(precioU:integer; cant:integer):real;
	begin
		 CalcularMontoTotal:= precioU * cant;
	end;
	
	procedure CargarProducto(var p:producto; v:venta);
	begin
		 p.codigo:= v.codProducto;
		 p.cantidadTotal:= v.cantUnidad;
		 p.montoTotal:=CalcularMontoTotal(v.precioUnitario , v.cantUnidad);
	end;
	
	procedure InsertarVenta(var a:arbol; v:venta);
	var p:producto;
	begin
		 if(a = nil)then begin
			new (a);
			CargarProducto(p,v);
			a^.dato:=p;
			a^.HI:=nil;
			a^.HD:=nil;
		  end
		  else if(a^.dato.codigo = v.codProducto)then
		  begin
			a^.dato.cantidadTotal:= a^.dato.cantidadTotal + v.cantUnidad;
			a^.dato.montoTotal:= a^.dato.montoTotal + CalcularMontoTotal(v.precioUnitario , v.cantUnidad)
		  end
		  else if (v.codProducto < a^.dato.codigo) then
			InsertarVenta(a^.HI,v)
		  else
			InsertarVenta(a^.HD,v);
	end;

var unaVenta:venta;
begin
	randomize;
	a:=nil;
	CargarUnaVenta(unaVenta);
	while (unaVenta.codVenta <> -1)do
	begin
		 InsertarVenta(a,unaVenta);
		 CargarUnaVenta(unaVenta);
	end;

end;

procedure ImprimirArbol(a:arbol);
	procedure InformarProductosVendidos (a:arbol);
	begin
		if(a <> nil)then
		begin
			InformarProductosVendidos(a^.HI);
			writeln ('Codigo: [',a^.dato.codigo,'] Cantidad Total: [', a^.dato.cantidadTotal ,'] Monto Total: [', a^.dato.montoTotal:0:2, ']');
			InformarProductosVendidos(a^.HD);
		end;
	end;


begin
	writeln(' ------- PRODUCTOS VENDIDOS -------');
	if(a = nil)then writeln('Arbol Vacio')
	else begin
		InformarProductosVendidos(a);
	end;
	writeln;
	writeln;
end;

procedure InformarProductoMayorVentas(a:arbol);

	{procedure BuscarCodigoMayorCantidad(a:arbol; var codMax,cantMax:integer);
	
		procedure actualizarMaximo (var codMax,cantMax:integer; codigo,cant:integer);
		begin
			 if (cant > cantMax)then
			 begin
				 cantMax:=cant;
				 codMax:=codigo;
			 end;
	    end;
	    
	begin
		 if (a <> nil) then
		 begin
			 actualizarMaximo(codMax,cantMax, a^.dato.codigo, a^.dato.cantidadTotal);
			 BuscarCodigoMayorCantidad(a^.HI,codMax,cantMax);
			 BuscarCodigoMayorCantidad(a^.HD,codMax,cantMax);
		end;
	end; }
	
	 procedure RecorrerArbol(a:arbol; var maxCod,maxCant:integer);
		
		procedure actualizarMaximo (var codMax,maxCant:integer; codigo,cant:integer);
		begin
			 if (cant > maxCant)then
			 begin
				 maxCant:=cant;
				 codMax:=codigo;
			 end;
	    end;
	    
	 begin
		 if (a <> nil) then
		 begin
			 actualizarMaximo(maxCod,maxCant, a^.dato.codigo, a^.dato.cantidadTotal);
			 RecorrerArbol(a^.HI,maxCod,maxCant);
			 RecorrerArbol(a^.HD,maxCod,maxCant);
		 end;
	 end;

	 function BuscarCodigoMayorCantidad (a:arbol):integer;
	 var maxCant,maxCod:integer;
	 begin
		  maxCant:=-1; maxCod:=-1;
		  RecorrerArbol(a,maxCod,maxCant);
		  BuscarCodigoMayorCantidad:=maxCod;
	 end;	  
		  
var mayorCodigo:integer;
begin
	writeln(' ------- Codigo de producto con mayor cantidad de unidades vendidas -------');
	writeln;
	mayorCodigo:=BuscarCodigoMayorCantidad(a);
	if (mayorCodigo = -1) then writeln('Arbol vacio')
	else
		writeln('El codigo es: ',mayorCodigo);
	writeln;
	writeln;
end;

procedure InformarCantidadMenoresQueUnValor (a:arbol);
	
	 function CalcularCantidad (a:arbol; valor:integer):integer;
	 begin
		  if (a = nil)then CalcularCantidad:= 0
		  else if (a^.dato.codigo < valor)then
				CalcularCantidad:= 1 + CalcularCantidad(a^.HI,valor) + CalcularCantidad(a^.HD,valor)
		  else
				CalcularCantidad:= CalcularCantidad (a^.HI,valor);
	end;
	
var valor,cant:integer;
begin
	writeln(' ------- Cantidad de codigos menores que un valor -------');
	writeln;
	writeln('Ingrese un valor: ');
	readln(valor);
	cant:= CalcularCantidad(a,valor);
	writeln('Cantidad de codigos menores al valor ', valor, ' son: ', cant);
	writeln;
	writeln;
end;


procedure InformarMontoTotalEntreDosRangos(a:arbol);

	function CalcularMontoTotal(a:arbol; valor1,valor2:integer):real;
	begin
		 if(a = nil)then 
			CalcularMontoTotal:=0
		 else if (a^.dato.codigo > valor1) and (a^.dato.codigo < valor2) then
			CalcularMontoTotal:= a^.dato.montoTotal + CalcularMontoTotal(a^.hI,valor1,valor2) + CalcularMontoTotal(a^.HD,valor1,valor2)
		 else if (a^.dato.codigo < valor1) then
			CalcularMontoTotal:= CalcularMontoTotal(a^.HD, valor1,valor2)
		 else
			CalcularMontoTotal:= CalcularMontoTotal(a^.HI,valor1,valor2);
	end;


var monto:real;valor1,valor2:integer;
begin
	 writeln(' ------- Monto total entre dos rangos -------');
     writeln;
     writeln ('Ingrese valor 1: ');
     readln (valor1);
     writeln ('Ingrese valor 2: ');
     readln(valor2);
     if(valor1 < valor2)then
		monto:=CalcularMontoTotal(a,valor1,valor2)
	 else
		monto:=CalcularMontoTotal(a,valor2,valor1);
	if(monto <> 0)then
		writeln ('El monto total entre el valor ',valor1, ' y ', valor2, ' es: ',monto:0:2);
	writeln;
	writeln;	
end;


var a:arbol;
begin
	GenerarArbol(a);
	ImprimirArbol(a);
	InformarProductoMayorVentas(a);
	InformarCantidadMenoresQueUnValor(a);
	InformarMontoTotalEntreDosRangos(a);
end.
