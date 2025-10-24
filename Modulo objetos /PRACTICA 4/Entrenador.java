
package Practica4;

public class Entrenador extends Empleado {
    private int campeonatosGanados;

    public Entrenador(String nombre,double sueldo,int antiguedad,int campeonatosGanados) {
        super(nombre,sueldo,antiguedad);
        setCampeonatosGanados(campeonatosGanados);
    }
    
    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    public double calcularEfectividad(){
        double aux = ((double)getCampeonatosGanados()/ this.getAntiguedad()); 
        return aux;
    }
    
    public double calcularSueldoACobrar (){
        double sueldo = super.calcularSueldoACobrar();
        if (this.getCampeonatosGanados() > 10){
            sueldo += 50000.00;
        }else if (this.getCampeonatosGanados() >= 5){
            sueldo += 30000.00;
        }else if (this.getCampeonatosGanados() >= 1){
            sueldo += 5000.00;
        }
        return sueldo;
    }
    
    public String toString (){
        String aux = "Entrenador --> " + super.toString() +
                     " Campeonatos ganados: " + getCampeonatosGanados();
        return aux;
    }
    
    
}
