<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center; /* Center align content horizontally */
            background-image: url('plain.jpg'); /* Set background image */
            background-size: cover; /* Ensure the image covers the entire body */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Prevent the image from repeating */
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
            min-height: 100vh; /* Ensure the body takes at least full viewport height */
            display: flex; /* Enable flexbox */
            justify-content: center; /* Center align content horizontally */
            align-items: center; /* Center align content vertically */
            flex-direction: column; /* Stack items vertically */
        }
        h2 {
            color: #D4AF37; /* Gold color for heading */
            margin-bottom: 0.5cm; /* Margin below the heading */
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
    <div>
        <h2>You have been logged out successfully!</h2>
        <p><a href="index.jsp">Back to Home</a></p>
    </div>
</body>
</html>
