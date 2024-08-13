package commodel;

import java.util.Date;

public class Transaction {
    private String fromUsername;
    private String toUsername;
    private double amount;
    private Date date;

    public Transaction(String fromUsername, String toUsername, double amount, Date date) {
        this.fromUsername = fromUsername;
        this.toUsername = toUsername;
        this.amount = amount;
        this.date = date;
    }

    // Getters and Setters
    public String getFromUsername() { return fromUsername; }
    public void setFromUsername(String fromUsername) { this.fromUsername = fromUsername; }
    public String getToUsername() { return toUsername; }
    public void setToUsername(String toUsername) { this.toUsername = toUsername; }
    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }
}
