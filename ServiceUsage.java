package model;

public class ServiceUsage {
    private int serviceUsageID;
    private int sessionID;
    private int serviceID;
    private int quantity;
    private double totalCost;

    public ServiceUsage() {}

    public ServiceUsage(int serviceUsageID, int sessionID, int serviceID, int quantity, double totalCost) {
        this.serviceUsageID = serviceUsageID;
        this.sessionID = sessionID;
        this.serviceID = serviceID;
        this.quantity = quantity;
        this.totalCost = totalCost;
    }

    public int getServiceUsageID() { return serviceUsageID; }
    public void setServiceUsageID(int serviceUsageID) { this.serviceUsageID = serviceUsageID; }

    public int getSessionID() { return sessionID; }
    public void setSessionID(int sessionID) { this.sessionID = sessionID; }

    public int getServiceID() { return serviceID; }
    public void setServiceID(int serviceID) { this.serviceID = serviceID; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getTotalCost() { return totalCost; }
    public void setTotalCost(double totalCost) { this.totalCost = totalCost; }
}
