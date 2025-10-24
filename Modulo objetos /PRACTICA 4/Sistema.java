
package Practica4;


public abstract class Sistema {
    private String nombre;
    private double latitud;
    private double longitud;
    private int anioInicial;
    private int cantAnios;
    private double[][] temperaturas;

    public Sistema(String nombre, double latitud, double longitud, int anioInicial , int cantAnios){
        setNombre(nombre);
        setLatitud(latitud);
        setLongitud(longitud);
        setAnioInicial(anioInicial);
        setCantAnios(cantAnios);
        this.temperaturas = new double[cantAnios][12];
        for (int i=0; i < cantAnios; i++){
            for (int j = 0; j < 12; j++){
                this.temperaturas[i][j] = 999999;
            }
        
        }
     }
    
    public String toString (){
        String aux = getNombre() + "(" + getLatitud() + " S - " + getLongitud() + " O)" + "\n" ;
    return aux;
    }
    
    public abstract double calcularPromedio(int x);
    
    private  boolean anioEnRango (int anio){
        boolean aux = anio >= getAnioInicial() && anio <= (getAnioInicial()+getCantAnios()-1);
        return aux;
    }
    
    private boolean mesEnRango (int mes){
        boolean aux = mes >= 1 && mes<=12;
        return aux;
    }

    public void registrarTemperatura(int mes, int anio, double temp){
    if (anioEnRango(anio) && mesEnRango(mes)){
        this.temperaturas[anio - getAnioInicial()][mes-1] = temp;
        System.out.println("Se registro temperatura.");
        
    }else
            System.out.println("Fuera del rango (mes o año).");
    
    }
    
    public double obtenerTemperatura (int mes, int anio){
        double aux = 999999;
        if (anioEnRango(anio) && mesEnRango(mes)){
                aux = this.temperaturas[anio - getAnioInicial()][mes-1];
        }
        return aux;
    }
    
    public String anoYMesMayorTemperatura (){
        double maxTemp = -99999; String aux ="";
        for (int i=0; i < getCantAnios(); i++){
            for (int j=0; j < 12; j++){
                if (this.temperaturas[i][j] > maxTemp){
                    maxTemp = this.temperaturas[i][j];
                    aux = "En el anio " + (getAnioInicial()+i) +", mes " + (j+1) +" se registro la mayor temperatura con: " + this.temperaturas[i][j]; 
                }
            }
        }
        return aux;
    }
    
    
        
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    public int getAnioInicial() {
        return anioInicial;
    }

    public void setAnioInicial(int anioInicial) {
        this.anioInicial = anioInicial;
    }

    public int getCantAnios() {
        return cantAnios;
    }

    public void setCantAnios(int cantAnios) {
        this.cantAnios = cantAnios;
    }

    
    
    
}
