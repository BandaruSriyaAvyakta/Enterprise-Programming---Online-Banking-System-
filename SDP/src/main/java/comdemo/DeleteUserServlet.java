package comdemo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/klu";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "sriya123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        if (username != null && !username.isEmpty()) {
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // Delete user from 'users' table
                String deleteUserSql = "DELETE FROM users WHERE username = ?";
                try (PreparedStatement deleteUserStmt = conn.prepareStatement(deleteUserSql)) {
                    deleteUserStmt.setString(1, username);
                    deleteUserStmt.executeUpdate();
                }
                
                // Optionally, delete from other related tables if necessary
                // e.g., delete from 'accounts' table
                String deleteAccountSql = "DELETE FROM accounts WHERE username = ?";
                try (PreparedStatement deleteAccountStmt = conn.prepareStatement(deleteAccountSql)) {
                    deleteAccountStmt.setString(1, username);
                    deleteAccountStmt.executeUpdate();
                }

                // Redirect back to admin dashboard
                response.sendRedirect("admin-dashboard.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("admin-dashboard.jsp?error=Unable to delete user");
            }
        } else {
            response.sendRedirect("admin-dashboard.jsp?error=Invalid username");
        }
    }
}
