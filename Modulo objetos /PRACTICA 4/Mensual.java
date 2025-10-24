
package Practica4;


public class Mensual extends Sistema {
    
    public Mensual (String nombre, double latitud, double longitud, int anioInicial , int cantAnios){
        super(nombre, latitud, longitud, anioInicial, cantAnios);
    }

    public double calcularPromedio (int unMes){
    double suma =0;
    for (int i=0; i < this.getCantAnios(); i++){
        suma += this.obtenerTemperatura(unMes, i+this.getAnioInicial());
    }
    return suma / this.getCantAnios();
    }
    
    public String toString (){
    String [] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};    
    String aux= super.toString();
        for (int i=0; i < 12; i++){
            aux+= "- " + meses[i] + ": " + String.format("%.1f",this.calcularPromedio(i+1)) + " ºC; \n";
    }
        return aux;
    }
}
