package utez.edu.mx.sitae_v1.model;
import utez.edu.mx.sitae_v1.utils.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Daofutbol {
    public List <BeanFutbol> listFutbol(){
        List <BeanFutbol> listFutbol = new ArrayList<BeanFutbol>();

        try {
            Connection con = MySQLConnection.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from futbol");
            while (rs.next()) {
                BeanFutbol futbol = new BeanFutbol();
                futbol.setId(rs.getInt("id"));
                futbol.setMatricula(rs.getString("matricula"));

                listFutbol.add(futbol);

            }
rs.close();
con.close();
statement.close();

        }catch(Exception e){
            e.printStackTrace();

    }
    return listFutbol;
    }
    public boolean deleteFutbol(int idFutbol){
        boolean result = false;
        try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement("delete from futbol where id = ?; ")
                )
        {
            pstm.setInt(1, idFutbol);
            result = pstm.executeUpdate() ==1;
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    public boolean saveFutbol(BeanFutbol futbol) {
        boolean result = false;
        try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement("insert into futbol (matricula)values (?); ")
        ) {
            pstm.setString(1, futbol.getMatricula());
            result = pstm.executeUpdate() == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

}
