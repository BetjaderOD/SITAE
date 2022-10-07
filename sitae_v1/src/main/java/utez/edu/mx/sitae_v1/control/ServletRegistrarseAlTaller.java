package utez.edu.mx.sitae_v1.control;

import utez.edu.mx.sitae_v1.model.BeanRegister;
import utez.edu.mx.sitae_v1.model.BeanRegistrarAlTaller;
import utez.edu.mx.sitae_v1.model.DaoRegister;
import utez.edu.mx.sitae_v1.model.DaoRegistrarAlTaller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registrarse-taller")

public class ServletRegistrarseAlTaller extends HttpServlet {

    private DaoRegistrarAlTaller daoRegistrarAlTaller = new DaoRegistrarAlTaller();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("/registrar-alumno-taller.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String matricula = request.getParameter("matricula");

        BeanRegistrarAlTaller beanRegistrarAlTaller = new BeanRegistrarAlTaller();
        beanRegistrarAlTaller.setMatricula(matricula);
        try{
            daoRegistrarAlTaller.registrarseTaller(beanRegistrarAlTaller);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/UserDetails.jsp");
        dispatcher.forward(request, response);
    }
}
