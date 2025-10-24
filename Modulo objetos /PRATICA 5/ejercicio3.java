
package Practica5;


public class ejercicio3 {
    public static void main(String[] args) {
        EventoOcasional unEvento = new EventoOcasional("Charly garcia", 3, 3, "Agustin", "30/06/2025");
        Fecha f1 = new Fecha("Mar del Plata", "25/06/2025");
        Fecha f2 = new Fecha ("La Plata", "07/12/2025");
        Fecha f3= new Fecha ("Berazategui", "10/12/2025");
        Fecha f4 = new Fecha ("Quilmes", "02/02/2025");
        
        
        Gira unaGira = new Gira("No te va Gustar", 3, "La ultima gira", 3);
        
        unaGira.agregarFecha(f1);
        unaGira.agregarFecha(f2);
        unaGira.agregarFecha(f3);
        unaGira.agregarFecha(f4);
        
        unEvento.agregarTema("Bohemian Rhapsody");
        unEvento.agregarTema("Hotel California");
        unEvento.agregarTema("Nose1");
        unEvento.agregarTema("Nose2");
        unaGira.agregarTema("Bohemian Rhapsody");
        unaGira.agregarTema("Hotel California");
        unaGira.agregarTema("Nose1");
        unaGira.agregarTema("Nose2");
        
        System.out.println(unaGira.actuar());
        System.out.println(unaGira.actuar());
        System.out.println(unaGira.actuar());
        System.out.println(unaGira.actuar());
        System.out.println();
        System.out.println(unEvento.actuar());
        
        System.out.println("Costo gira:" + unaGira.calcularCosto() );
        System.out.println("Costo evento: " + unEvento.calcularCosto());
        
    }
}
