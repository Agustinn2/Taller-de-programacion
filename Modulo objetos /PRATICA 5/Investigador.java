
package Practica5;

public class Investigador {
    private String nombreCompleto;
    private int categoria;
    private String especialidad;
    private Subsidio [] subsidios;
    private int maxSubsidios = 5;
    private int cantSubsidios;

    
    public Investigador (String nombre, int categoria, String especialidad){
        setCategoria(categoria);
        setNombreCompleto(nombre);
        setEspecialidad(especialidad);
        subsidios = new Subsidio[maxSubsidios];
    }
    
    private boolean estaLleno(){
        return this.cantSubsidios == this.maxSubsidios;
    }
    
    public void agregarUnSubsidio(Subsidio unSubsidio){
        if (!estaLleno()){
            this.subsidios[this.cantSubsidios]= unSubsidio;
            this.cantSubsidios++;
            System.out.println("Se ha registrado correctamente el subsidio.");
            
        }else {System.out.println("No se permiten mas subsidios. Limite alcanzado");}
    }
    
    public double dineroTotalOtorgado (){
        double suma =0;
        for (int i=0; i < this.cantSubsidios; i++){
            if (this.subsidios[i].isOtorgado()){
                suma += this.subsidios[i].getMontoPedido();
            }
        }
      return suma;
    }
    
    public void otorgarTodos(){
     for (int i=0; i < this.cantSubsidios; i++){
         this.subsidios[i].setOtorgado(true);
     }
    }
    
    public String toString () {
        String aux = "Nombre: " 
                    + getNombreCompleto() 
                    + ", Categoria: " 
                    + getCategoria() 
                    + ", Especialidad: "
                    + getEspecialidad()
                    + ", Dinero otorgado: "
                    + dineroTotalOtorgado();
        return aux;
    }
    
    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    
    
    
}
