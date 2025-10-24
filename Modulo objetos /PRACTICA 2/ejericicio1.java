package Practica2;
import PaqueteLectura.Lector;

public class ejercicio1 {
    public static void main (String[]args){
        Persona unaPersona ;
        System.out.println("Ingrese nombre: ");
        String unNombre = Lector.leerString();
        System.out.println("Ingrese DNI: ");
        int unDni = Lector.leerInt();
        System.out.println("Ingrese edad: ");
        int unaEdad = Lector.leerInt();
        unaPersona = new Persona(unNombre,unDni,unaEdad);   
        System.out.println(unaPersona.toString());
        
    }
}
