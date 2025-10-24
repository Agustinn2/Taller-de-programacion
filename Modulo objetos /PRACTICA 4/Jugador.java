
package Practica4;

public class Jugador extends Empleado{
    private int partidosJugados;
    private int goles;

    public Jugador(String nombre, double sueldo, int antiguedad, int partidosJugados, int goles) {
        super(nombre,sueldo,antiguedad);
        setPartidosJugados(partidosJugados);
        setGoles(goles);
    }
    
    public int getPartidosJugados() {
        return partidosJugados;
    }

    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    
    public double calcularEfectividad (){
        double aux = ((double) getGoles() / getPartidosJugados());
        return aux;
    }
    
    public double calcularSueldoACobrar (){
        double sueldo = super.calcularSueldoACobrar();
        if (calcularEfectividad() > 0.5){
            sueldo += this.getSueldo();
        }
        return sueldo;
    }
    
    public String toString (){
        String aux = "Jugador --> " + super.toString() +
                     " Goles anotados: " + getGoles();
        return aux;
    }
    
}
