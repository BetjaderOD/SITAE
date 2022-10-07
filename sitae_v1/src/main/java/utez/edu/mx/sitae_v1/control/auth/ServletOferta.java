package utez.edu.mx.sitae_v1.control.auth;

import utez.edu.mx.sitae_v1.control.ServiceTaller;
import utez.edu.mx.sitae_v1.model.BeanTaller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletOferta",
        urlPatterns = {
                "/list-ofertas", //get
                "/get-oferta", //Get
                "/create-oferta", //get
                "/save-oferta", //Post
                "/update-oferta", //Post
                "/delete-oferta" //Delete
        }
)
public class ServletOferta extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getServletPath();
        ServiceTaller serviceTaller;
        switch (option) {
            case "/list-ofertas":
                serviceTaller = new ServiceTaller();
                List<BeanTaller> listTaller = serviceTaller.listTaller();
                request.setAttribute("list", listTaller);
                request.getRequestDispatcher("/WEB-INF/view/list-ofertas.jsp").forward(request,response);
                break;
            default:
                response.sendRedirect("list-ofertas");
                break;

    }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
