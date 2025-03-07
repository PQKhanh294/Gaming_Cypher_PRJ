package model;

public class Employee {
    private int employeeID;
    private String nameEmployee;
    private String phone;
    private String position;
    private int zoneID;

    public Employee() {}

    public Employee(int employeeID, String nameEmployee, String phone, String position, int zoneID) {
        this.employeeID = employeeID;
        this.nameEmployee = nameEmployee;
        this.phone = phone;
        this.position = position;
        this.zoneID = zoneID;
    }

    public int getEmployeeID() { return employeeID; }
    public void setEmployeeID(int employeeID) { this.employeeID = employeeID; }

    public String getNameEmployee() { return nameEmployee; }
    public void setNameEmployee(String nameEmployee) { this.nameEmployee = nameEmployee; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getPosition() { return position; }
    public void setPosition(String position) { this.position = position; }

    public int getZoneID() { return zoneID; }
    public void setZoneID(int zoneID) { this.zoneID = zoneID; }
}
