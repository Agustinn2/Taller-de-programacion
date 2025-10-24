
package Practica4;

public class Circulo extends Figura {
    private double radio;
    private String colorRelleno;
    private String colorLinea;

        
    public Circulo (double radio, String colorRelleno, String colorLinea){
        super(colorRelleno,colorLinea);
        setRadio(radio);    
    }
    
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    public double calcularPerimetro (){
        double aux = 2* Math.PI * getRadio();
        return aux;
    }
    
    public double calcularArea(){
        double aux = Math.PI * Math.pow(getRadio(), 2);
        return aux;
    }
    
    public String toString (){
        String aux = super.toString() + " Radio: " + getRadio() + "\n";
        return aux;
    }
}
