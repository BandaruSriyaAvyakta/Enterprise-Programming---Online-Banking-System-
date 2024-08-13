package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginService {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/klu";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "sriya123";
    private static final String INSERT_LOGIN_SQL = "INSERT INTO login (username, password) VALUES (?, ?)";
    private static final String UPDATE_LOGIN_SQL = "UPDATE login SET password = ? WHERE username = ?";
    private static final String SELECT_USERNAME_SQL = "SELECT username FROM login WHERE username = ?";

    static {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("MySQL JDBC driver not found.");
        }
    }

    // Method to save or update login details
    public void saveOrUpdateLogin(String username, String password) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            if (doesUsernameExist(username, connection)) {
                // Update password if username already exists
                preparedStatement = connection.prepareStatement(UPDATE_LOGIN_SQL);
                preparedStatement.setString(1, password);
                preparedStatement.setString(2, username);
            } else {
                // Insert new login record
                preparedStatement = connection.prepareStatement(INSERT_LOGIN_SQL);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
            }

            preparedStatement.executeUpdate();
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }

    // Method to check if the username exists in the login table
    private boolean doesUsernameExist(String username, Connection connection) throws SQLException {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            preparedStatement = connection.prepareStatement(SELECT_USERNAME_SQL);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();

            return resultSet.next(); // If a result is found, username exists
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
    }
}
