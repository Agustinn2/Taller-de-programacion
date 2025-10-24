
package Practica4;

public class Triangulo extends Figura{
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;
    
    
    public Triangulo (double lado1, double lado2,double lado3,String colorRelleno, String colorLinea){
        super(colorRelleno,colorLinea);
        setLado1(lado1);
        setLado2(lado2);
        setLado3(lado3);
    } 
    
    public void setLado1 (double lado1) {
       this.lado1 = lado1;
    }
    
    public void setLado2 (double lado2) {
       this.lado2 =lado2;
    }

    public void setLado3 (double lado3){
        this.lado3 = lado3;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }
    
    public double getLado1 (){
        return lado1;
    }
    
    public double calcularPerimetro(){
        double aux = getLado1() + getLado2() + getLado3();
        return aux;
    }
    public double calcularArea (){
    double s = calcularPerimetro()/2;
    double area = s*(s - getLado1() )*(s - getLado2())*(s - getLado3());
    return Math.sqrt(area);
    }
    
    public String toString(){
    String aux = super.toString() + " Lado 1: " + getLado1()+
                 " Lado 2: " + getLado2() +
                 " Lado 3: " + getLado3() + "\n";
    return aux;
    }
    
}
