
package Practica5;

public class ejercicio1 {
    public static void main(String[] args) {
        Proyecto unProyecto = new Proyecto("ProyectoX", 6663, "Roberto Carlos");
        Investigador i1,i2,i3;
        
        i1 = new Investigador("Agustin", 4, "Programador");
        i2 = new Investigador("Nazareno", 2, "Analista");
        i3 = new Investigador( "Facundo", 5, "ChatGpt");
        
      
        i1.agregarUnSubsidio(new Subsidio(10000, "Materiales"));
        i1.agregarUnSubsidio(new Subsidio(20000, "Equipos"));

        i2.agregarUnSubsidio(new Subsidio(15000, "Viaje"));
        i2.agregarUnSubsidio(new Subsidio(25000, "Conferencias"));

        i3.agregarUnSubsidio(new Subsidio(12000, "Software"));
        i3.agregarUnSubsidio(new Subsidio(18000, "Consultoría"));
        
        unProyecto.agregarInvestigador(i1);
        unProyecto.agregarInvestigador(i2);
        unProyecto.agregarInvestigador(i3);
        
        unProyecto.otorgarTodos("Agustin");
        
        System.out.println(unProyecto.toString());
        
    }
}
