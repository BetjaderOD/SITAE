package utez.edu.mx.sitae_v1.control;

import utez.edu.mx.sitae_v1.model.BeanTaller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletTaller", urlPatterns ={
        "/list-taller", //get
        "/get-taller", //Get
        "/create-taller", //get
        "/save-taller", //Post
        "/update-taller", //Post
        "/delete-taller" //post
})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 5 * 5 // 25MB
)
public class ServletTaller extends HttpServlet {
    private final String UPLOAD_DIRECTORY = "C:\\Users\\betja\\OneDrive\\Documents\\files-taller";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String option = request.getServletPath();
    ServiceTaller serviceTaller;
    switch (option) {
        case "/list-taller":
            serviceTaller = new ServiceTaller();
            List<BeanTaller> listTaller = serviceTaller.listTaller();
            request.setAttribute("list", listTaller);
            request.getRequestDispatcher("/WEB-INF/view/list-taller.jsp").forward(request,response);
            break;
            case "/create-taller":
                request.getRequestDispatcher("/WEB-INF/view/create-taller.jsp").forward(request,response);
                break;
        case "/get-taller":
            String idString = request.getParameter("id") != null ? request.getParameter("id") : "0";
            try {
                int id = Integer.parseInt(idString);
                serviceTaller = new ServiceTaller();
                BeanTaller taller = serviceTaller.getTaller(id); //DAO consulta a la BD
                request.setAttribute("tallerX", taller);
                request.getRequestDispatcher("/WEB-INF/view/get-taller.jsp").forward(request,response);
            } catch (Exception e) {
                response.sendRedirect("list-taller");
            }
            default:
                response.sendRedirect("list-taller");
                break;
    }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String option = request.getServletPath();

     switch (option) {
         case "/save-taller":
             System.out.println("entra post");
             String nameSave = request.getParameter("name") != null ? request.getParameter("name") : "";
             String typeSave = request.getParameter("type") != null ? request.getParameter("type") : "";
             String placeSave = request.getParameter("place") != null ? request.getParameter("place") : "";
             String HorarioSave = request.getParameter("horario") != null ? request.getParameter("horario") : "";
             Part fileRequest = request.getPart("photo");
             if (fileRequest != null) {
                 System.out.println("Entra file");
                 BeanTaller taller = new BeanTaller();
                 String fileName = fileRequest.getSubmittedFileName();
                 try {
                     taller.setName(nameSave);
                     taller.setType(typeSave);
                     taller.setPlace(placeSave);
                     taller.setHorario(HorarioSave);
                     taller.setFilename(fileName);

                     ServiceTaller serviceTaller = new ServiceTaller();
                     int idGenerated = serviceTaller.saveTaller(taller);
                     if (idGenerated > 0) {
                         System.out.println("Se registra");
                         String uploadPath = UPLOAD_DIRECTORY + File.separator + idGenerated;


                         File directorySave = new File(uploadPath);
                         if (!directorySave.exists()) {
                             directorySave.mkdir();
                         }

                         fileRequest.write(uploadPath + File.separator + fileName);
                     }

                     response.sendRedirect("list-taller");
                 } catch (Exception e) {
                     System.out.println("Entra excp");
                     response.sendRedirect("list-taller");
                 }
             }
             break;
         case "/update-taller":
             String idStringUpdate = request.getParameter("id") != null ? request.getParameter("id") : "0";
             String name = request.getParameter("name") != null ? request.getParameter("name") : "0";
             String type = request.getParameter("type") != null ? request.getParameter("type") : "0";
             String place = request.getParameter("place") != null ? request.getParameter("place") : "0";
             String horario = request.getParameter("horario") != null ? request.getParameter("horario") : "0";

             try {
                 int id = Integer.parseInt(idStringUpdate);
                 ServiceTaller serviceTaller = new ServiceTaller();
                 BeanTaller taller = new BeanTaller();
                 taller.setId(id);
                 taller.setName(name);
                 taller.setType(type);
                 taller.setPlace(place);
                 taller.setHorario(horario);
                 boolean result = serviceTaller.updateTaller(taller);
                 response.sendRedirect("list-taller?result-update=" + (result ? "ok" : "error"));
             } catch (Exception e) {
                 response.sendRedirect("list-taller?result-update=error");
             }
             break;
            case "/delete-taller":
                String idStringDelete = request.getParameter("id") != null ? request.getParameter("id") : "0";
                try {
                    int id = Integer.parseInt(idStringDelete);
                    ServiceTaller serviceTaller = new ServiceTaller();
                    boolean result = serviceTaller.deleteTaller(id);
                    response.sendRedirect("list-taller?result-delete=" + (result ? "ok" : "error"));
                } catch (Exception e) {
                    response.sendRedirect("list-taller?result-delete=error");
                }
                break;

         default:
             response.sendRedirect("list-taller");
             break;
     }

     }
    }

