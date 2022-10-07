package utez.edu.mx.sitae_v1.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DaoRegister {
    public int registerUser (BeanRegister beanRegister) throws ClassNotFoundException{
        String INSERT_STUDENTS_SQL = "INSERT INTO student" + "(id, name, email, password) VALUES " + "(?,?,?,?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try(Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sitae","root","root");

            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STUDENTS_SQL)){
            preparedStatement.setString(1, beanRegister.getId());
            preparedStatement.setString(2, beanRegister.getName());
            preparedStatement.setString(3,beanRegister.getEmail());
            preparedStatement.setString(4,beanRegister.getPassword());

            System.out.println(preparedStatement);

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
