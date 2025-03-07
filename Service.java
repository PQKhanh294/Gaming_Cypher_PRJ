package model;

public class Service {
    private int serviceID;
    private String nameService;
    private double price;

    public Service() {}

    public Service(int serviceID, String nameService, double price) {
        this.serviceID = serviceID;
        this.nameService = nameService;
        this.price = price;
    }

    public int getServiceID() { return serviceID; }
    public void setServiceID(int serviceID) { this.serviceID = serviceID; }

    public String getNameService() { return nameService; }
    public void setNameService(String nameService) { this.nameService = nameService; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}
