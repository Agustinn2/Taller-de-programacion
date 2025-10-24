
package Practica3;
import PaqueteLectura.GeneradorAleatorio;

public class ejercicio4 {
    public static void main(String[] args) {
        int DF = 10;
        Hotel unHotel = new Hotel (DF);
        GeneradorAleatorio.iniciar();
        Cliente unCliente;
            
        for (int i=0; i<DF; i++){
            unCliente = new Cliente(GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarInt(400),GeneradorAleatorio.generarInt(91));
            unHotel.ingresarCliente(GeneradorAleatorio.generarInt(DF), unCliente);
        }
        System.out.println(unHotel.toString());
        unHotel.aumentarPrecio(1000);
        System.out.println(unHotel.toString());
    }
}
