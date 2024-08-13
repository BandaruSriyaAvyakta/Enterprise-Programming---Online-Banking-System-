<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-image: url('plain.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }
        .welcome-message {
            color: #D2AC47;
            font-family: 'Times New Roman', Times, serif;
            font-size: 3em;
            margin-top: 0.2cm;
            margin-bottom: 1.5cm;
        }
        .container {
            width: 350px;
            padding: 20px;
            background-color: #765952;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .button-box {
            margin-top: 1.5cm;
        }
        .button-box a {
            display: block;
            margin: 10px 0;
            padding: 10px;
            background-color: #D2AC47;
            text-decoration: none;
            color: black;
            border: 1px solid #D2AC47;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }
        .button-box a:hover {
            background-color: #c89c4f;
            color: black;
        }
        .error-message {
            color: red;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="welcome-message">Welcome <%= session.getAttribute("username") %></div>
    <div class="container">
        <div class="button-box">
            <a href="transfer.jsp">Transfer Money</a>
            <a href="BalanceServlet">Check Balance</a>
            <a href="TransactionHistoryServlet">View Transaction History</a>
            <a href="accountDetails.jsp">Account Details</a> <!-- New button -->
            <a href="logout.jsp">Logout</a>
        </div>
        <% 
            String message = request.getParameter("message");
            if (message != null) {
                out.println("<p class='error-message'>" + message + "</p>");
            }
        %>
    </div>
</body>
</html>
