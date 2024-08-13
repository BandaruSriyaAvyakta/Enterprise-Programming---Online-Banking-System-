package commodel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.Pattern;

public class Loginmodel {
    private static final String URL = "jdbc:mysql://localhost:3306/klu";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "sriya123";

    // Password validation regex
    private static final String PASSWORD_PATTERN = 
        "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!])[a-zA-Z0-9@#$%^&+=!]{6,}$";

    // LOGIN VALIDATION
    public boolean validateCredentials(LoginData ld) throws Exception {
        if (!isValidPassword(ld.getPword())) {
            throw new Exception("Password must be at least 6 characters long and include both uppercase, lowercase, digits, and special characters.");
        }

        try (Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM login WHERE username=? AND password=?")) {

            ps.setString(1, ld.getUname());
            ps.setString(2, ld.getPword());
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next() && rs.getInt(1) == 1) {
                    return true;
                }
            }
        }
        return false;
    }

    // Method to validate password based on defined criteria
    private boolean isValidPassword(String password) {
        return Pattern.compile(PASSWORD_PATTERN).matcher(password).matches();
    }
}
