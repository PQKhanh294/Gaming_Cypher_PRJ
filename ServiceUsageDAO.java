package dao;

import model.ServiceUsage;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ServiceUsageDAO {

    /**
     * Lấy danh sách sử dụng dịch vụ theo ID phiên sử dụng
     * @param sessionID ID của phiên sử dụng
     * @return Danh sách ServiceUsage
     */
    public List<ServiceUsage> getServiceUsagesBySessionId(int sessionID) {
        List<ServiceUsage> serviceUsages = new ArrayList<>();
        String query = "SELECT * FROM ServiceUsage WHERE SessionID = ?";

        try (Connection conn = DatabaseInfor.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, sessionID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                serviceUsages.add(new ServiceUsage(
                    rs.getInt("ServiceUsageID"),
                    rs.getInt("SessionID"),
                    rs.getInt("ServiceID"),
                    rs.getInt("Quantity"),
                    rs.getDouble("TotalCost")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceUsages;
    }
}
