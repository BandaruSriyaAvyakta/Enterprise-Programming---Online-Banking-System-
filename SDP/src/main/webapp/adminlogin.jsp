<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
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
        .login-box {
            width: 350px;
            padding: 20px;
            background-color: #F4CF83; /* Light yellow */
            border: 2px solid #765952; /* Brown border */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        h2 {
            color: #333; /* Black text color */
            font-family: 'Times New Roman', Times, serif;
            font-size: 2em;
            margin-top: 0;
            margin-bottom: 1em;
        }
        input[type="text"], input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #333; /* Black border */
            border-radius: 4px;
            background-color: #FFFFE0; /* Light yellow */
            color: #333; /* Black text color */
        }
        button[type="submit"] {
            background-color: #765952; /* Brown */
            color: white; /* White text */
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
            width: 100%;
        }
        button[type="submit"]:hover {
            background-color: #6c4f40; /* Slightly darker brown on hover */
        }
        .error-message {
            color: red;
            margin-top: 10px;
            text-align: center;
        }
        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
        }
        .back-link a {
            text-decoration: none;
            color: black; /* Black link */
            font-size: 16px;
        }
        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Admin Login</h2>
        <form action="AdminLoginServlet1" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <button type="submit">Login</button>
            
            <!-- Display error message if it exists -->
            <c:if test="${not empty param.message}">
                <div class="error-message">${param.message}</div>
            </c:if>
        </form>

        <!-- Back to Home Page link -->
        <div class="back-link">
            <a href="welcome.jsp">Back to Home Page</a>
        </div>
    </div>
</body>
</html>
