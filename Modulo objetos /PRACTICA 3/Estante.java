
package Practica3;

public class Estante {
    private Libro [] estante ;
    private int dimL = 0;
    private int DF = 20;
       
    public Estante() {
        estante = new Libro [DF];
        }
    public Estante (int N){
        this.DF = N;
        estante = new Libro [N];
    }
    public boolean estaLleno(){
        boolean aux = this.dimL == this.DF;
        return aux;
    }

    public void agregarLibro (Libro unLibro){
        if(!estaLleno()){
            estante[dimL]= unLibro;
            dimL++;
        }else{
            System.out.println("El estante esta lleno.");
        }
    }
    public Libro devolverLibro(String titulo){
    int pos=0; Libro aux = null;
    while ((pos < dimL)&& (aux == null)){
        if (estante[pos].getTitulo().equals(titulo)){
            aux = estante[pos];
        }else{
            pos++;
        }
    }
    return aux;
    }
    public int librosAlmacenados (){
        return dimL;
    }
    
}
