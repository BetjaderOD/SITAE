package utez.edu.mx.sitae_v1.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DaoRegistrarAlTaller {

    public int registrarseTaller (BeanRegistrarAlTaller beanRegistrarAlTaller) throws ClassNotFoundException{
        String INSERT_INSTALLER_SQL = "INSERT INTO futbol" + "(matricula) VALUES" + "(?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try(Connection connection = DriverManager.getConnection("jdbc:mysql://database-1.c71vpu2b5kso.us-east-1.rds.amazonaws.com:3306/sitae","admin","Root4Ws2022");

            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INSTALLER_SQL)){
            preparedStatement.setString(1, beanRegistrarAlTaller.getMatricula());

            System.out.println(preparedStatement);

            result = preparedStatement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
        return result;
    }
}