package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import commodel.Account;

public class AccountDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/klu";
    private static final String USER = "root";
    private static final String PASSWORD = "sriya123";

    // Establish a connection to the database
    private Connection getConnection() throws Exception {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Retrieve an account by username
    public Account getAccountByUsername(String username) throws Exception {
        String query = "SELECT * FROM accounts WHERE username=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Account account = new Account();
                    account.setUsername(rs.getString("username"));
                    account.setBalance(rs.getDouble("balance"));
                    return account;
                } else {
                    return null; // Account not found
                }
            }
        }
    }

    // Update the balance of an account
    public boolean updateAccountBalance(String username, double newBalance) throws Exception {
        String query = "UPDATE accounts SET balance=? WHERE username=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setDouble(1, newBalance);
            ps.setString(2, username);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Return true if update was successful
        }
    }

    // Create a new account with a specific username and initial balance
    public boolean createAccount(String username, double initialBalance) throws Exception {
        String query = "INSERT INTO accounts (username, balance) VALUES (?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, username);
            ps.setDouble(2, initialBalance);
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0; // Return true if insertion was successful
        }
    }
}
