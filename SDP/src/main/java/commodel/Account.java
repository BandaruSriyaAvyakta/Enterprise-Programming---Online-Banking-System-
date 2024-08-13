package commodel;

public class Account {
    private String username;
    private double balance;
    private String accountNumber; // Added

    // Getters and Setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getAccountNumber() { // Added
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) { // Added
        this.accountNumber = accountNumber;
    }
}
