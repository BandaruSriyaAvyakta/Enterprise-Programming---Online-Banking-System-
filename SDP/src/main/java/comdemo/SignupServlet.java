package comdemo;

import java.io.IOException;
import java.security.SecureRandom;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import commodel.SignupData;
import commodel.SignupModel;
import service.LoginService;

public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final SecureRandom random = new SecureRandom();

    private String generateAccountNumber() {
        int length = 6 + random.nextInt(7); // Generate a number between 6 and 12 digits
        StringBuilder accountNumber = new StringBuilder();
        for (int i = 0; i < length; i++) {
            accountNumber.append(random.nextInt(10)); // Append a random digit
        }
        return accountNumber.toString();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountType = request.getParameter("account_type");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phone_number");
        String dob = request.getParameter("dob");
        int age = Integer.parseInt(request.getParameter("age"));
        String occupation = request.getParameter("occupation");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");
        String registrationDate = java.time.LocalDate.now().toString(); // Current date

        // Simple validation for password confirmation
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // Generate a unique account number
        String accountNumber = generateAccountNumber();

        SignupData signupData = new SignupData();
        signupData.setAccountType(accountType);
        signupData.setName(name);
        signupData.setAddress(address);
        signupData.setPhoneNumber(phoneNumber);
        signupData.setDob(dob);
        signupData.setAge(age);
        signupData.setOccupation(occupation);
        signupData.setUsername(username);
        signupData.setPassword(password);
        signupData.setRegistrationDate(registrationDate);
        signupData.setAccountNumber(accountNumber); // Set the generated account number

        SignupModel signupModel = new SignupModel();
        LoginService loginService = new LoginService();

        try {
            // Save user and account data
            signupModel.saveSignupData(signupData);

            // Save login details
            loginService.saveOrUpdateLogin(username, password);

            response.sendRedirect("login.jsp?message=Registration successful. Please login.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Registration failed. Please try again.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}
