
package Practica2;

import PaqueteLectura.GeneradorAleatorio;

public class ejercicio3 {
    public static void main (String []args){
        GeneradorAleatorio.iniciar();
        Persona [][]casting = new Persona[5][8];
        
        String [] v = new String [5]; // VECTOR DE NOMBRES (PRUEBA); 
        v[0]="Sofia"; v[1]="Leon"; v[2]= "Marcos"; v[3]="Benja"; v[4]="ZZZ"; 
        
        String nombre; int dni,edad, DF =40, dimL=0;
        
        nombre = v[GeneradorAleatorio.generarInt(5)];
        while (( !nombre.equals("ZZZ")) && (dimL < DF)){
            dni = GeneradorAleatorio.generarInt(100);
            edad = GeneradorAleatorio.generarInt(91);
            
            int fila = dimL / 8;
            int col = dimL % 8;
            
            casting [fila][col] = new Persona (nombre,dni,edad);
            dimL ++;
            nombre = v[GeneradorAleatorio.generarInt(5)];
            
        }
     
        System.out.println("Datos cargados: " + dimL);
        int i,j;
        for (i=0; i<5; i++){
            System.out.println();
            System.out.print("---> Dia " + (i+1) + ": ");
            for (j=0; j<8; j++){
                if (casting [i][j] != null){
                System.out.print( " " +casting[i][j].getNombre() + " | ");
                }else 
                    System.out.print(" Vacio | ");
            }
        }
    }
}
