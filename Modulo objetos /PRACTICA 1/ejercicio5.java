
package Practica1;

import PaqueteLectura.Lector;
public class ejercicio5 {
    public static void main (String []args){
        int [][] calificacion = new int [5][4];
        String [] vector = new String [4];
        
        vector [0] = "Atencion al cliente: ";
        vector [1] = "Calidad de la comida: ";
        vector [2] = "Precio: ";
        vector [3] = "Ambiente: ";
        
        int i,j, valor;
        for (i=0; i< 5; i++){
            System.out.print("Cliente " + (i+1) +" | Ingrese valoracion del 1..10 ");
            System.out.println();
            for (j=0; j<4; j++){
                do {
                    System.out.print(vector[j]);
                    valor = Lector.leerInt();
                } while (valor < 1 || valor > 10);
                  calificacion[i][j] = valor;
            }
        }
        
        for (i=0; i<5; i++){
            System.out.println();
            for (j=0; j<4; j++){
                System.out.print(calificacion[i][j] +" | ");
            }
        }
        System.out.println();
        double suma;
        for (j=0; j<4; j++){
            suma=0;
            for (i=0; i<5; i++){
                suma += calificacion[i][j];
            }
            System.out.println("Promedio de " + vector[j] + (suma/5));
        }
        
    } 
}
