
package Practica3;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;


public class ejericicio3 {
    public static void main(String[] args) {
        
        Estante unEstante = new Estante(3);
        System.out.println("Ingrese nombre del libro.");
        String unTitulo = Lector.leerString();
        while ((!unEstante.estaLleno())&&(!unTitulo.equals("ZZZ"))){
            Autor unAutor = new Autor (GeneradorAleatorio.generarString(4),"Vacio","Vacio");
            Libro unLibro = new Libro(unTitulo, GeneradorAleatorio.generarString(4), unAutor, GeneradorAleatorio.generarString(6));
            unEstante.agregarLibro(unLibro);
            System.out.println("Ingrese nombre del libro.");
            unTitulo = Lector.leerString();
        }
        Libro libroBuscado;
        libroBuscado =unEstante.devolverLibro("Mujercitas");
        if (libroBuscado == null){
            System.out.println("No se encontro el titulo solicitado.");
        }else
            System.out.println("El nombre del autor de Mujercitas es: "+libroBuscado.getPrimerAutor().getNombre());
        
        System.out.println("Cantidad de libros en el estante: " + unEstante.librosAlmacenados());
        
    }
}
