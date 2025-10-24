
package Practica4;
import PaqueteLectura.GeneradorAleatorio;
public class ejercicio4 {
    public static void main(String[] args) {
        Anual unSistemaAnual = new Anual("La Plata",-34.921, 57.955, 2021, 3);
        Mensual unSistemaMensual = new Mensual("Mar del Plata", -38.002, -57.556, 2020, 4);
        GeneradorAleatorio.iniciar();
        for (int i=0; i<unSistemaAnual.getCantAnios(); i++){
            for (int j=0; j < 12; j++){
                unSistemaAnual.registrarTemperatura(j+1, i+unSistemaAnual.getAnioInicial(), GeneradorAleatorio.generarDouble(50));
            }
        }
        for (int i=0; i<unSistemaMensual.getCantAnios(); i++){
            for (int j=0; j < 12; j++){
                unSistemaMensual.registrarTemperatura(j+1, i+unSistemaMensual.getAnioInicial(), GeneradorAleatorio.generarDouble(50));
            }
        }
        
        System.out.println(unSistemaAnual.toString());
        System.out.println(unSistemaAnual.anoYMesMayorTemperatura());
        System.out.println();
        System.out.println(unSistemaMensual.toString());
        System.out.println(unSistemaMensual.anoYMesMayorTemperatura());
        }
}
