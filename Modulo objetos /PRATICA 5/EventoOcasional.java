
package Practica5;

public class EventoOcasional extends Recital {
    private String [] v = {"A beneficio", "Show de TV", "Show privado"};
    private String motivo;
    private String nombreContratante;
    private String dia;

    
    public EventoOcasional (String nombreBanda, int cantCanciones, int motivo, String nombreContratante, String dia){
        super(nombreBanda,cantCanciones);
        setMotivo(this.v[motivo-1]);
        setNombreContratante(nombreContratante);
        setDia(dia);
    }
    
    public double calcularCosto(){
    double costo =0;
        if (getMotivo().equals("Show de TV")){
            costo = 50000;
        }else if(getMotivo().equals("Show privado")){
            costo = 150000;
        }
    return costo;
    }
    public String actuar (){
    String aux ="";
        if(getMotivo().equals("A beneficio")){
            aux += "Recuerden colaborar con... " + getNombreContratante() + " \n";
        }else if(getMotivo().equals("Show de TV")){
            aux += "Saludos amigos televidentes \n";
        }else{
            aux += "Un feliz cumpleaños para... " + getNombreContratante() + "\n";
        }
        aux += super.actuar();
    return aux;
    }
    
    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    
}
