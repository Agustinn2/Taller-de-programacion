
package Practica1;

import PaqueteLectura.GeneradorAleatorio;

public class ejercicio2 {
    public static void main (String [] args){
         //Paso 2: Declarar la variable vector de double 
        double [] vector;
        //Paso 3: Crear el vector para 15 double 
        vector = new double [15];
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i, df = 15,cant = 0; double suma =0, prom;
        
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i=0; i < df; i++){
            vector [i]= GeneradorAleatorio.generarDouble(200-140 + 1) + 140;
            suma += vector[i];
        }
        for (i=0; i < df; i++){
            System.out.printf("%.2f%n",vector[i]);
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        prom = suma / df;
        System.out.println("El promedio de alturas es: " +prom);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (i=0; i < df; i++){
            if (vector[i] > prom){
                cant += 1;
            }        
        }
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de alturas que superan el promedio son: " + cant);
    }
}
