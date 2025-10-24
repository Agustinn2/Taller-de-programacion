
package Practica2;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class ejercicio5 {
    public static void main(String []args ){
       int DF = 20;
       GeneradorAleatorio.iniciar();
       Partido [] campeonato = new Partido[DF];
       String equipoLocal, equipoVisitante;
       int golesLocal, golesVisitante, dimL=0;
       
       
        System.out.println("----- Partido " + (dimL+1) +"-----");
        System.out.println("Ingrese equipo visitante: ");
        equipoVisitante = Lector.leerString();
        
        while ((dimL < DF) &&(!equipoVisitante.equals("ZZZ"))){
            System.out.println("Ingrese equipo local: ");
            equipoLocal = Lector.leerString();
            golesLocal = GeneradorAleatorio.generarInt(10);
            golesVisitante = GeneradorAleatorio.generarInt(10);
            campeonato [dimL] = new Partido (equipoLocal, equipoVisitante, golesLocal, golesVisitante);
            dimL++;
            System.out.println("----- Partido " + (dimL+1) +"-----");
            System.out.println("Ingrese equipo visitante: ");
            equipoVisitante = Lector.leerString();
        }
        
        System.out.println("Partidos cargados: " + dimL);
        int i;
        for (i=0; i< dimL; i++){
            System.out.println(campeonato[i].toString());
        }
        int cant=0, golesTotalesBoca=0;
        for (i=0; i <dimL; i++){
            if ((campeonato[i].getGanador().equals("River"))){
               cant++;
            }
            if (campeonato[i].getLocal().equals("Boca")){
                golesTotalesBoca += campeonato[i].getGolesLocal();
            }
        }
        System.out.println("Cantidad de partidos ganados de Riber: "+ cant);
        System.out.println("Total de goles de BOCA como local: "+ golesTotalesBoca);
        
    }

}


