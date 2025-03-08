package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author ASUS
 */
public class ComputerDAO {
    public List<Computer> getAvailableComputers() {
        List<Computer> computers = new ArrayList<>();
        String query = "SELECT * FROM Computer WHERE Status = 'Available'";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                computers.add(new Computer(
                    rs.getInt("ComputerID"),
                    rs.getInt("ZoneID"),
                    rs.getString("Status")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return computers;
    }
}
