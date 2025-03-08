/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsageSessionDAO {
    public List<UsageSession> getSessionsByCustomer(int customerID) {
        List<UsageSession> sessions = new ArrayList<>();
        String query = "SELECT * FROM UsageSession WHERE CustomerID = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, customerID);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                sessions.add(new UsageSession(
                    rs.getInt("SessionID"),
                    rs.getInt("CustomerID"),
                    rs.getInt("ComputerID"),
                    rs.getTimestamp("StartTime"),
                    rs.getTimestamp("EndTime"),
                    rs.getDouble("TotalTime"),
                    rs.getDouble("Cost")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sessions;
    }
}