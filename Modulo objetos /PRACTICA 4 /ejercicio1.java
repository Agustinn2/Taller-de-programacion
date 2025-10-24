package Practica4;

public class ejercicio1 {
    public static void main (String []args){
        Triangulo unTriangulo = new Triangulo (5,5,2,"Azul","Rojo");
        
        Circulo unCirculo = new Circulo(2, "Rojo", "Violeta");
        
        System.out.println(unTriangulo.toString());
        System.out.println(unCirculo.toString());
        unTriangulo.despintarFigura();
        unCirculo.despintarFigura();
        System.out.println(unTriangulo.toString());
        System.out.println(unCirculo.toString());
    }
}
