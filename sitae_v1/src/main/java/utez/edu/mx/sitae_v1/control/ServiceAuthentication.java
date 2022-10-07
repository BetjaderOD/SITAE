package utez.edu.mx.sitae_v1.control;

import utez.edu.mx.sitae_v1.model.BeanAuthentication;
import utez.edu.mx.sitae_v1.model.auth.DaoAuth;


public class ServiceAuthentication {

    public BeanAuthentication login(String email, String password) {
       // DaoAuthentication daoAuthentication = new DaoAuthentication();
        DaoAuth daoAuth = new DaoAuth();

        return daoAuth.login(email,password);

    }
}



