
package Practica3;
import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
    private double costo;
    private Cliente cliente;
    
    public Habitacion() {
        GeneradorAleatorio.iniciar();
        this.costo = GeneradorAleatorio.generarDouble(8000-2000)+2000;
    }
    
    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    
}
