package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import commodel.Transaction;

public class TransactionDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/klu";
    private static final String USER = "root";
    private static final String PASSWORD = "sriya123";

    public boolean createTransaction(Transaction transaction) throws Exception {
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = con.prepareStatement("INSERT INTO transaction (fromUsername, toUsername, amount, date) VALUES (?, ?, ?, ?)")) {
            ps.setString(1, transaction.getFromUsername());
            ps.setString(2, transaction.getToUsername());
            ps.setDouble(3, transaction.getAmount());
            ps.setTimestamp(4, new java.sql.Timestamp(transaction.getDate().getTime()));
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        }
    }

    public List<Transaction> getTransactionHistory(String username) throws Exception {
        List<Transaction> transactions = new ArrayList<>();
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = con.prepareStatement("SELECT * FROM transaction WHERE fromUsername=? OR toUsername=?")) {
            ps.setString(1, username);
            ps.setString(2, username);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Transaction transaction = new Transaction(
                        rs.getString("fromUsername"),
                        rs.getString("toUsername"),
                        rs.getDouble("amount"),
                        rs.getTimestamp("date")
                    );
                    transactions.add(transaction);
                }
            }
        }
        return transactions;
    }
}
