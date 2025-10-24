
package Practica5;

public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre; 
    private Auto [][] plazas;
    private int pisos;
    private int plazasPorPiso;
    
    public Estacionamiento (String nombre, String direccion){
        setHoraApertura("8:00");
        setHoraCierre("21:00");
        setNombre(nombre);
        setDireccion(direccion);
        this.pisos= 5;
        this.plazasPorPiso = 10;
        plazas = new Auto[this.pisos][this.plazasPorPiso];
            
        }

    public Estacionamiento (String nombre, String direccion, String horaApertura, String horaCierre,int N,int M){
        setNombre(nombre);
        setDireccion(direccion);
        setHoraApertura(horaApertura);
        setHoraCierre(horaCierre);
        this.pisos = N;
        this.plazasPorPiso =M;
        
        plazas = new Auto [this.pisos][this.plazasPorPiso];
    
    }
    
    
    public void registrarAuto (Auto A,int X, int Y){
        this.plazas[X-1][Y-1]= A;
        System.out.println("Auto registrado correctamente.");
    }
    
    public String devolverPisoYPlaza (String patente){
    String aux= "Auto Inexistente";
    for (int i=0; i<this.pisos; i++){
        for (int j=0; j< this.plazasPorPiso; j++){
            if (this.plazas[i][j] != null && this.plazas[i][j].getPatente().equals(patente)) {
                aux = "El auto se encuentra en el piso " + (i+1) + " y plaza " + (j+1);
                
            }
        }
    }
    return aux;
    }
    
    public String toString (){
        String aux = "";
        for (int i=0; i< this.pisos; i++){
            aux += "\n";
            for (int j=0; j < this.plazasPorPiso; j++){
                aux += "Piso " + (i+1) + " Plaza: " + (j+1) + ": ";
                if (this.plazas[i][j] != null){
                    aux+= this.plazas[i][j].toString();
                
                }else {aux+= " Libre ";}
            
            }
        }
       return aux;
    }
    public int cantidadAutosEnPlaza(int Y){
     int cant=0;
        for (int i=0; i< this.pisos; i++){
            if (this.plazas[i][Y-1] != null){
                cant++;
            }
        }
    return cant;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }

    public String getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }
    
    
    
}
