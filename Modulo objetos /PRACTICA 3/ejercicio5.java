
package Practica3;
import PaqueteLectura.Lector;

public class ejercicio5 {
    public static void main (String []args){
        Circulo unCirculo;
        System.out.println("Ingrese radio: ");
        double radio = Lector.leerDouble();
        System.out.println("Ingrese color de relleno: ");
        String colorRelleno = Lector.leerString();
        System.out.println("Ingrese color de linea: ");
        String colorLinea = Lector.leerString();
        unCirculo = new Circulo(radio,colorRelleno,colorLinea);
        System.out.println("El perimetro es: " + unCirculo.calcularPerimetro());
        System.out.println("El area es: "+ unCirculo.calcularArea());
    }
}
