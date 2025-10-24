
package Practica4;

public class Persona {
    private String nombre;
    private int DNI;
    private int edad; 
    
    public Persona(String unNombre, int unDNI, int unaEdad){
        setNombre(unNombre);
        setDNI(unDNI);
        setEdad(unaEdad); 
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + getNombre() +
              ", mi DNI es " + getDNI() + 
              " y tengo " + getEdad() + 
              " años.";
        return aux;
    }
    
    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
       
    
}

