package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import commodel.Account;

public class AccountService {
    private static final String URL = "jdbc:mysql://localhost:3306/klu";
    private static final String USER = "root";
    private static final String PASSWORD = "sriya123";

    // Method to get an account by username
    public Account getAccountByUsername(String username) throws Exception {
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = con.prepareStatement("SELECT * FROM accounts WHERE username = ?")) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Account account = new Account();
                    account.setUsername(rs.getString("username"));
                    account.setBalance(rs.getDouble("balance"));
                    account.setAccountNumber(rs.getString("account_number")); // Assuming you have a getter/setter in Account class
                    return account;
                } else {
                    return null;
                }
            }
        }
    }

    // Method to check if username already exists
    public boolean doesUsernameExist(String username) throws Exception {
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM accounts WHERE username = ?")) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    // Method to check account balance
    public double checkBalance(String username) throws Exception {
        Account account = getAccountByUsername(username);
        if (account != null) {
            return account.getBalance();
        } else {
            throw new Exception("Account not found");
        }
    }

    // Method to update account balance
    public boolean updateAccountBalance(String username, double newBalance) throws Exception {
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = con.prepareStatement("UPDATE accounts SET balance = ? WHERE username = ?")) {
            ps.setDouble(1, newBalance);
            ps.setString(2, username);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        }
    }

    // Method to create a new account with account number
    public boolean createAccount(String username, double initialBalance, String accountNumber) throws Exception {
        if (doesUsernameExist(username)) {
            throw new Exception("Username already exists");
        }
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = con.prepareStatement("INSERT INTO accounts (username, balance, account_number) VALUES (?, ?, ?)")) {
            ps.setString(1, username);
            ps.setDouble(2, initialBalance);
            ps.setString(3, accountNumber);
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        }
    }
}
