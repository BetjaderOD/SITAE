package utez.edu.mx.sitae_v1.control;

import utez.edu.mx.sitae_v1.model.BeanInstructor;
import utez.edu.mx.sitae_v1.model.DaoInstructor;

import java.util.List;

public class ServiceInstructor {
    public List<BeanInstructor> listInstructor(){
        DaoInstructor daoInstructor = new DaoInstructor();
        List<BeanInstructor> listInstructor = daoInstructor.listInstructor();

        return listInstructor;
    };

    public boolean saveInstructor(BeanInstructor instructor){
        DaoInstructor daoInstructor = new DaoInstructor();
        boolean result = daoInstructor.saveInstructor(instructor);
        return result;
    };

    public  static  BeanInstructor getInstructor(int id){
        DaoInstructor daoInstructor = new DaoInstructor();
        BeanInstructor instructor = daoInstructor.getInstructor(id);
        return instructor;
    };

    public boolean updateInstructor(BeanInstructor instructor){
        DaoInstructor daoInstructor = new DaoInstructor();
        boolean result = daoInstructor.updateInstructor(instructor);
        return result;
    };

    public boolean deleteInstructor(int idInstructor){
        DaoInstructor daoInstructor = new DaoInstructor();
        boolean result = daoInstructor.deleteInstructor(idInstructor);
        return result;
    };


}
