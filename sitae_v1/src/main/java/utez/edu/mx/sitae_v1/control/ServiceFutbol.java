package utez.edu.mx.sitae_v1.control;


import utez.edu.mx.sitae_v1.model.BeanFutbol;
import utez.edu.mx.sitae_v1.model.Daofutbol;

import java.util.List;

public class ServiceFutbol {

    public List<BeanFutbol> listFutbol(){
        Daofutbol daoFutbol = new Daofutbol();
        List<BeanFutbol> listFutbol = daoFutbol.listFutbol();

        return listFutbol;
    };
    public boolean deleteFutbol(int idFutbol){
        Daofutbol daoFutbol = new Daofutbol();
        boolean result = daoFutbol.deleteFutbol(idFutbol);
        return result;
    };

    public boolean saveFutbol(BeanFutbol Futbol){
        Daofutbol daoFutbol = new Daofutbol();
         boolean result = false;
         boolean check = false;
         List<BeanFutbol> listFutbol = daoFutbol.listFutbol();
         for (BeanFutbol futbola : listFutbol){
             if (futbola.getMatricula().toLowerCase().equals(Futbol.getMatricula())
             ){
             check = true;
             }

         }
         if (!check){
             result = daoFutbol.saveFutbol(Futbol);

             return result;
         }
         return result;
    }




}
