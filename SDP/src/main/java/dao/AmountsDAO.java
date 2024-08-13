package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class AmountsDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/klu";
    private static final String USER = "root";
    private static final String PASSWORD = "sriya123";

    public void logAmountChange(String username, double amount, String transactionType) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            String sql = "INSERT INTO amounts (username, amount, transaction_type) VALUES (?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setDouble(2, amount);
            ps.setString(3, transactionType);
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}
