package dao;

import model.UsageSession;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsageSessionDAO {

    /**
     * Lấy thông tin phiên sử dụng theo ID
     * @param sessionID ID của phiên sử dụng
     * @return Đối tượng UsageSession
     */
    public UsageSession getUsageSessionById(int sessionID) {
        String query = "SELECT * FROM UsageSession WHERE SessionID = ?";
        try (Connection conn = DatabaseInfor.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, sessionID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new UsageSession(
                    rs.getInt("SessionID"),
                    rs.getInt("CustomerID"),
                    rs.getInt("ComputerID"),
                    rs.getTimestamp("StartTime"),
                    rs.getTimestamp("EndTime"),
                    rs.getDouble("TotalTime"),
                    rs.getDouble("Cost")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Lấy danh sách tất cả các phiên sử dụng
     * @return Danh sách UsageSession
     */
    public List<UsageSession> getAllUsageSessions() {
        List<UsageSession> sessions = new ArrayList<>();
        String query = "SELECT * FROM UsageSession";

        try (Connection conn = DatabaseInfor.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

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
