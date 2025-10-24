
package Practica4;

public class Dibujo {
 private String titulo;
 private Figura [] vector;
 private int guardadas;
 private int capacidadMaxima=10;
 
 //inicia el dibujo, sin figuras
 
 public Dibujo (String titulo){
     this.titulo = titulo;
     this.vector = new Figura [this.capacidadMaxima];
     this.guardadas=0;
//completar
 }

 
 //agrega la figura al dibujo
 public void agregar(Figura f){
 //completar
 if (!estaLleno()){
    this.vector[guardadas]= f;
    this.guardadas++;
    System.out.println("la figura "+ f.toString() +" se ha guardado");
 } else {System.out.println("No se pueden agregar más figuras al dibujo.");}
 
 }

 //calcula el área del dibujo: 
 //suma de las áreas de sus figuras
 
 public double calcularArea(){
 //completar
 double suma=0;
 for (int i = 0; i < this.guardadas; i++){
     suma +=this.vector[i].calcularArea();
 }
return suma; 
 }

//imprime el título, representación
 //de cada figura, y área del dibujo
 public void mostrar(){
 //completar
 String aux= "Titulo: "+ this.titulo + "\n";
 for (int i=0; i < this.guardadas; i++){
     aux += this.vector[i].toString() + "\n";
 }
 aux += " Area del dibujo: " + this.calcularArea();
     System.out.println(aux);
 }
//retorna está lleno el dibujo
 public boolean estaLleno() {
 return (guardadas == capacidadMaxima);
 }
}
