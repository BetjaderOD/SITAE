package utez.edu.mx.sitae_v1.control;
import utez.edu.mx.sitae_v1.model.BeanAuthentication;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletAuthentication",
        urlPatterns = {
                "/login",
                "/logout"
        }
)
public class ServletAuthentication extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        String option = request.getServletPath();
        if (option.equals("/logout")) {
           request.getSession().removeAttribute("name");
           request.getSession().removeAttribute("rol");
           request.getSession().invalidate();
           response.sendRedirect("index.jsp");
        }else{
            response.sendRedirect("index.jsp");

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            if(request.getSession().getAttribute("name") != null){
                response.sendRedirect("home");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String option = request.getServletPath();
        if (option.equals("/login")){
            String email = request.getParameter("email")!=null?
                    request.getParameter("email"):"";
            String password = request.getParameter("password")!=null?
                    request.getParameter("password"):"";


            ServiceAuthentication serviceAuthenticacion = new ServiceAuthentication();
            BeanAuthentication userAuthentication =  serviceAuthenticacion.login(email,password);

            if (userAuthentication.getEmail() != null){
                HttpSession session = request.getSession(true);
                session.setAttribute("name", userAuthentication.getEmail());
                session.setAttribute("rol", userAuthentication.getRol());

                response.sendRedirect("home");

            } else {
                response.sendRedirect("index.jsp?message=error");
            }
        }else{
            // request.getRequestDispatcher("index.jsp").forward(request,response);
            response.sendRedirect("index.jsp");

        }
    }
}
