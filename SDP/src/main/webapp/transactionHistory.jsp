<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center; /* Center align content */
            background-image: url('plain.jpg'); /* Set background image */
            background-size: cover; /* Cover the entire body */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Prevent image from repeating */
            margin: 0; /* Remove default margin */
            padding: 20px; /* Add padding to body */
        }
        h2 {
            color: #D4AF37; /* Gold color for heading */
            font-weight: bold; /* Bold font weight */
            margin-bottom: 20px; /* Space below heading */
            margin-top: 0.5cm; /* Margin above heading (approximately 0.5cm) */
        }
        table {
            margin: 50px auto; /* Center align table with top margin */
            border-collapse: collapse; /* Collapse table borders */
            width: 80%; /* Set table width */
            background-color: #765952; /* Grey background for table */
            color: #FFD700; /* Gold color for text in table */
        }
        th, td {
            border: 1px solid #D2AC47; /* Gold border for cells */
            padding: 8px; /* Add padding inside cells */
            text-align: center; /* Center align text in cells */
        }
        th {
            background-color: #D2AC47; /* Gold background for headers */
            color: #765952; /* Grey color for header text */
        }
        a {
            color: #D2AC47; /* Gold color for links */
            text-decoration: none; /* Remove underline from links */
            font-size: 16px; /* Set font size for links */
        }
        a:hover {
            text-decoration: underline; /* Underline links on hover */
        }
    </style>
</head>
<body>
    <h2>Transaction History</h2>
    <table>
        <tr>
            <th>From Username</th>
            <th>To Username</th>
            <th>Amount</th>
            <th>Date</th>
        </tr>
        <c:forEach var="transaction" items="${transactionHistory}">
            <tr>
                <td>${transaction.fromUsername}</td>
                <td>${transaction.toUsername}</td>
                <td>${transaction.amount}</td>
                <td><fmt:formatDate value="${transaction.date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            </tr>
        </c:forEach>
    </table>
    <p><a href="dashboard.jsp">Back to Dashboard</a></p>
</body>
</html>
