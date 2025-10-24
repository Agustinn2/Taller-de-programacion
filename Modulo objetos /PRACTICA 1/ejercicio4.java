
package Practica1;

import PaqueteLectura.GeneradorAleatorio;

public class ejercicio4 {
    public static void main (String []args){
        int [][] edificio = new int [8][4];
        int piso,oficina;
        
        GeneradorAleatorio.iniciar();
        
        for (piso=0; piso < 8; piso++){
            for (oficina=0; oficina < 4; oficina++){
                edificio[piso][oficina]= 0;
            }
        }
        
        piso = GeneradorAleatorio.generarInt(9);
        while (piso != 8){
            oficina = GeneradorAleatorio.generarInt(4);
            edificio[piso][oficina] += 1;
            piso = GeneradorAleatorio.generarInt(9);
        }
        
        // Informar edificio 
        for (piso=0; piso < 8; piso++){
            System.out.println();
            for (oficina=0; oficina < 4; oficina++){
                System.out.print( edificio[piso][oficina]+" | ");
            }
        }
        
    }
}
