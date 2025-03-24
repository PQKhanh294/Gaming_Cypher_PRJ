package controller;

import dao.ComputerDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import connect.DBConnect;
import java.io.PrintWriter;
import java.util.List;
import model.Computer;

@WebServlet(name="BookingServlet", urlPatterns={"/BookingServlet"})
public class BookingServlet extends HttpServlet {
    private ComputerDAO computerDAO;

    @Override
    public void init() throws ServletException {
        computerDAO = new ComputerDAO();
    }
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            // Lấy dữ liệu từ form
            int computerId = Integer.parseInt(request.getParameter("computerID"));
            String bookingDate = request.getParameter("bookingDate");
            String startTime = request.getParameter("startTime");
            String endTime = request.getParameter("endTime");
            String purpose = request.getParameter("purpose");

            // Kiểm tra booking trong quá khứ
            java.time.LocalDateTime currentDateTime = java.time.LocalDateTime.now();
            java.time.LocalDate currentDate = currentDateTime.toLocalDate();
            java.time.LocalTime currentTime = currentDateTime.toLocalTime();

            java.time.LocalDate inputDate = java.time.LocalDate.parse(bookingDate);
            java.time.LocalTime inputStartTime = java.time.LocalTime.parse(startTime);

            if (inputDate.isBefore(currentDate) || 
                (inputDate.equals(currentDate) && inputStartTime.isBefore(currentTime))) {
                request.setAttribute("error", "Cannot book in the past!");
                request.getRequestDispatcher("/computers.jsp").forward(request, response);
                return;
            }

            // Kiểm tra xung đột thời gian
            DBConnect dbConnect = new DBConnect();
            try (Connection conn = dbConnect.getConnection()) {
                String checkSql = "SELECT COUNT(*) FROM Bookings WHERE computerID = ? AND bookingDate = ? " +
                                 "AND ((startTime < ? AND endTime > ?) OR (startTime < ? AND endTime > ?))";
                try (PreparedStatement checkPs = conn.prepareStatement(checkSql)) {
                    checkPs.setInt(1, computerId);
                    checkPs.setString(2, bookingDate);
                    checkPs.setString(3, endTime);
                    checkPs.setString(4, startTime);
                    checkPs.setString(5, startTime);
                    checkPs.setString(6, endTime);
                    ResultSet rs = checkPs.executeQuery();
                    if (rs.next() && rs.getInt(1) > 0) {
                        request.setAttribute("error", "Time slot conflicts with an existing booking!");
                        request.getRequestDispatcher("/computers.jsp").forward(request, response);
                        return;
                    }
                }

                // Lưu booking
                String sql = "INSERT INTO Bookings (computerID, bookingDate, startTime, endTime, purpose, status) " +
                            "VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setInt(1, computerId);
                    ps.setString(2, bookingDate);
                    ps.setString(3, startTime);
                    ps.setString(4, endTime);
                    ps.setString(5, purpose != null ? purpose : "");
                    ps.setString(6, "Confirmed");
                    ps.executeUpdate();
                }
            }

            // Làm mới danh sách máy tính
            List<Computer> computers = computerDAO.getAllComputers();
            request.getSession().setAttribute("computers", computers);
            request.setAttribute("computers", computers);
            request.setAttribute("success", "Booking confirmed successfully!");

            request.getRequestDispatcher("/computers.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Error processing booking: " + e.getMessage(), e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}