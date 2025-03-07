package model;

import java.util.Date;

public class Payment {
    private int paymentID;
    private int sessionID;
    private Date paymentDate;
    private String paymentMethod;
    private double totalAmount;

    public Payment() {}

    public Payment(int paymentID, int sessionID, Date paymentDate, String paymentMethod, double totalAmount) {
        this.paymentID = paymentID;
        this.sessionID = sessionID;
        this.paymentDate = paymentDate;
        this.paymentMethod = paymentMethod;
        this.totalAmount = totalAmount;
    }

    public int getPaymentID() { return paymentID; }
    public void setPaymentID(int paymentID) { this.paymentID = paymentID; }

    public int getSessionID() { return sessionID; }
    public void setSessionID(int sessionID) { this.sessionID = sessionID; }

    public Date getPaymentDate() { return paymentDate; }
    public void setPaymentDate(Date paymentDate) { this.paymentDate = paymentDate; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
}
