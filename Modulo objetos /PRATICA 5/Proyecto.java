
package Practica5;

public class Proyecto {
    private String nombre ;
    private int codigo;
    private String nombreDirector;
    private Investigador [] investigadores;
    private int maxInvestigadores = 50;
    private int cantInvestigadores;
    
    
    
    public Proyecto (String nombre, int codigo,String nombreDirector){
        setNombre(nombre);
        setCodigo(codigo);
        setNombreDirector(nombreDirector);
        investigadores = new Investigador [maxInvestigadores];
        
    }
    private boolean estaLleno (){
        return this.cantInvestigadores == this.maxInvestigadores;
    }
            
            
    public void agregarInvestigador(Investigador unInvestigador){
        if (!estaLleno()){
            this.investigadores[this.cantInvestigadores]= unInvestigador;
            this.cantInvestigadores++;
            System.out.println("Investigador registrado exitosamente.");
        }else {System.out.println("No hay más lugares disponibles para investigadores.");}
    }
    
    
    public double dineroTotalOtorgadoProyecto() {
        double suma=0;
        for (int i=0; i < this.cantInvestigadores; i++){
            suma += this.investigadores[i].dineroTotalOtorgado();
        }
        return suma;
    }
    
    public void otorgarTodos (String nombreCompleto){
        for (int i=0; i < this.cantInvestigadores; i++){
            if (this.investigadores[i].getNombreCompleto().equals(nombreCompleto)){
                this.investigadores[i].otorgarTodos();
            }
        }
    }
    
    public String toString (){
    String aux= "Nombre del proyecto: " + getNombre() 
                + ", Codigo: " + getCodigo() 
                + ", Nombre del director: " 
                + getNombreDirector()
                + ", Dinero total otorgado proyecto: "
                + dineroTotalOtorgadoProyecto()
                + " \n";
    for (int i=0; i < this.cantInvestigadores; i++){
        aux+= "Investigador " + (i+1) + ": " +this.investigadores[i].toString() + "\n";
    }
    return aux;
    }
    public String getNombre() {
        return nombre;
    }
     
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }
    
    
}


