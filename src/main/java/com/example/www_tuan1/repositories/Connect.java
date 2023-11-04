package com.example.www_tuan1.repositories;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
    private static Connect instance;
    private Connection connection;

    public Connect() {
        try {
            DriverManager.registerDriver(new org.mariadb.jdbc.Driver());
            connection =   DriverManager.getConnection("jdbc:mariadb://localhost:3306/" +
                                 "mydb?user=root&password=1007");
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }
    public  static  Connect getInstance(){
            if (instance == null)
                instance = new Connect();
            return instance;
    }
    public  Connection getConnection(){
        return connection;
    }

//    public static void main(String[] args) {
//        Connection con = Connect.getInstance().getConnection();
//        System.out.println(con);
//    }

}
