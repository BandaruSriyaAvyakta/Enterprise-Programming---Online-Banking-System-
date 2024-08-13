<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transfer Money</title>
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
            color: #D2AC47; /* Gold color for text */
        }
        h2 {
            color: #D4AF37; /* Gold color for heading */
            margin-bottom: 1.5em; /* Margin below heading */
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: left; /* Align text to the left inside the form */
        }
        .form-group {
            width: 100%; /* Full width of the form group */
            margin-bottom: 1em; /* Space below each form group */
            display: flex;
            justify-content: space-between; /* Space out label and input */
            align-items: center;
        }
        .form-group label {
            width: 40%; /* Set width of label */
            margin-right: 1em; /* Space between label and input */
        }
        input[type="text"], input[type="number"] {
            width: 60%; /* Set width of input fields */
            padding: 8px; /* Add padding inside input fields */
            border: 1px solid #D2AC47; /* Gold border for input fields */
            border-radius: 4px; /* Rounded corners for input fields */
            box-sizing: border-box; /* Include padding and border in element's total width and height */
        }
        button[type="submit"] {
            background-color: #D2AC47; /* Gold background */
            color: black; /* Black text color */
            padding: 10px 20px; /* Add padding inside button */
            border: none; /* Remove default button border */
            border-radius: 4px; /* Rounded corners for button */
            cursor: pointer; /* Cursor on hover */
            transition: background-color 0.3s; /* Smooth transition for background color */
        }
        button[type="submit"]:hover {
            background-color: #c89c4f; /* Slightly darker gold on hover */
        }
        .error-message {
            color: red; /* Red color for error messages */
            font-size: 0.9em; /* Slightly smaller font size */
            margin-top: 1em; /* Space above the error message */
        }
    </style>
    <script>
        function validateForm(event) {
            var amount = document.getElementById("amount").value;
            var errorMessage = "";

            // Check if amount is less than or equal to 0
            if (amount <= 0) {
                errorMessage = "Amount must be more than 0 rupees.";
            }

            // Display error message if any
            if (errorMessage) {
                document.getElementById("error-message").innerText = errorMessage;
                event.preventDefault(); // Prevent form submission
            }
        }

        window.onload = function() {
            // Display error messages from request attributes
            var errorMessage = '<%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>';
            if (errorMessage) {
                document.getElementById("error-message").innerText = errorMessage;
            }
        };
    </script>
</head>
<body>
    <div class="card">
        <h2>Transfer Money</h2>
        <form action="TransferServlet" method="post" onsubmit="validateForm(event)">
            <div class="form-group">
                <label for="toUsername">To Username:</label>
                <input type="text" id="toUsername" name="toUsername" required>
            </div>
            <div class="form-group">
                <label for="amount">Amount:</label>
                <input type="number" id="amount" name="amount" min="1" required>
            </div>
            <button type="submit">Transfer</button>
            <div id="error-message" class="error-message"></div>
        </form>
    </div>
</body>
</html>
