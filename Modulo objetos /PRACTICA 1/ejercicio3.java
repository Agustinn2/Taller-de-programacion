
package Practica1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class ejercicio3 {
    public static void main (String []args){
        GeneradorAleatorio.iniciar();
        int [][] matriz = new int [5][5];
        int i,j, DF = 5;
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
       for (i=0; i < DF; i++ ){
           for (j=0; j < DF; j++){
               matriz[i][j]=GeneradorAleatorio.generarInt(31);
           }    
       }
        //Paso 4. mostrar el contenido de la matriz en consola
        for (i=0; i < DF; i++ ){
            System.out.println(" ");
           for (j=0; j < DF; j++){
               System.out.print( matriz[i][j]+ " | ");
           }
       }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int suma=0, fila = 1;
        for (j=0; j <DF; j++){
            suma += matriz[fila][j];
        }
        System.out.println();
        System.out.println();
        System.out.println("La suma de la fila "+ fila + " es: "+ suma);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz.
        int [] vector = new int [5];
        for (j=0; j< DF; j++){
            suma =0;
            for (i=0; i< DF; i++){
                suma += matriz[i][j];
            }
            vector[j]= suma;
        }
        //    Luego, imprima el vector.
        
        for (i=0; i < DF; i++){
            System.out.print(vector[i] + " | ");
        }
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println();
        System.out.println("Ingresar valor a buscar: ");
        int valor = Lector.leerInt();
        i=0 ; boolean encontre = false;
        
        while ((i < DF) && (!encontre)){
            j=0;
            while ((j < DF) && (!encontre)){
                if (matriz [i][j] == valor){
                    encontre =true;
                } else {
                j++; }
            }
            if(!encontre){
                i++;}
        }   
    if (encontre){
        System.out.println("Valor encontrado en pos(" + i + "," + j + ")");
    }else {
        System.err.println("Valor no encontrado");
    }
    }
}
