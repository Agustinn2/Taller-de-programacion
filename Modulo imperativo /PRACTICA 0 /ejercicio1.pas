
program NumAleatorio;

procedure ImprimirNumerosAleatorios ();
var ale,i: integer;
begin
 randomize;                                             
 for i:=1 to 20 do
 begin
	ale := random (100);
	writeln ('El numero aleatorio generado es: ', ale);
  end;
end;

procedure ImprimirNumerosN(N,A,B:integer);
var ale,i:integer;
begin
    randomize;
    for i:=1 to N do
    begin
         ale:= A + random(B - A + 1);
         writeln('Numero ', i , ': ', ale);
    end;
end;
procedure ImprimirHastaF(F,A,B:integer);
var 
ale,cont:integer;
begin
	randomize;
	ale:=A + random(B - A + 1);
	cont:=1;
	while(ale <> F)do
	begin
        writeln('Numero ',cont, ': ', ale);
        ale:=A + random(B - A + 1);
        cont:= cont + 1;
    end;
end;
var
N,A,B,F:integer;
begin
   ImprimirNumerosAleatorios();
   writeln('Ingrese N: ');
   readln(N);
   writeln('Ingrese A');
   readln(A);
   writeln('Ingrese B');
   readln(B);
   ImprimirNumerosN(N,A,B);
   writeln('Ingrese F: ');
   readln(F);
   writeln('Ingrese A');
   readln(A);
   writeln('Ingrese B');
   readln(B);
   ImprimirHastaF(F,A,B)
end.
