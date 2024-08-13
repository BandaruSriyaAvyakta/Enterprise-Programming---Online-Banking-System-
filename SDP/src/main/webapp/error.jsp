<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center; /* Center align content */
            background-image: url('money2.jpg'); /* Set background image */
            background-size: cover; /* Cover the entire body */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Prevent image from repeating */
            margin: 0; /* Remove default margin */
            padding: 20px; /* Add padding to body */
        }
        h2 {
            color: maroon; /* Maroon color for heading */
            margin-top: 20px; /* Top margin for heading */
        }
        a {
            color: blue; /* Blue color for links */
            text-decoration: none; /* Remove underline from links */
        }
        a:hover {
            text-decoration: underline; /* Underline links on hover */
        }
    </style>
</head>
<body>
    <h2>An error occurred</h2>
    <p>${errorMessage}</p>
    <p><a href="dashboard.jsp">Back to Dashboard</a></p>
</body>
</html>
