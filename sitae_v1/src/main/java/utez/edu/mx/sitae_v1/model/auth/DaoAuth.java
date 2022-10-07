package utez.edu.mx.sitae_v1.model.auth;

import utez.edu.mx.sitae_v1.model.BeanAuthentication;
import utez.edu.mx.sitae_v1.utils.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DaoAuth {
    public BeanAuthentication login(String email, String password) {
        String[]  roles = new String[] { "admin", "student","instructor" };
        BeanAuthentication userAuthentication = new BeanAuthentication();

        try
                (Connection con  = MySQLConnection.getConnection();
                 PreparedStatement pstm = con.prepareStatement("SELECT * FROM admin WHERE email = ? AND password = ?;");
                 PreparedStatement pstm1 = con.prepareStatement("SELECT * FROM student WHERE email = ? AND password = ?;");
                 PreparedStatement pstm2 = con.prepareStatement("SELECT * FROM instructor WHERE email = ? AND password = ?;");

                )

        {
            pstm.setString(1, email);
            pstm.setString(2, password);
            pstm1.setString(1, email);
            pstm1.setString(2, password);
            pstm2.setString(1, email);
            pstm2.setString(2, password);
            for(int i = 0;i<roles.length;i++){
                if(i==0) {
                    ResultSet rs = pstm.executeQuery();
                    while (rs.next()) {
                        userAuthentication.setId(rs.getInt("id"));
                        userAuthentication.setEmail(rs.getString("email"));
                        userAuthentication.setRol("admin");
                    }
                }
                if(i==1) {
                    ResultSet rs = pstm1.executeQuery();
                    while (rs.next()) {
                        userAuthentication.setIdstudent(rs.getString("id"));
                        userAuthentication.setEmail(rs.getString("email"));
                        userAuthentication.setRol("student");
                    }
                }
                if(i==2) {
                    ResultSet rs = pstm2.executeQuery();
                    while (rs.next()) {
                        userAuthentication.setId(rs.getInt("id"));
                        userAuthentication.setEmail(rs.getString("email"));
                        userAuthentication.setRol("instructor");
                    }
                }
                if(userAuthentication.getEmail() != null){
                    break;
                }
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return userAuthentication;
    }
}
