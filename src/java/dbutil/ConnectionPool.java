package dbutil;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Ashley, Phat, Yonas
 */
public class ConnectionPool {

    private final String dbUrl;
    private final String username;
    private final String password;

    public Connection connection = null;

    //initalize connection
    public ConnectionPool() {
        dbUrl = "jdbc:mysql://localhost:3306/pay2steal";
        username = "root";
        password = "My$qlR00t";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.dbUrl, this.username, this.password);
        } catch (Exception e) {
            e.getStackTrace();
        }
    }

    public void closeConnection() {

        try {
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
