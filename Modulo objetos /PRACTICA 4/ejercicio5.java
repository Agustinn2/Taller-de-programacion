
package Practica4;

public class ejercicio5 {
 public static void main(String[] args) {
  Dibujo d = new Dibujo("un dibujo");
 
 Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
 Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
 Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");

 d.agregar (c1);
 d.agregar (r);
 d.agregar (c2);
 d.mostrar();
    }
}
