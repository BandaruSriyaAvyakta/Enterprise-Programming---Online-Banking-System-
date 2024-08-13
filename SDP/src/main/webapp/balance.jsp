<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Check Balance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
            height: 100vh; /* Full viewport height */
            background-image: url('plain.jpg'); /* Set background image */
            background-size: cover; /* Cover the entire body */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Prevent image from repeating */
            display: flex; /* Flexbox layout for centering content */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
        }
        .card {
            width: 350px; /* Set width of card */
            padding: 20px; /* Add padding inside the card */
            border: 3px solid #D2AC47; /* Gold border for the card */
            border-radius: 8px; /* Rounded corners */
            background-color: #765952; /* Background color matching the container color */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Shadow effect for depth */
            text-align: center; /* Center align text inside card */
        }
        h2 {
            color: #D4AF37; /* Gold color for heading */
            margin-bottom: 1.5em; /* Margin below heading */
        }
        .balance {
            color: #FFD700; /* Gold color for balance text and value */
            font-size: 24px; /* Increase font size for balance */
            font-weight: bold; /* Make balance text bold */
        }
        a {
            color: #D2AC47; /* Gold color for links */
            text-decoration: none; /* Remove underline from links */
            font-size: 16px; /* Set font size for links */
            margin-top: 1em; /* Space above the link */
            display: block; /* Display link as block to align center */
        }
        a:hover {
            text-decoration: underline; /* Underline link on hover */
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Your Balance</h2>
        <p class="balance">Balance: <%= request.getAttribute("balance") %></p>
        <p><a href="dashboard.jsp">Back to Dashboard</a></p>
    </div>
</body>
</html>
