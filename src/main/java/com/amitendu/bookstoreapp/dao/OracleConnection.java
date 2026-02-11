package com.amitendu.bookstoreapp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Utility class for managing Oracle database connections.
 *
 * @author amite
 */
public class OracleConnection {

    // Database credentials - should be moved to a properties file in production
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String DB_USER = "bookstore";
    private static final String DB_PASSWORD = "bookstore123";

    /**
     * Establishes and returns a database connection.
     *
     * @return Connection object to Oracle database
     * @throws SQLException if connection fails
     */
    public static Connection getConnection() throws SQLException {
        try {
            // Load Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Oracle JDBC Driver not found", e);
        }
    }

    /**
     * Closes the given database connection.
     *
     * @param connection the connection to close
     */
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                // Log error in production
                e.printStackTrace();
            }
        }
    }

}
