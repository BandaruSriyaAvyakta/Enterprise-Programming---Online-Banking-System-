<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
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
            width: 80%;
            max-width: 1200px;
            padding: 20px;
            background-color: #765952; /* Background color similar to login box */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            color: #D2AC47; /* Text color consistent with login page */
            text-align: center;
        }
        h1 {
            font-family: 'Times New Roman', Times, serif;
            color: #D2AC47; /* Heading color consistent with login page */
            margin-top: 0;
            margin-bottom: 1em;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #F4CF83; /* Table background color */
            color: black; /* Text color inside table cells */
        }
        table th, table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        table th {
            background-color: #D2AC47; /* Header background color */
            color: black; /* Text color for headers */
        }
        .button-container {
            display: flex;
            gap: 10px; /* Space between buttons */
        }
        .delete-button, .update-button {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: white;
            font-weight: bold;
        }
        .delete-button {
            background-color: red; /* Red background for delete button */
        }
        .delete-button:hover {
            background-color: darkred; /* Darker red on hover */
        }
        .update-button {
            background-color: green; /* Green background for update button */
        }
        .update-button:hover {
            background-color: darkgreen; /* Darker green on hover */
        }
        .logout-link {
            text-align: center;
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
        <h1>Admin Dashboard</h1>
        <table>
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Name</th>
                    <th>Account Type</th>
                    <th>Address</th>
                    <th>Phone Number</th>
                    <th>Date of Birth</th>
                    <th>Age</th>
                    <th>Occupation</th>
                    <th>Actions</th> <!-- New column for actions -->
                </tr>
            </thead>
            <tbody>
                <% 
                    String url = "jdbc:mysql://localhost:3306/klu";
                    String user = "root";
                    String pass = "sriya123";
                    
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC driver
                        try (Connection conn = DriverManager.getConnection(url, user, pass);
                             Statement stmt = conn.createStatement();
                             ResultSet rs = stmt.executeQuery("SELECT username, name, account_type, address, phone_number, dob, age, occupation FROM users")) {
                             
                            while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("username") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("account_type") %></td>
                    <td><%= rs.getString("address") %></td>
                    <td><%= rs.getString("phone_number") %></td>
                    <td><%= rs.getString("dob") %></td>
                    <td><%= rs.getInt("age") %></td>
                    <td><%= rs.getString("occupation") %></td>
                    <td class="button-container">
                        <a href="deleteUserServlet?username=<%= rs.getString("username") %>" class="delete-button">Delete</a>
                        <a href="updateUser.jsp?username=<%= rs.getString("username") %>" class="update-button">Update</a>
                    </td>
                </tr>
                <% 
                            }
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                %>
                <tr>
                    <td colspan="9">Error retrieving data</td>
                </tr>
                <% 
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                %>
                <tr>
                    <td colspan="9">Driver not found</td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
        <div class="logout-link">
            <a href="adminlogin.jsp">Logout</a>
        </div>
    </div>
</body>
</html>
