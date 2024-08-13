<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login to Online Banking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
            height: 100vh; /* Full viewport height */
            display: grid; /* Grid layout for body */
            grid-template-columns: 1fr 1fr; /* Two equal-width columns */
            grid-template-rows: 1fr; /* Single row */
        }
        .image-section {
            background-image: url('atm.jpg'); /* Set background image */
            background-size: cover; /* Cover the section */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Prevent image from repeating */
            height: 100%; /* Full height of the column */
            grid-column: 1 / 2; /* First column */
        }
        .login-section {
            display: flex; /* Flexbox for centering content */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            background-color: #D3D3D3; /* Light grey background for the section */
            height: 100%; /* Full height of the column */
            padding: 0 1cm; /* Add padding of 1cm to both sides */
            grid-column: 2 / 3; /* Second column */
        }
        .login-box {
            width: 100%; /* Full width of the login section */
            max-width: 300px; /* Max width of the login box */
            padding: 20px; /* Add padding inside login box */
            background-color: #ffffff; /* White background for the box */
            border: 1px solid #ccc; /* Light gray border */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Shadow for depth */
        }
        input[type="text"], input[type="password"] {
            width: calc(100% - 20px); /* Set width of input fields minus padding */
            padding: 10px; /* Add padding inside input fields */
            margin: 10px 0; /* Add margin around input fields */
            border: 1px solid #ccc; /* Light gray border */
            border-radius: 4px; /* Rounded corners for input fields */
            box-sizing: border-box; /* Include padding and border in element's total width and height */
        }
        button[type="submit"] {
            background-color: #2E8B57; /* Bluish green background for login button */
            color: white; /* White text color */
            padding: 10px 20px; /* Add padding inside button */
            border: none; /* Remove default button border */
            border-radius: 4px; /* Rounded corners for button */
            cursor: pointer; /* Cursor on hover */
            transition: background-color 0.3s; /* Smooth transition for background color */
        }
        button[type="submit"]:hover {
            background-color: #228B22; /* Darker bluish green background on hover */
        }
        .error-message {
            color: red; /* Red color for error message */
            margin-top: 10px; /* Margin above error message */
            text-align: center; /* Center align error message */
        }
        .signup-link {
            text-align: center; /* Center align the signup link */
            margin-top: 20px; /* Margin above signup link */
        }
        .signup-link a {
            color: #2E8B57; /* Color of the signup link */
            text-decoration: none; /* Remove underline from link */
        }
        .signup-link a:hover {
            text-decoration: underline; /* Underline on hover */
        }
    </style>
</head>
<body>
    <div class="image-section"></div>
    <div class="login-section">
        <div class="login-box">
            <h2>Login to Online Banking</h2>
            <form action="LoginServlet" method="post">
                <label for="username">Enter Username:</label>
                <input type="text" id="username" name="username" required>
                
                <label for="password">Enter Password:</label>
                <input type="password" id="password" name="password" required>
                
                <button type="submit">Login</button>
                
                <!-- Display error message if it exists -->
                <c:if test="${not empty param.message}">
                    <div class="error-message">${param.message}</div>
                </c:if>
            </form>
            <div class="signup-link">
                <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
                <p>Are you an admin? <a href="adminlogin.jsp">Admin Login</a></p>
            </div>
        </div>
    </div>
</body>
</html>
