<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up for Online Banking</title>
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
        .signup-box {
            width: 80%;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #D3D3D3;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: left;
        }
        .signup-box h2 {
            margin-bottom: 20px;
        }
        .signup-box label {
            display: block;
            margin-top: 10px;
        }
        .signup-box input, .signup-box select {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button[type="submit"] {
            background-color: #D2AC47;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button[type="submit"]:hover {
            background-color: #D4AF37;
        }
        .login-link {
            margin-top: 20px;
        }
        .login-link a {
            color: #2E8B57;
            text-decoration: none;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
        .error-message {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="signup-box">
        <h2>Sign Up for Online Banking</h2>
        <form action="SignupServlet" method="post">
            <label for="account_type">Account Type:</label>
            <select name="account_type" id="account_type" required>
                <option value="Savings">Savings</option>
                <option value="Checking">Checking</option>
            </select>

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" maxlength="32" required>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>

            <label for="phone_number">Phone Number:</label>
            <input type="text" id="phone_number" name="phone_number" pattern="\d{10}" title="Phone number must contain exactly 10 digits." required>

            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" max="<%= java.time.LocalDate.now().minusYears(18).toString() %>" required>

            <label for="age">Age:</label>
            <input type="number" id="age" name="age" min="18" required>

            <label for="occupation">Occupation:</label>
            <input type="text" id="occupation" name="occupation" required>

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" pattern="[a-zA-Z0-9]+" title="Username can only contain alphanumeric characters." required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!])[A-Za-z\d@#$%^&+=!]{6,}$" title="Password must be at least 6 characters long and include at least one uppercase letter, one lowercase letter, one digit, and one special character." required>

            <label for="confirm_password">Confirm Password:</label>
            <input type="password" id="confirm_password" name="confirm_password" required>

            <button type="submit">Register</button>

            <div class="error-message">
                <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
            </div>

            <div class="login-link">
                <p>Already have an account? <a href="login.jsp">Login here</a></p>
            </div>
        </form>
    </div>
</body>
</html>
