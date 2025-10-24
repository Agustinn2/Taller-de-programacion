program ejercicio2;



type rangoDia = 1..31;
	 venta = record
	   codigo:integer;
	   fecha:rangoDia;
	   cantidad:integer;
	 end;
	 
	 vendidos = record
		codigo:integer;
		cantidad:integer;
	 end;
	 
	 
	 vendidosL = record
		fecha:rangoDia;
		cantidad:integer;		
	 end;
		
		
	 lista = ^nodo;
	 
	 nodo = record
		dato:vendidosL;
		sig:lista;
     end;
	 
	 arbol = ^nodoArbol;
	 
	 nodoArbol = record
		dato:venta;
		HI:arbol;
		HD:arbol;
	 end;
	 
	 arbol2 = ^nodoArbol2;
	 
	 nodoArbol2 = record
		dato:vendidos;
		HI: arbol2;
		HD: arbol2;
	 end;
	 
	 arbol3  = ^nodoArbol3;
	 
	 nodoArbol3 = record
		codigo:integer;
		dato:lista;
		HI:arbol3;
		HD:arbol3;
	end;

	 


procedure GenerarArboles(var a: arbol; var a2:arbol2; var a3:arbol3);
	
	procedure CargarVenta(var v:venta; var v2:vendidos; var v3:vendidosL);
	begin
		 v.codigo:= random (30) ;
		 if (v.codigo <> 0)then
		 begin
			v.fecha:= 1 + random (31);
			v.cantidad:= 1 + random(10);
			v2.codigo:=v.codigo;
			v2.cantidad:=v.cantidad;
			v3.fecha:=v.fecha;
			v3.cantidad:=v.cantidad; 
		 end;
    end;
    
    procedure InsertarElemento (var a :arbol; dato:venta);
	begin
		 if (a = nil) then
		 begin
			  new (a);
			  a^.dato:= dato;
			  a^.HI:=nil;
			  a^.HD:=nil;
		 end
		 else 
		 begin
			if(dato.codigo < a^.dato.codigo)then
			begin
				InsertarElemento(a^.HI,dato);
			end 
			else
			begin
				InsertarElemento(a^.HD,dato);
			end;
	     end;   
	end;

	procedure InsertarElemento2(var a:arbol2; dato:vendidos);
	begin
		 if (a = nil) then
		 begin
			  new (a);
			  a^.dato:= dato;
			  a^.HI:=nil;
			  a^.HD:=nil;
		 end
		 else 
		 begin
			if(dato.codigo < a^.dato.codigo)then
			begin
				InsertarElemento2(a^.HI,dato);
			end 
			else
			begin
				if(dato.codigo > a^.dato.codigo)then
				begin
					InsertarElemento2(a^.HD,dato);
				end
				else
				begin
					a^.dato.cantidad:=a^.dato.cantidad + dato.cantidad;
				end; 
			end;
	     end;   
	end;
	
	
	
	procedure InsertarElemento3 (var a:arbol3; dato: vendidosL; codigo:integer);
	
		procedure AgregarLista(var pI:lista; dato:vendidosL);
		var nuevo:lista;
		begin
			new (nuevo);
			nuevo^.dato:=dato;
			nuevo^.sig:=pI;
			pI:=nuevo;
		end;
	
	
	begin
		if (a = nil)then
		begin
			new (a);
			a^.dato:=nil;
			a^.codigo:=codigo;
			AgregarLista(a^.dato,dato);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
		begin
			if (codigo < a^.codigo )then
			begin
				InsertarElemento3(a^.HI,dato,codigo)
			end
			else
			begin
				if(codigo > a^.codigo) then
				begin
					InsertarElemento3(A^.HD,dato,codigo);
				end
				else
				begin
					AgregarLista(a^.dato,dato);
				end;
			end;
		end;
	end;
	
var unaVenta:venta; v2:vendidos; v3:vendidosL;
begin
	a:=nil;
	a2:=nil;
	a3:=nil;
	randomize;
	CargarVenta(unaVenta,v2,v3);
	while (unaVenta.codigo <> 0) do
	begin
		InsertarElemento(a,unaVenta);
		InsertarElemento2(a2,v2);
		InsertarElemento3(a3,v3,unaVenta.codigo);
		CargarVenta(unaVenta,v2,v3);
	end;
end;


procedure ImprimirArboles(a: arbol; a2:arbol2; a3:arbol3);

	Procedure ImprimirVentas(a:arbol);
	begin
		if (a <> nil)then
		begin
			 ImprimirVentas(a^.HI);
			 writeln('CODIGO: ',a^.dato.codigo ,' FECHA: ',a^.dato.fecha, ' CANTIDAD: ',a^.dato.cantidad);
			 ImprimirVentas(a^.HD)
		end;
		
	end;
	
	Procedure ImprimirVentasA2(a:arbol2);
	begin
		if (a <> nil)then
		begin
			 ImprimirVentasA2(a^.HI);
			 writeln('CODIGO: ',a^.dato.codigo, ' CANTIDAD TOTAL: ',a^.dato.cantidad);
			 ImprimirVentasA2(a^.HD)
		end;
	end;
	
	Procedure ImprimirVentasA3(a:arbol3);
		
		Procedure ImprimirVentasPorProducto(pI:lista; cod:integer);
		begin
			 if(pI <> nil)then
			 begin
				writeln('FECHA: ',pI^.dato.fecha, ' CANTIDAD : ',pI^.dato.cantidad);
				ImprimirVentasPorProducto(pI^.sig,cod);
			 end
		end;
	
	
	begin
		if (a <> nil)then
		begin
			 ImprimirVentasA3(a^.HI);
			 writeln('----- VENTAS DEL PRODUCTO CODIGO ', a^.codigo,' ----- ');
			 ImprimirVentasPorProducto(a^.dato, a^.codigo);
			 writeln();
			 ImprimirVentasA3(a^.HD);
		end;
		
	end;

begin
	writeln;
	writeln ('----- Informacion de ventas ----->');
	writeln;
	if (a = nil)then writeln('No hay ventas registradas.')
	else begin
			ImprimirVentas(a);
			writeln;
			writeln('----- ARBOL 2 ----->');
			writeln;
			ImprimirVentasA2 (a2);
			writeln;
			writeln('----- ARBOL 3 ----->');
			writeln;
			ImprimirVentasA3 (a3)
		 end;

	writeln;
	writeln ('//////////////////////////////////////////////////////////');
	writeln;
end;

Function CantidadTotalVendidos (a:arbol; fecha:rangoDia):integer;
var total:integer;
begin
	if (a = nil)then
	begin
		CantidadTotalVendidos:= 0;
	end
	else
	begin
		 total:=0;
		 if (a^.dato.fecha = fecha)then
		  begin
			 total:=a^.dato.cantidad;
		  end;
		total:= total + CantidadTotalVendidos(a^.HI,fecha) + CantidadTotalVendidos(a^.HD,fecha);
		CantidadTotalVendidos:=total;
	end;
end;

procedure BuscarProductoMayorVentas(a:arbol2);

	procedure BuscarCodigo(a:arbol2; var maxCant,maxCode:integer);
	
		procedure actualizarMaximo(var maxCode,maxCant:integer; cod,cant:integer);
		begin
			if (cant > maxCant)then
			begin
				maxCant:=cant;
				maxCode:=cod;
			end;
		end;
	begin
		if (a <> nil)then
		begin
			actualizarMaximo(maxCode,maxCant,a^.dato.codigo,a^.dato.cantidad);
			BuscarCodigo(a^.HI,maxCant,maxCode);
			BuscarCodigo(a^.HD,maxCant,maxCode);
		end;
	end;
	

var maxCode,maxCant:integer;
begin
	 maxCant:=-1;
	 BuscarCodigo(a,maxCant,maxCode);
	 if (maxCant <> -1)then
	 begin
		writeln('El codigo con mayor ventas de unidades es: ', maxCode);
     end
     else
     writeln('No hay productos registrados.');
end;
procedure BuscarCodListaMayorVentas (a:arbol3);
		
		function ContarVentasLista (pI:lista):integer;
		var cant:integer;
		begin
			 cant:=0;
			 while (pI <> nil) do
			 begin
				  cant:=cant +1;
				  pI:= pI^.sig;
			 end;
		    ContarVentasLista:=cant;
		end;
		
				  
		procedure actualizarMaximo(codigo,cant:integer; var codMax,cantMax:integer);
		begin
			if (cant > cantMax)then
			begin
				cantMax:=cant;
				codMax:=codigo;
			end;
		end;		 

		procedure RecorrerArbol(a:arbol3; var codMax,cantMax:integer);
		var cant:integer;
		begin
			 if(a <> nil)then
			 begin
				 cant:= ContarVentasLista(a^.dato);          // cantidad de nodos en la lista.
				 actualizarMaximo(a^.codigo,cant, codMax,cantMax);
				 RecorrerArbol(a^.HI,codMax, cantMax);
				 RecorrerArbol(a^.HD,codMax, cantMax);
			end;
		end;


var codMax, cantMax:integer;
begin
	cantMax:=-1;
	RecorrerArbol(a,codMax,cantMax);
	if (cantMax <> -1)then
	begin
		writeln ('El codigo con mayor ventas es: ', codMax);
	end
	else
		writeln( 'No hubo ventas registradas.');
end;


var a:arbol;
a2:arbol2;
a3:arbol3;
fecha:rangoDia;
begin
	GenerarArboles (a,a2,a3);
	ImprimirArboles(a,a2,a3);
	writeln('Ingrese fecha: ');
	readln(fecha);
	writeln;
	writeln('En el dia ',fecha,' se vendio ',CantidadTotalVendidos(a,fecha), ' productos.');
	writeln;
	BuscarProductoMayorVentas(a2);
	writeln;
	BuscarCodListaMayorVentas(a3);
end.
