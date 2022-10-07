package utez.edu.mx.sitae_v1.control;
import  utez.edu.mx.sitae_v1.model.BeanRegister;
import utez.edu.mx.sitae_v1.model.DaoRegister;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/register")

public class ServletRegister extends HttpServlet {

    private DaoRegister daoRegister = new DaoRegister();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/index.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");


        BeanRegister beanRegister = new BeanRegister();
        beanRegister.setId(id);
        beanRegister.setName(name);
        beanRegister.setEmail(email);
        beanRegister.setPassword(password);
        try{
            daoRegister.registerUser(beanRegister);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/UserDetails.jsp");
        dispatcher.forward(request, response);
    }
}
