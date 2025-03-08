import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAO {
    public List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        String query = "SELECT * FROM Payment";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                payments.add(new Payment(
                    rs.getInt("PaymentID"),
                    rs.getInt("SessionID"),
                    rs.getTimestamp("PaymentDate"),
                    rs.getString("PaymentMethod"),
                    rs.getDouble("TotalAmount")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }
}
