
package Practica2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class ejercicio4 {
    public static void main (String []args){
        GeneradorAleatorio.iniciar();
        Persona [][]casting = new Persona[5][8];
        int [] cont = new int [5];
        
        String [] v = new String [5]; // VECTOR DE NOMBRES (PRUEBA); 
        v[0]="Sofia"; v[1]="Leon"; v[2]= "Marcos"; v[3]="Benja"; v[4]="ZZZ"; 
        
        String nombre; int dni,edad, DF =40, dimL=0, dia,pos;
        
        nombre = v[GeneradorAleatorio.generarInt(5)];
        while (( !nombre.equals("ZZZ")) && (dimL < DF)){
            
            do{ System.out.println("Ingrese dia: ");
            dia = Lector.leerInt();
            }while ((dia <1) ||(dia >5));
         
            if(cont[dia-1] < 8){
                pos = cont[dia-1];
                dni = GeneradorAleatorio.generarInt(100);
                edad = GeneradorAleatorio.generarInt(91);
                casting [dia-1][pos] = new Persona (nombre,dni,edad);
                dimL++;
                cont[dia-1]++;
            }else {
                System.out.println("El dia " + dia + " esta completo.");
            }
            
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
        System.out.println();
        int cant;
        for (i=0; i<5; i++){ 
            cant=0;
            for (j=0; j<8 ; j++){
                if (casting [i][j] != null){
                cant++;
                }
            }
            System.out.println("Dia " + (i+1) + " | Cantidad de inscriptos: " + cant);
        }
    }
}
