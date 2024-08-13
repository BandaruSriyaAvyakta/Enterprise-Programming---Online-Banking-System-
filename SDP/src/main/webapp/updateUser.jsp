<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="commodel.SignupData" %>
<!-- Adjust package name as necessary -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('plain.jpg'); /* Background image similar to adminlogin.jsp */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }
        .container {
            width: 60%;
            max-width: 800px;
            padding: 20px;
            background-color: #765952; /* Background color similar to login box */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            color: grey; /* Text color changed to grey */
            text-align: center;
        }
        h1 {
            font-family: 'Times New Roman', Times, serif;
            color: #D2AC47; /* Heading color consistent with login page */
            margin-top: 0;
            margin-bottom: 1em;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: gold; /* Table background color set to gold */
            padding: 20px;
            border-radius: 8px;
            width: 100%;
        }
        input[type="text"], input[type="number"], input[type="date"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
        }
        input[type="submit"], .cancel-button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: white;
            font-weight: bold;
            margin: 5px;
        }
        input[type="submit"] {
            background-color: green; /* Green background for submit button */
        }
        input[type="submit"]:hover {
            background-color: darkgreen; /* Darker green on hover */
        }
        .cancel-button {
            background-color: red; /* Red background for cancel button */
        }
        .cancel-button:hover {
            background-color: darkred; /* Darker red on hover */
        }
        .logout-link {
            margin-top: 20px;
        }
        .logout-link a {
            text-decoration: none;
            color: #D2AC47; /* Link color consistent with the login button */
            font-size: 16px;
        }
        .logout-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update User</h1>
        <form action="updateUserServlet" method="post">
            <%
                String url = "jdbc:mysql://localhost:3306/klu";
                String user = "root";
                String pass = "sriya123";
                String username = request.getParameter("username");
                SignupData userData = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    try (Connection conn = DriverManager.getConnection(url, user, pass)) {
                        String query = "SELECT * FROM users WHERE username = ?";
                        try (PreparedStatement stmt = conn.prepareStatement(query)) {
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
                                }
                            }
                        }
                    }
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                }

                if (userData != null) {
            %>
            <input type="hidden" name="username" value="<%= userData.getUsername() %>">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= userData.getName() %>" required>
            
            <label for="account_type">Account Type:</label>
            <input type="text" id="account_type" name="account_type" value="<%= userData.getAccountType() %>" required>
            
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="<%= userData.getAddress() %>" required>
            
            <label for="phone_number">Phone Number:</label>
            <input type="text" id="phone_number" name="phone_number" value="<%= userData.getPhoneNumber() %>" required>
            
            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" value="<%= userData.getDob() %>" required>
            
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" value="<%= userData.getAge() %>" required>
            
            <label for="occupation">Occupation:</label>
            <input type="text" id="occupation" name="occupation" value="<%= userData.getOccupation() %>" required>
            
            <input type="submit" value="Update">
            <a href="admin-dashboard.jsp" class="cancel-button">Cancel</a>
            <% 
                } else {
            %>
            <p>User not found.</p>
            <a href="admin-dashboard.jsp" class="cancel-button">Back to Dashboard</a>
            <% 
                }
            %>
        </form>
        <div class="logout-link">
            <a href="adminlogin.jsp">Logout</a>
        </div>
    </div>
</body>
</html>
