<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to Online Banking</title>
    <style>
        body {
            font-family: Arial, sans-serif; /* Default font for body */
            background-image: url('bank.jpg'); /* Set background image */
            background-size: cover; /* Cover the entire body */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Prevent image from repeating */
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
            height: 100vh; /* Full viewport height */
            display: flex; /* Flexbox for centering */
            flex-direction: column; /* Stack children vertically */
            align-items: center; /* Center horizontally */
            justify-content: flex-start; /* Align to the top */
            padding-top: 50px; /* Space from the top edge of the viewport */
        }
        .card {
            background-color: rgba(255, 255, 255, 0.3); /* Very transparent white */
            border-radius: 10px; /* Rounded corners for the card */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Shadow effect for better visibility */
            padding: 20px; /* Space inside the card */
            text-align: center; /* Center align text inside the card */
            max-width: 90%; /* Limit the card width */
            width: 400px; /* Set a fixed width */
        }
        h1 {
            font-family: 'Times New Roman', serif; /* Times New Roman font for heading */
            color: #333; /* Dark color for text */
            font-size: 36px; /* Increase font size of heading */
            margin: 0; /* Remove default margin */
        }
        a.button {
            display: inline-block;
            background-color: #4CAF50; /* Green color for button */
            color: white; /* White text color */
            padding: 10px 20px; /* Add padding inside button */
            text-decoration: none; /* Remove underline from link */
            border-radius: 4px; /* Rounded corners for button */
            transition: background-color 0.3s; /* Smooth transition for background color */
            margin-top: 20px; /* Space between heading and button */
        }
        a.button:hover {
            background-color: #45a049; /* Darker green background on hover */
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Welcome to Online Banking</h1>
        <p><a href="login.jsp" class="button">Click here to Login</a></p>
    </div>
</body>
</html>
