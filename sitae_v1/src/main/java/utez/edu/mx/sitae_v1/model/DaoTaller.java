package utez.edu.mx.sitae_v1.model;

import utez.edu.mx.sitae_v1.utils.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class DaoTaller {
public  List<BeanTaller> listTaller() {
    List<BeanTaller> list = new ArrayList<>();

    try {
        Connection con = MySQLConnection.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from materias");
        while (rs.next()) {
            BeanTaller taller = new BeanTaller();
            taller.setId(rs.getInt("idmateria"));
            taller.setName(rs.getString("name"));
            taller.setType(rs.getString("type"));
            taller.setPlace(rs.getString("place"));
            taller.setHorario(rs.getString("horario"));
            list.add(taller);
        }
        ;
        rs.close();
        con.close();
        stmt.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
public  int  saveTaller (BeanTaller taller) {
    int idGenerated = 0;
    try (
            Connection con = MySQLConnection.getConnection();
            PreparedStatement pstm =
                    con.prepareStatement("insert into materias " +
                                    "(name,type,place,horario,file_name)" +
                                    "values " +
                                    "(?,?,?,?,?); ",
                                     Statement.RETURN_GENERATED_KEYS
                    )
    ) {
        pstm.setString(1, taller.getName());
        pstm.setString(2, taller.getType());
        pstm.setString(3, taller.getPlace());
        pstm.setString(4, taller.getHorario());
        pstm.setString(5, taller.getFilename());

        if (pstm.executeUpdate()==1){
            try (ResultSet keys = pstm.getGeneratedKeys()) {

                idGenerated = keys.next() ? keys.getInt(1) : 0;
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return idGenerated;

}
public  static  BeanTaller getTaller(int id) {
    BeanTaller taller = new BeanTaller();
    try (
            Connection con = MySQLConnection.getConnection();
            PreparedStatement pstm = con.prepareStatement("select * from materias where idmateria = ?; ")

    ) {
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            taller.setId(rs.getInt("idmateria"));
            taller.setName(rs.getString("name"));
            taller.setType(rs.getString("type"));
            taller.setPlace(rs.getString("place"));
            taller.setHorario(rs.getString("horario"));
        }
        ;
        rs.close();
        con.close();
        pstm.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
    return taller;
}
public  boolean  updateTaller (BeanTaller taller) {
    boolean result = false;
    try (
            Connection con = MySQLConnection.getConnection();
            PreparedStatement pstm = con.prepareStatement("update materias set name = ?, type = ?, place = ?, horario = ? where idmateria = ?; ")

    ) {
        pstm.setString(1, taller.getName());
        pstm.setString(2, taller.getType());
        pstm.setString(3, taller.getPlace());
        pstm.setString(4, taller.getHorario());
        pstm.setInt(5, taller.getId());
        result = pstm.executeUpdate() == 1;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return result;
}
public  boolean  deleteTaller (int id) {
    boolean result = false;
    try (
            Connection con = MySQLConnection.getConnection();
            PreparedStatement pstm = con.prepareStatement("delete from materias where idmateria = ?; ")

    ) {
        pstm.setInt(1, id);
        result = pstm.executeUpdate() == 1;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return result;
}

}
