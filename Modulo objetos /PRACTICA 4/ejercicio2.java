
package Practica4;


public class ejercicio2 {
    public static void main (String[]args){
        
        Jugador unJugador = new Jugador("Merentiel", 20000, 5, 10, 10);
        Entrenador unEntrenador = new Entrenador("Russo", 30000, 5, 2);
        
        System.out.println(unJugador.toString());
        System.out.println(unEntrenador.toString());
    
    }
}
