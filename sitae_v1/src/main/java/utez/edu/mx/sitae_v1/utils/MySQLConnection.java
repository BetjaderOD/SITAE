package utez.edu.mx.sitae_v1.utils;

import java.sql.*;

public class MySQLConnection {
    public static Connection getConnection(){

        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sitae","root","root");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public static void main(String[] args) {
        try {
            Connection c = MySQLConnection.getConnection();
            if (c != null) {
                System.out.println("Conectado");
                c.close();
            }
            else{
                System.out.println("No conectado");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
