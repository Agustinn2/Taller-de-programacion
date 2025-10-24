package Practica3;

import PaqueteLectura.Lector;
        
public class ejercicio1 {
    public static void main (String [] args){
       Triangulo unTriangulo;
        System.out.println("Ingrese lado 1: ");
        double lado1 = Lector.leerDouble();
        System.out.println("Ingrese lado 2: ");
        double lado2 = Lector.leerDouble();
        System.out.println("Ingrese lado 1: ");
        double lado3 = Lector.leerDouble();
        System.out.println("Ingrese color de relleno: ");
        String colorRelleno = Lector.leerString();
        System.out.println("Ingrese color de linea: ");
        String colorLinea = Lector.leerString();
        
        unTriangulo = new Triangulo(lado1,lado2,lado3,colorRelleno,colorLinea);
        
        System.out.println("El perimetro es: " + unTriangulo.calcularPerimetro());
        System.out.println("El area es: " + unTriangulo.calcularArea());
             
        
    }
}
