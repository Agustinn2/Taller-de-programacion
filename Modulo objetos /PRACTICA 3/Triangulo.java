
package Practica3;

public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;
    
    public Triangulo (){
    }
    
    public Triangulo (double lado1, double lado2,double lado3,String colorRelleno, String colorLinea){
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
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
    public void setColorRelleno (String colorRelleno){
        this.colorRelleno = colorRelleno;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    
    public double getLado1 (){
        return lado1;
    }
    
    public double calcularPerimetro(){
        double perimetro = lado1 + lado2 + lado3;
        return perimetro;
    }
    public double calcularArea (){
    double s = calcularPerimetro()/2;
    double area = s*(s-lado1)*(s-lado2)*(s - lado3);
    return Math.sqrt(area);
    }
    
}
