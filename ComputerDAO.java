package dao;

import connect.DBConnect;
import model.Computer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComputerDAO {
    private DBConnect dbConnect;

    public ComputerDAO() {
        dbConnect = new DBConnect();
    }

    public List<Computer> getAllComputers() throws Exception {
        List<Computer> computers = new ArrayList<>();
        String sql = "SELECT * FROM Computers";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Computer computer = new Computer();
                computer.setId(rs.getInt("ID"));
                computer.setName(rs.getString("name"));
                computer.setZone(rs.getString("zone"));
                computer.setStatus(rs.getString("status"));
                computers.add(computer);
            }
            System.out.println("DAO retrieved: " + computers.size() + " computers");
        } catch (SQLException e) {
            throw new Exception("Error retrieving computers: " + e.getMessage());
        }
        return computers;
    }

    public void updateComputerStatus(int computerId, String status) throws Exception {
        String sql = "UPDATE Computers SET status = ? WHERE ID = ?";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, computerId);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new Exception("Error updating computer status: " + e.getMessage());
        }
    }

    public void updateExpiredBookings() throws Exception {
        String sql = "EXEC UpdateComputerStatus";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.execute();
        } catch (SQLException e) {
            throw new Exception("Error executing stored procedure: " + e.getMessage());
        }
    }
}
