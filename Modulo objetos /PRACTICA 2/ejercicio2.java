
package Practica2;

import PaqueteLectura.GeneradorAleatorio;

public class ejercicio2 {
    public static void main (String []args){
        int  DF = 15;
        Persona [] vector = new Persona [DF];
        GeneradorAleatorio.iniciar();
        
        String unNombre; 
        int dimL = 0,unaEdad, unDni;

        unaEdad = GeneradorAleatorio.generarInt(89);
        while ((dimL < DF) && (unaEdad != 0)) {
            unNombre = GeneradorAleatorio.generarString(6);
            unDni = GeneradorAleatorio.generarInt(100);
            vector[dimL]= new Persona(unNombre,unDni,unaEdad);
            dimL ++;
            unaEdad = GeneradorAleatorio.generarInt(89);
        }
        
        // Imprimir vector..
        int i;
        for (i=0; i<dimL; i++){
            System.out.println("Nombre: " + vector[i].getNombre() + " DNI: " + vector[i].getDNI() + " Edad: " + vector[i].getEdad());
        }
        
        // Calcular edades mayores a 65.
        int cant=0;
        for (i=0; i < dimL; i++){
            if (vector[i].getEdad() > 65){
                cant++;
            }
        }
        System.out.println("La cantidad de personas mayores a 65 es: " + cant);
        
        // Mostrar representacion de persona con menor DNI.
      
        if (dimL > 0){
            int min= 999999; Persona menor = null;
            
        for (i=0; i <dimL; i++){
            if (vector [i].getDNI() < min){
                min = vector[i].getDNI();
                menor = vector[i];
            }
        }
        System.out.println(menor.toString());   
        } else 
            System.out.println("No se cargaron personas.");
        
       /* if (dimL > 0){ 
            int min=99999, posMin = 0;
        for (i=0; i< dimL; i++){
            if (vector[i].getDNI() < min){
                min= vector[i].getDNI();
                posMin = i;
            }
        }
        System.out.println(vector[posMin].toString());
        }else
            System.out.println("No se cargaron personas."); */
   }
}
