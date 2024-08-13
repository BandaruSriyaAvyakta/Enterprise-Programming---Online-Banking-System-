package commodel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SignupModel {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/klu";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "sriya123";

    public void saveSignupData(SignupData signupData) throws SQLException {
        String insertUserSql = "INSERT INTO users (account_type, name, address, phone_number, dob, age, occupation, username, password, registration_date, account_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String insertAccountSql = "INSERT INTO accounts (username, balance, account_number) VALUES (?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            try (PreparedStatement userStmt = conn.prepareStatement(insertUserSql);
                 PreparedStatement accountStmt = conn.prepareStatement(insertAccountSql)) {
                // Insert user data
                userStmt.setString(1, signupData.getAccountType());
                userStmt.setString(2, signupData.getName());
                userStmt.setString(3, signupData.getAddress());
                userStmt.setString(4, signupData.getPhoneNumber());
                userStmt.setString(5, signupData.getDob());
                userStmt.setInt(6, signupData.getAge());
                userStmt.setString(7, signupData.getOccupation());
                userStmt.setString(8, signupData.getUsername());
                userStmt.setString(9, signupData.getPassword());
                userStmt.setString(10, signupData.getRegistrationDate());
                userStmt.setString(11, signupData.getAccountNumber());
                userStmt.executeUpdate();

                // Insert account data
                accountStmt.setString(1, signupData.getUsername());
                accountStmt.setDouble(2, 0.0); // Default initial balance
                accountStmt.setString(3, signupData.getAccountNumber());
                accountStmt.executeUpdate();
            }
        }
    }

    public SignupData getUserByUsername(String username) throws SQLException {
        String query = "SELECT * FROM users WHERE username = ?";
        SignupData userData = null;

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    userData = new SignupData();
                    userData.setAccountType(rs.getString("account_type"));
                    userData.setName(rs.getString("name"));
                    userData.setAddress(rs.getString("address"));
                    userData.setPhoneNumber(rs.getString("phone_number"));
                    userData.setDob(rs.getString("dob"));
                    userData.setAge(rs.getInt("age"));
                    userData.setOccupation(rs.getString("occupation"));
                    userData.setUsername(rs.getString("username"));
                    userData.setPassword(rs.getString("password"));
                    userData.setRegistrationDate(rs.getString("registration_date"));
                    userData.setAccountNumber(rs.getString("account_number"));
                }
            }
        }
        return userData;
    }
}
