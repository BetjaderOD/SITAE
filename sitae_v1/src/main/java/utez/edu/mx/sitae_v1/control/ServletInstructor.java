package utez.edu.mx.sitae_v1.control;

import utez.edu.mx.sitae_v1.model.BeanInstructor;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletInstructor",
   urlPatterns = {
        "/list-intsructor",
        "/get-instructor",
        "/create-instructor",
        "/save-instructor",
        "/update-instructor",
        "/delete-instructor"

   })
public class ServletInstructor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getServletPath();
        ServiceInstructor serviceInstructor;
        switch (option) {
            case "/list-intsructor":
                serviceInstructor = new ServiceInstructor();
                List<BeanInstructor> listInstructor = serviceInstructor.listInstructor();
                request.setAttribute("list", listInstructor);
                request.getRequestDispatcher("/WEB-INF/view/list-instructor.jsp").forward(request,response);
                break;

            case "/get-instructor":
                String idString = request.getParameter("id") != null ? request.getParameter("id") : "0";
                try {
                    int id = Integer.parseInt(idString);
                    serviceInstructor = new ServiceInstructor();
                    BeanInstructor instructor = serviceInstructor.getInstructor(id); //DAO consulta a la BD
                    request.setAttribute("instructorX", instructor);
                    request.getRequestDispatcher("/WEB-INF/view/get-instructor.jsp").forward(request,response);
                } catch (Exception e) {
                    response.sendRedirect("list-intsructor");
                }
                break;

            case "/create-instructor":
                request.getRequestDispatcher("/WEB-INF/view/create-instructor.jsp").forward(request,response);
                break;
            default:
                response.sendRedirect("list-intsructor");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String option = request.getServletPath();

    switch (option){
        case "/save-instructor":
            try {
                String name = request.getParameter("name") != null ? request.getParameter("name") : "0";
                String email = request.getParameter("email") != null ? request.getParameter("email") : "0";
                String password = request.getParameter("password") != null ? request.getParameter("password") : "0";

                ServiceInstructor serviceInstructor = new ServiceInstructor();
                BeanInstructor instructor = new BeanInstructor();

                instructor.setName(name);
                instructor.setEmail(email);
                instructor.setPassword(password);

                boolean result = serviceInstructor.saveInstructor(instructor);
                response.sendRedirect("list-intsructor?result-save="+(result?"ok":"error"));
            }catch (Exception e){
                response.sendRedirect("list-intsructor?result-save=error");
            }
            break;
        case "/update-instructor":
           String idString = request.getParameter("id") != null ? request.getParameter("id") : "0";
           String name = request.getParameter("name")!= null? request.getParameter("name") : "0";
              String email = request.getParameter("email") != null ? request.getParameter("email") : "0";
                String password = request.getParameter("password") != null ? request.getParameter("password") : "0";
            try {
                int id = Integer.parseInt(idString);
                ServiceInstructor serviceInstructor = new ServiceInstructor();
                BeanInstructor instructor = new BeanInstructor();
                instructor.setId(id);
                instructor.setName(name);
                instructor.setEmail(email);
                instructor.setPassword(password);
                boolean result = serviceInstructor.updateInstructor(instructor);

                response.sendRedirect("list-intsructor?result-update="+(result?"ok":"error"));
            }catch (Exception e){
                response.sendRedirect("list-intsructor?result-update=error");
            }
            break;

        case "/delete-instructor":
            String idStringDelete = request.getParameter("id") != null ? request.getParameter("id") : "0";
            try{
                int id = Integer.parseInt(idStringDelete);
                ServiceInstructor serviceInstructor = new ServiceInstructor();
                boolean result = serviceInstructor.deleteInstructor(id);
                response.sendRedirect("list-intsructor?result-delete="+(result?"ok":"error"));
            }catch (Exception e){
                response.sendRedirect("list-intsructor?result-delete=error");
            }
            break;
        default:
            response.sendRedirect("list-intsructor");
    }
    }
}
