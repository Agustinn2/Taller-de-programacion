
package Practica5;

public class Gira extends Recital{
    private String nombreGira;
    private Fecha [] fechas;
    private int maxFechas;
    private int dimL;
    private int fechaActual;
    
    public Gira (String nombreBanda, int cantCanciones, String nombreGira, int maxFechas){
        super(nombreBanda,cantCanciones);
        setNombreGira(nombreGira);
        this.maxFechas = maxFechas;
        this.fechas = new Fecha [maxFechas];
    }
    private boolean estaLleno (){
    return this.dimL == this.maxFechas;
    }
    
    public void agregarFecha (Fecha unaFecha){
        if (!estaLleno()){
            this.fechas[this.dimL] = unaFecha;
            this.dimL++;
            System.out.println("Se registro la fecha correctamente.");
        }else {
            System.out.println("Limite de fechas alcanzado.");
        }
    }
    
    public double calcularCosto(){
    double costo = 30000 * this.dimL;
    return costo;
    }
    
    public String actuar (){
        String aux;
        if (this.fechaActual < this.dimL){
            aux = "Buenas noches: " + this.fechas[this.fechaActual].toString() + "\n";
            aux += super.actuar();
            this.fechaActual++;
        }else {
            aux = "La gira ha terminado.";
        }
    return aux;
    }
    
    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }
    

    
}
