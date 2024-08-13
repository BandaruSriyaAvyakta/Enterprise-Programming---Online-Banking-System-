package service;

import commodel.Account;
import commodel.Transaction;
import dao.AccountDAO;
import dao.TransactionDAO;

import java.util.Date;
import java.util.List;

public class TransactionService {
    private TransactionDAO transactionDAO = new TransactionDAO();
    private AccountDAO accountDAO = new AccountDAO();

    public boolean transferMoney(String fromUsername, String toUsername, double amount) throws Exception {
        // Validate the amount
        if (amount <= 0) {
            throw new IllegalArgumentException("Transfer amount must be positive.");
        }

        // Get the accounts for both the sender and the recipient
        Account fromAccount = accountDAO.getAccountByUsername(fromUsername);
        Account toAccount = accountDAO.getAccountByUsername(toUsername);

        // Check if accounts exist
        if (fromAccount == null) {
            throw new Exception("Sender account not found.");
        }
        if (toAccount == null) {
            throw new Exception("Recipient account not found.");
        }

        // Check if the sender has sufficient balance
        if (fromAccount.getBalance() < amount) {
            throw new Exception("Insufficient balance.");
        }

        // Start a transaction
        try {
            // Create a transaction record
            Transaction transaction = new Transaction(fromUsername, toUsername, amount, new Date());
            transactionDAO.createTransaction(transaction);

            // Update the account balances
            boolean debitSuccess = accountDAO.updateAccountBalance(fromUsername, fromAccount.getBalance() - amount);
            boolean creditSuccess = accountDAO.updateAccountBalance(toUsername, toAccount.getBalance() + amount);

            // Check if both updates were successful
            if (debitSuccess && creditSuccess) {
                return true;
            } else {
                throw new Exception("Failed to complete the transfer. Please try again.");
            }
        } catch (Exception e) {
            // Rollback logic would be here if using transactions
            throw new Exception("Transaction failed: " + e.getMessage());
        }
    }

    public List<Transaction> getTransactionHistory(String username) throws Exception {
        return transactionDAO.getTransactionHistory(username);
    }
}
