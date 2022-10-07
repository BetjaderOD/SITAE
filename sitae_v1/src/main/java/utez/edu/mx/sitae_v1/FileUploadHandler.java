package utez.edu.mx.sitae_v1;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
public class FileUploadHandler extends HttpServlet {
    private static final long serialVersionUID = 1 ;
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String file_name = null;
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
        if (!isMultipartContent) {
            return;
        }
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List < FileItem > fields = upload.parseRequest(request);
            Iterator < FileItem > it = fields.iterator();
            if (!it.hasNext()) {
                return;
            }
            while (it.hasNext()) {
                FileItem fileItem = it.next();
                boolean isFormField = fileItem.isFormField();
                System.out.println("File item: "+fileItem);
                if (isFormField) {

                } else {

                    InputStream fileContent = fileItem.getInputStream();
                    int i;
                    String temp = "";
                    ArrayList<String> materias = new ArrayList<String>();
                    while(( i = fileContent.read())!=-1) {

                        // prints character
                        temp += ""+(char) i;
                        System.out.print((char) i );

                        if((char)i=='\n'){
                            materias.add(temp);
                            temp = "";
                        }


                    }
                    System.out.println("materia 1: "+materias.get(0));

                    if (fileItem.getSize() > 0) {
                        fileItem.write(new File("/Users/carolinacorcino/Documents/uploads/" + fileItem.getName()));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.println("<script type='text/javascript'>");
            out.println("window.location.href='index.jsp?filename="+file_name+"'");
            out.println("</script>");
            out.close();
        }
        //Inserción
        String id = request.getParameter("userid");
        String driver = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://127.0.0.1:3306/";
        String database = "sitae";
        String userid = "root";
        String password = "gatitaMin4_";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

    }
}



