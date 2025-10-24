program ejercicio4;

procedure BinarioRecursivo (valor:integer);
begin
	if (valor < 2)then
	begin
		write( valor )
	end
	else
	begin
		 BinarioRecursivo(valor div 2);
		 write ( valor mod 2 );
	end;
end;



var valor:integer;
begin
	write('Ingrese numero decimal (0 para finalizar): ');
	read(valor);
	while(valor <> 0)do
	begin
		write('Su numero a binario es: ');
		BinarioRecursivo(valor);
		writeln();
		writeln();
		write('Ingrese numero decimal: ');
		read(valor);
	end;
	
end.
