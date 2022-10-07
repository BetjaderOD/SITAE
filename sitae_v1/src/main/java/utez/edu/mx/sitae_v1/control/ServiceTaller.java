package utez.edu.mx.sitae_v1.control;

import utez.edu.mx.sitae_v1.model.BeanTaller;
import utez.edu.mx.sitae_v1.model.DaoTaller;

import java.util.List;

public class ServiceTaller {
public List<BeanTaller> listTaller(){
    DaoTaller daoTaller = new DaoTaller();
    List<BeanTaller> listTaller = daoTaller.listTaller();
    return listTaller;
};
public int saveTaller(BeanTaller taller){
    DaoTaller daoTaller = new DaoTaller();

    int  result = 0;
    boolean check = false;
    List<BeanTaller> listTaller = daoTaller.listTaller();
    for (BeanTaller tallera : listTaller) {
        if (tallera.getHorario().toLowerCase().equals(taller.getHorario().toLowerCase())
                && tallera.getName().toLowerCase().equals(taller.getName().toLowerCase())
                && tallera.getPlace().toLowerCase().equals(taller.getPlace().toLowerCase())

        ) {

            check= true;
        }

    }
    if (!check ) {
        System.out.println("entra service");
        result = daoTaller.saveTaller(taller);

        return result;
    }
    return result;
};



public  static  BeanTaller getTaller(int id){
    DaoTaller daoTaller = new DaoTaller();
    BeanTaller taller = daoTaller.getTaller(id);
    return taller;
};

public boolean updateTaller(BeanTaller taller){
    DaoTaller daoTaller = new DaoTaller();
    boolean result = false;
    boolean check = false;
    List<BeanTaller> listTaller = daoTaller.listTaller();
    for (BeanTaller tallera : listTaller) {
        if (tallera.getHorario().toLowerCase().equals(taller.getHorario().toLowerCase())
                && tallera.getName().toLowerCase().equals(taller.getName().toLowerCase())
                && tallera.getPlace().toLowerCase().equals(taller.getPlace().toLowerCase())
                && tallera.getId() != taller.getId()) {

            check= true;
        }

    }
    if (!check ) {
        result = daoTaller.updateTaller(taller);
        return result;
    }
    return result;
};

public boolean deleteTaller(int idTaller){
    DaoTaller daoTaller = new DaoTaller();
    boolean result = daoTaller.deleteTaller(idTaller);
    return result;
};

}
