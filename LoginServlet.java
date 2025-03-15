/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.CustomerAccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CustomerAccount;

/**
 *
 * @author ASUS
 */
public class LoginServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("logout".equalsIgnoreCase(action)) {
            // Xóa session
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }

            // Xóa cookie email
            Cookie emailCookie = new Cookie("userEmail", "");
            emailCookie.setMaxAge(0); // Xóa cookie ngay lập tức
            emailCookie.setPath("/");
            response.addCookie(emailCookie);

            // Chuyển hướng về trang login
            response.sendRedirect("index.html");
            return;
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Gọi phương thức kiểm tra tài khoản từ database
        CustomerAccount customer = CustomerAccountDAO.validateLogin(email, password);

        if (customer != null) {
            // Đăng nhập thành công -> Lưu session và chuyển hướng đến FruitServlet
            HttpSession session = request.getSession();
            Cookie emailCookie = new Cookie("userEmail", email);
            emailCookie.setMaxAge(7 * 24 * 60 * 60); // 7 ngày
            emailCookie.setPath("/");
            response.addCookie(emailCookie);
            
            session.setAttribute("loggedInUser", customer);
            
            response.sendRedirect("FruitServlet?status=success");
        } else {
            // Đăng nhập thất bại -> Quay lại login.jsp với thông báo lỗi
            response.sendRedirect("login.jsp?error=1");
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
