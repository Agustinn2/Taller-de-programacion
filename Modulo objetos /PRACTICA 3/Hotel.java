
package Practica3;

public class Hotel {
    private Habitacion [] habitaciones;
    private int DF;
    
    public Hotel(int N) {
        DF = N;
        habitaciones = new Habitacion[DF];
        for (int i=0; i < DF; i++){
            habitaciones[i]= new Habitacion();
        }
    }

    public Habitacion [] getHabitaciones() {
        return habitaciones;
    }
    
    public void ingresarCliente (int num, Cliente cliente) {
        if (this.habitaciones[num].getCliente()  == null){
            this.habitaciones[num].setCliente(cliente);
        }else{
            System.out.println("Habitacion ocupada.");
        }
    }
    
    public void aumentarPrecio (double valor){
        for (int i=0; i< DF; i++){
           habitaciones [i].setCosto(habitaciones[i].getCosto() + valor);
        }
        System.out.println("Se aumento correctamente.");
    }

    @Override
    public String toString() {
      String aux = "";
      for (int i=0; i<DF; i++){
          aux += "Habitacion " + (i+1) +": "+ habitaciones[i].getCosto() + ", ";
          if (habitaciones[i].getCliente() != null){
              aux += "Ocupada, " + habitaciones[i].getCliente().toString();
          }else{
              aux += "Libre. \n";
          }
      }
      return aux;
    }
    
    
}
