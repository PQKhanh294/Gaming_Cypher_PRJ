/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.*;
/**
 *
 * @author ASUS
 */
public class CustomerAccountDAO {
    public boolean validateLogin(String username, String password) {
        String query = "SELECT * FROM CustomerAccount WHERE Username = ? AND Pasword = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            return rs.next(); // Nếu có dữ liệu => Đăng nhập thành công
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
