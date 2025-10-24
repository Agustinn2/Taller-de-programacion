package Practica1;

import PaqueteLectura.GeneradorAleatorio;

public class ejercicio1 {
    public static void main (String[]args){
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        
        System.out.println("2x" + "5" + "="+ tabla2[5]);

    GeneradorAleatorio.iniciar();
    int num = GeneradorAleatorio.generarInt(12);
    while (num != 11){
        System.out.println("2 x " + num + " = " + tabla2[num]);
        num = GeneradorAleatorio.generarInt(12);
    }
    }
}
