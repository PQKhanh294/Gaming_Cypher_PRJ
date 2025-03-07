package model;

public class Zone {
    private int zoneID;
    private String nameZone;
    private double hourlyRate;
    private String specification;

    public Zone() {}

    public Zone(int zoneID, String nameZone, double hourlyRate, String specification) {
        this.zoneID = zoneID;
        this.nameZone = nameZone;
        this.hourlyRate = hourlyRate;
        this.specification = specification;
    }

    public int getZoneID() { return zoneID; }
    public void setZoneID(int zoneID) { this.zoneID = zoneID; }

    public String getNameZone() { return nameZone; }
    public void setNameZone(String nameZone) { this.nameZone = nameZone; }

    public double getHourlyRate() { return hourlyRate; }
    public void setHourlyRate(double hourlyRate) { this.hourlyRate = hourlyRate; }

    public String getSpecification() { return specification; }
    public void setSpecification(String specification) { this.specification = specification; }
}
