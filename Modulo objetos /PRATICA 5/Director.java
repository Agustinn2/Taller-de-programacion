
package Practica5;

public class Director extends Persona {
    private int antiguedad;
     public Director(String nombre, int dni, int edad, int antiguedad){
         super(nombre,dni,edad);
         setAntiguedad(antiguedad);
     }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    
}
