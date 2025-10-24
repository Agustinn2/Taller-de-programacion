
package Practica3;

public class ejercicio2b {

 
    public static void main(String[] args) {
        Autor unAutor1 = new Autor ("Herbert Schildt", "Vacio", "Vacio");
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 unAutor1, "978-0071809252", 21.72);
        Autor unAutor2 = new Autor ("John Horton","Vacio","Vacio");
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               unAutor2, "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        Libro libro3= new Libro(); 
    }
    
}
