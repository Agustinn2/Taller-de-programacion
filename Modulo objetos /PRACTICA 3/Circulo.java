
package Practica3;

public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;

    public Circulo() {
    }
    
    
    public Circulo (double radio, String colorRelleno, String colorLinea){
        this.radio = radio;
        this.colorLinea = colorLinea;
        this.colorRelleno = colorRelleno;
    }
    
    
    
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    public double calcularPerimetro (){
        double aux = 2* Math.PI * radio;
        return aux;
    }
    
    public double calcularArea(){
        double aux = Math.PI * Math.pow(radio, 2);
        return aux;
    }
    
}
