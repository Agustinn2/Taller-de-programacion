
package Practica5;
import PaqueteLectura.Lector;

public class ejercicio2 {
    public static void main(String[] args) {
        Estacionamiento unEstacionamiento = new Estacionamiento("AURA PURA", "Av la plata 2323", "6:00", "18:00", 3,3);
       
        Auto a1 = new Auto("Juan Pérez", "AB123CD");
        Auto a2 = new Auto("María López", "AC987FG");
        Auto a3 = new Auto("Carlos Díaz", "AD456HJ");
        Auto a4 = new Auto("Laura Gómez", "AE321KL");
        Auto a5 = new Auto("Andrés Silva", "AF654MN");
        Auto a6 = new Auto("Sofía Torres", "AG789PR");  
        
        unEstacionamiento.registrarAuto(a1, 1, 1);
        unEstacionamiento.registrarAuto(a2, 2, 1);
        unEstacionamiento.registrarAuto(a3, 1, 3);
        unEstacionamiento.registrarAuto(a4, 3, 1);
        unEstacionamiento.registrarAuto(a5, 2, 2);
        unEstacionamiento.registrarAuto(a6, 3, 3);
        
        System.out.println(unEstacionamiento.toString());
        
        System.out.println("La cantidad de autos ubicado en la plaza 1 es: " + unEstacionamiento.cantidadAutosEnPlaza(1));
        
        System.out.println("Ingrese patente a buscar: ");
        String unaPatente = Lector.leerString();
        
        System.out.println(unEstacionamiento.devolverPisoYPlaza(unaPatente));
        
        
    }
}
