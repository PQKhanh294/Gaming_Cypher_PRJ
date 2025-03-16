/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import model.CustomerAccount;
import org.apache.catalina.User;

/**
 *
 * @author ASUS
 */
public class CustomerAccountDAO {

    public static CustomerAccount validateLogin(String username, String password) {
        CustomerAccount user = null;
        String query = "SELECT uID, user, pass, email, isUser, isAdmin FROM User WHERE email=? AND Pasword=?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int uID = rs.getInt("uID");
                String email = rs.getString("email");
                int isUser = rs.getInt("isUser");
                int isAdmin = rs.getInt("isAdmin");

                // Tạo đối tượng User từ dữ liệu lấy được
                user = new CustomerAccount(uID, username, password, email, isUser, isAdmin);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public static boolean registerAccount(String username, String password, String email) {
        String query = "INSERT INTO User (user, pass, email, isUser, isAdmin) VALUES (?, ?, ?, ?, ?)";

    try (Connection conn = DBConnection.getConnection(); 
         PreparedStatement pstmt = conn.prepareStatement(query)) {

        pstmt.setString(1, username);
        pstmt.setString(2, password); // Lưu mật khẩu trực tiếp (không mã hóa)
        pstmt.setString(3, email);
        pstmt.setInt(4, 1); // Mặc định là User bình thường
        pstmt.setInt(5, 0); // Mặc định là không phải Admin

        int rowsInserted = pstmt.executeUpdate();
        return rowsInserted > 0; // Trả về true nếu đăng ký thành công

    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false; // Đăng ký thất bại
    }

    // Phương thức kiểm tra tài khoản đã tồn tại chưa
    public static boolean isUsernameExists(String username) {
        String query = "SELECT AccountID FROM CustomerAccount WHERE Username = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            return rs.next(); // Nếu có dữ liệu trả về, nghĩa là username đã tồn tại

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
