
package Practica5;

public class Auto {
    private String nombreDuenio;
    private String patente;

    public Auto (String nombreDuenio, String patente){
        setNombreDuenio(nombreDuenio);
        setPatente(patente);
    }
    
    
    public String getNombreDuenio() {
        return nombreDuenio;
    }

    public void setNombreDuenio(String nombreDuenio) {
        this.nombreDuenio = nombreDuenio;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public String toString (){
       String aux= " Nombre dueño: " + getNombreDuenio() + ", Patente: " + getPatente() + " ";
       return aux;
    }
    
    
    
}
