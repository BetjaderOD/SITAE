package utez.edu.mx.sitae_v1.control;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

@WebServlet(name = "ServletImages", value = "/images")
public class ServletImages extends HttpServlet {

    private final String UPLOAD_DIRECTORY = "C:\\Users\\betja\\OneDrive\\Documents\\files-taller";
    private final int ARBITARY_SIZE = 1048; // 2MB
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("image/png");
        response.setHeader("Content-disposition", "attachment; filename=image.png");
        String idImagen = request.getParameter("id")!=null ? request.getParameter("id") : "0";
        System.out.println("idImagen: " + idImagen);
        if (!idImagen.equals("0")){
            File file = new File (UPLOAD_DIRECTORY +File .separator+idImagen);
            if (file.exists()){
                File [] files = file.listFiles();
                response.setHeader("Content-Disposition", "attachment; filename="+files[0].getName());
                try(InputStream in = new FileInputStream(files[0]);
                    OutputStream out = response.getOutputStream()) {
                    byte[] buffer = new byte[ARBITARY_SIZE];
                    int numBytesRead;
                    while ((numBytesRead = in.read(buffer)) > 0){
                        out.write(buffer, 0, numBytesRead);
                    }
                }
            }
        }
    }

}
