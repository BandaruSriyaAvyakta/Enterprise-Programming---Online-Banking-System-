package comdemo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/updateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/klu";
        String user = "root";
        String pass = "sriya123";

        // Retrieve parameters from the request
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String accountType = request.getParameter("account_type");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phone_number");
        String dob = request.getParameter("dob");
        int age = Integer.parseInt(request.getParameter("age"));
        String occupation = request.getParameter("occupation");

        // SQL query for updating user
        String updateQuery = "UPDATE users SET name = ?, account_type = ?, address = ?, phone_number = ?, dob = ?, age = ?, occupation = ? WHERE username = ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, pass);
                 PreparedStatement stmt = conn.prepareStatement(updateQuery)) {

                stmt.setString(1, name);
                stmt.setString(2, accountType);
                stmt.setString(3, address);
                stmt.setString(4, phoneNumber);
                stmt.setString(5, dob);
                stmt.setInt(6, age);
                stmt.setString(7, occupation);
                stmt.setString(8, username);

                int rowsUpdated = stmt.executeUpdate();
                if (rowsUpdated > 0) {
                    response.sendRedirect("admin-dashboard.jsp"); // Redirect to dashboard after update
                } else {
                    response.getWriter().println("Update failed!");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
