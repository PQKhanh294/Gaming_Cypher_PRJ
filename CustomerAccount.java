package model;

public class CustomerAccount {
    private int accountID;
    private int customerID;
    private String username;
    private String password;

    public CustomerAccount() {}

    public CustomerAccount(int accountID, int customerID, String username, String password) {
        this.accountID = accountID;
        this.customerID = customerID;
        this.username = username;
        this.password = password;
    }

    public int getAccountID() { return accountID; }
    public void setAccountID(int accountID) { this.accountID = accountID; }

    public int getCustomerID() { return customerID; }
    public void setCustomerID(int customerID) { this.customerID = customerID; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
