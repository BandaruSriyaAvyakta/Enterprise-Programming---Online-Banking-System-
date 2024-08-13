<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="commodel.SignupData, commodel.SignupModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-image: url('plain.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #D3D3D3;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-top: 20px;
            text-align: left;
        }
        .card h2 {
            margin-top: 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Account Details</h1>
        <%
            String username = (String) session.getAttribute("username"); // Assuming username is stored in session
            if (username == null) {
                response.sendRedirect("login.jsp?message=Please login first.");
                return;
            }
            SignupModel model = new SignupModel();
            SignupData userData = model.getUserByUsername(username);
        %>
        <div class="card">
            <h2>Account Information</h2>
            <p><strong>Account Type:</strong> <%= userData.getAccountType() %></p>
            <p><strong>Name:</strong> <%= userData.getName() %></p>
            <p><strong>Address:</strong> <%= userData.getAddress() %></p>
            <p><strong>Phone Number:</strong> <%= userData.getPhoneNumber() %></p>
            <p><strong>Date of Birth:</strong> <%= userData.getDob() %></p>
            <p><strong>Age:</strong> <%= userData.getAge() %></p>
            <p><strong>Occupation:</strong> <%= userData.getOccupation() %></p>
            <p><strong>Account Number:</strong> <%= userData.getAccountNumber() %></p>
            <p><strong>Registration Date:</strong> <%= userData.getRegistrationDate() %></p>
        </div>
    </div>
</body>
</html>
