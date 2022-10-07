package utez.edu.mx.sitae_v1.model;

import utez.edu.mx.sitae_v1.utils.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DaoInstructor {
    public List<BeanInstructor> listInstructor(){
        List<BeanInstructor> listInstructor = new ArrayList<>();
        try {
            Connection con = MySQLConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet   rs = stmt.executeQuery("SELECT * FROM instructor");
            while(rs.next()){
                BeanInstructor instructor = new BeanInstructor();
                instructor.setId(rs.getInt("id"));
                instructor.setName(rs.getString("name"));

                instructor.setEmail(rs.getString("email"));


                instructor.setPassword(rs.getString("password"));
                listInstructor.add(instructor);
            };
            rs.close();
            con.close();
            stmt.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return listInstructor;
        }
    public boolean saveInstructor(BeanInstructor instructor){
        boolean result = false;
try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement("insert into instructor (name,email,password)values (?,?,?); ")
        ){
            pstm.setString(1, instructor.getName());
            pstm.setString(2, instructor.getEmail());
            pstm.setString(3, instructor.getPassword());
            result = pstm.executeUpdate() ==1;
    }catch (Exception e){
        e.printStackTrace();
    }
    return result;
    }
    public BeanInstructor getInstructor(int id) {
        BeanInstructor instructor = new BeanInstructor();
        try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement("select * from instructor where id = ?; ")
        ) {
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                instructor.setId(rs.getInt("id"));
                instructor.setName(rs.getString("name"));
                instructor.setEmail(rs.getString("email"));
                instructor.setPassword(rs.getString("password"));
            }
            rs.close();
            con.close();
            pstm.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return instructor;
    }
   public boolean updateInstructor(BeanInstructor instructor) {
       boolean result = false;
       try (
               Connection con = MySQLConnection.getConnection();
               PreparedStatement pstm = con.prepareStatement("update instructor set name = ?, email = ?, password = ? where id = ?; ")
       ) {
           pstm.setString(1, instructor.getName());
           pstm.setString(2, instructor.getEmail());
           pstm.setString(3, instructor.getPassword());
           pstm.setInt(4, instructor.getId());
           result = pstm.executeUpdate() == 1;
       } catch (Exception e) {
           e.printStackTrace();
       }
       return result;
   };
public boolean deleteInstructor(int id) {
    boolean result = false;
    try (
            Connection con = MySQLConnection.getConnection();
            PreparedStatement pstm = con.prepareStatement("delete from instructor where id = ?;")
    ) {
        pstm.setInt(1, id);
        result = pstm.executeUpdate() == 1;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return result;
}
}
