package utez.edu.mx.sitae_v1.control;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletHome", urlPatterns = {
        "/home"
})
public class ServletHome extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getServletPath();
        switch (option) {
            case "/home":
                try{
                    String rol = (String) request.getSession().getAttribute("rol");
                    if (rol == null) {
                        response.sendRedirect("index.jsp");
                        System.out.println("entra");
                        return;
                    }
                    if(rol.equals("admin")){
                        request.getRequestDispatcher("inicio-admin.jsp").forward(request, response);
                        return;
                    }
                    if(rol.equals("student")){
                        request.getRequestDispatcher("inicio-estudiante.jsp").forward(request, response);
                        return;
                    }
                    if(rol.equals("instructor")){
                        request.getRequestDispatcher("inicio-instructor.jsp").forward(request, response);
                        return;
                    }
                }catch(Exception e){
                    e.printStackTrace();
                }

                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
