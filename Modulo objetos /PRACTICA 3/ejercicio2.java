
package Practica3;

public class ejercicio2 {

   
    public static void main(String[] args) {
         Libro unLibro = new Libro();
         Autor unAutor;
        unLibro.setTitulo("Java: A Beginner's Guide");
        unLibro.setEditorial("Mcgraw-Hill");
        unLibro.setAñoEdicion(2014);
        unAutor = new Autor ("Herbert Schildt","Sin biografia","");
        unLibro.setPrimerAutor(unAutor);
        unLibro.setISBN("978-0071809252");
        unLibro.setPrecio(21.72);
        System.out.println(unLibro.getPrimerAutor());
       // System.out.println(libro); /* invoca automaticamente al metodo toString */
    }
        
}
