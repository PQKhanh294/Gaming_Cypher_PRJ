package model;

public class CustomerAccount {

    private int uID;
    private String username;
    private String password;
    private String email;
    private int isUser;
    private int isAdmin;

    public CustomerAccount() {
    }

    public CustomerAccount(int uID, String username, String password, String email, int isUser, int isAdmin) {
        this.uID = uID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.isUser = isUser;
        this.isAdmin = isAdmin;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIsUser() {
        return isUser;
    }

    public void setIsUser(int isUser) {
        this.isUser = isUser;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    
}
