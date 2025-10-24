
package Practica4;

public class Anual extends Sistema{
    
    public Anual (String nombre, double latitud, double longitud, int anioInicial , int cantAnios){
        super(nombre, latitud, longitud, anioInicial, cantAnios);
    }
    
    public double calcularPromedio(int unAnio){
    double suma=0;
      for (int i=0; i< 12; i++){
          suma += this.obtenerTemperatura(i+1,unAnio);
      }
      return suma/12;
    }
    
    
    public String toString (){
        String aux = super.toString();
        for (int i=0; i < this.getCantAnios();i++){ 
            aux += "- Año " + (i+this.getAnioInicial()) + ": " + String.format("%.1f",calcularPromedio(i + this.getAnioInicial()))+ " ºC; \n";
        }
     return aux;
    } 
}

