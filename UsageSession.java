package model;

import java.util.Date;

public class UsageSession {
    private int sessionID;
    private int customerID;
    private int computerID;
    private Date startTime;
    private Date endTime;
    private double totalTime;
    private double cost;

    public UsageSession() {}

    public UsageSession(int sessionID, int customerID, int computerID, Date startTime, Date endTime, double cost, double aDouble1) {
        this.sessionID = sessionID;
        this.customerID = customerID;
        this.computerID = computerID;
        this.startTime = startTime;
        this.endTime = endTime;
        this.cost = cost;
    }

    public int getSessionID() { return sessionID; }
    public void setSessionID(int sessionID) { this.sessionID = sessionID; }

    public int getCustomerID() { return customerID; }
    public void setCustomerID(int customerID) { this.customerID = customerID; }

    public int getComputerID() { return computerID; }
    public void setComputerID(int computerID) { this.computerID = computerID; }

    public Date getStartTime() { return startTime; }
    public void setStartTime(Date startTime) { this.startTime = startTime; }

    public Date getEndTime() { return endTime; }
    public void setEndTime(Date endTime) { this.endTime = endTime; }

    public double getTotalTime() { return totalTime; }
    public void setTotalTime(double totalTime) { this.totalTime = totalTime; }

    public double getCost() { return cost; }
    public void setCost(double cost) { this.cost = cost; }
}
