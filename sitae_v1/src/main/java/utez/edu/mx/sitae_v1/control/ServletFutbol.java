package utez.edu.mx.sitae_v1.control;

import utez.edu.mx.sitae_v1.model.BeanFutbol;
import utez.edu.mx.sitae_v1.model.BeanInstructor;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.beans.beancontext.BeanContextMembershipEvent;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletFutbol",
urlPatterns = {
        "/list-futbol", //get
        "/delete-futbol", //post
        "/save-futubol"
})
public class ServletFutbol extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getServletPath();
        ServiceFutbol serviceFutbol;
        switch (option) {
            case "/list-futbol":
                serviceFutbol = new ServiceFutbol();
                List<BeanFutbol> listFutbol = serviceFutbol.listFutbol();
                request.setAttribute("list", listFutbol);
                request.getRequestDispatcher("/WEB-INF/view/list-futbol.jsp").forward(request, response);
                break;

            default:
                response.sendRedirect("list-futbol");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getServletPath();
        ServiceFutbol serviceFutbol;
        switch (option) {
            case "/delete-futbol":
                String idString = request.getParameter("id") != null ? request.getParameter("id") : "0";
                try {
                    int id = Integer.parseInt(idString);
                    serviceFutbol = new ServiceFutbol();
                    boolean result = serviceFutbol.deleteFutbol(id); //DAO consulta a la BD
                    if (result) {
                        response.sendRedirect("list-futbol");
                    } else {
                        response.sendRedirect("list-futbol");
                    }
                } catch (Exception e) {
                    response.sendRedirect("list-futbol");
                }
                break;
case "/save-futubol":
    try {
        String matricula = request.getParameter("matricula") != null ? request.getParameter("matricula") : "0";

        serviceFutbol = new ServiceFutbol();
        BeanFutbol futbol = new  BeanFutbol();

        futbol.setMatricula(matricula);

        boolean result = serviceFutbol.saveFutbol(futbol);
        response.sendRedirect("inicio-estudiante.jsp");

    }catch (Exception e){
        response.sendRedirect("inicio-estudiante.jsp");
    }
    break;
            default:
                response.sendRedirect("inicio-estudiante.jsp");
        }
        }
}
