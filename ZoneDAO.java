/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author ASUS
 */
public class ZoneDAO {
    public List<Zone> getAllZones() {
        List<Zone> zones = new ArrayList<>();
        String query = "SELECT * FROM Zone";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                zones.add(new Zone(
                    rs.getInt("ZoneID"),
                    rs.getString("NameZone"),
                    rs.getDouble("HourlyRate"),
                    rs.getString("Specification")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return zones;
    }
}
