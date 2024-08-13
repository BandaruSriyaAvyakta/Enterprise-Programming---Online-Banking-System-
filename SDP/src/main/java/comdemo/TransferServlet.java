package comdemo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.TransactionService;

public class TransferServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String fromUsername = (String) session.getAttribute("username");
        String toUsername = request.getParameter("toUsername");
        double amount;

        // Validate and parse amount
        try {
            amount = Double.parseDouble(request.getParameter("amount"));
            if (amount <= 0) {
                request.setAttribute("errorMessage", "Amount must be greater than zero.");
                request.getRequestDispatcher("transfer.jsp").forward(request, response);
                return;
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid amount format.");
            request.getRequestDispatcher("transfer.jsp").forward(request, response);
            return;
        }

        TransactionService transactionService = new TransactionService();

        try {
            if (transactionService.transferMoney(fromUsername, toUsername, amount)) {
                response.sendRedirect("dashboard.jsp?message=Transfer successful");
            } else {
                request.setAttribute("errorMessage", "Transfer failed.");
                request.getRequestDispatcher("transfer.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("transfer.jsp").forward(request, response);
        }
    }
}
