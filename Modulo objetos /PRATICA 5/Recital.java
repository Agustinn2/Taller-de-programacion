
package Practica5;

public abstract class  Recital {
    private String nombreBanda;
    private int cantCanciones;
    private int cancionActual;
    private String [] listaCanciones;


    public Recital(String nombreBanda, int cantCanciones){
        this.listaCanciones = new String [cantCanciones];
        setNombreBanda(nombreBanda);
        setCantCanciones(cantCanciones);
        
    }
    
    private boolean estaLleno (){
       return this.cancionActual == getCantCanciones();
    }
    
    public void agregarTema (String tema){
    
        if(!estaLleno()){
            this.listaCanciones[cancionActual]= tema;
            this.cancionActual++;
            System.out.println("Cancion agregada correctamente.");
            
        }else {
            System.out.println("Limite de canciones alcanzado.");
        }
    
    }
    
    
    public abstract double calcularCosto();
    
    
    public String actuar (){
    String aux= "";
    for (int i=0; i < this.cancionActual; i++){
        aux += "y ahora tocaremos... " + this.listaCanciones[i] + " \n";
    }
    return aux;
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public int getCantCanciones() {
        return cantCanciones;
    }

    public void setCantCanciones(int cantCanciones) {
        this.cantCanciones = cantCanciones;
    }


}
