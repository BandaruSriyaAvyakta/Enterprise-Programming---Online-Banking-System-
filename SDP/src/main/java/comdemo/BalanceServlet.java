package comdemo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.AccountService;

public class BalanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountService accountService = new AccountService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");

        try {
            double balance = accountService.checkBalance(username);
            request.setAttribute("balance", balance);
            request.getRequestDispatcher("balance.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging the exception
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to fetch balance");
        }
    }
}
