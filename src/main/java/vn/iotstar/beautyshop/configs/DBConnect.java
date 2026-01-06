package vn.iotstar.beautyshop.configs;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    private static final String URL ="jdbc:sqlserver://DESKTOP-G7A4VOO;"
      + "databaseName=BeautyShop;"
      + "encrypt=false;trustServerCertificate=true;";

    private static final String USER = "sa";
    private static final String PASS = "123";

    public static Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(DBConnect.getConnection());
            return null;
        }
    }
}
