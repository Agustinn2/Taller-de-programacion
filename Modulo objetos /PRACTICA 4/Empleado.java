
package Practica4;

public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    
    public Empleado (String nombre, double sueldo, int antiguedad){
        setNombre(nombre);
        setSueldo(sueldo);
        setAntiguedad(antiguedad);
    }
    
    public String toString (){
        String aux = "Nombre: " + getNombre() +
                     " Sueldo Basico: " + getSueldo() +
                     " Antiguedad: " + getAntiguedad()+
                     " Efetividad: " + this.calcularEfectividad()*100 + "%" +
                     " Sueldo a cobrar: " + this.calcularSueldoACobrar();
        return aux;
    
    }
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public abstract double calcularEfectividad ();
    
    public double calcularSueldoACobrar (){
    double aux = getSueldo() + (getSueldo()*0.10*getAntiguedad());
    return aux;
    }
    
}
