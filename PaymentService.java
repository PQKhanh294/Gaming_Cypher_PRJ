package service;

import dao.PaymentDAO;
import model.Payment;

import java.util.List;

public class PaymentService {
    private final PaymentDAO paymentDAO;

    public PaymentService() {
        this.paymentDAO = new PaymentDAO();
    }

    /**
     * Tính tổng số tiền thanh toán cho một phiên sử dụng.
     * @param sessionID ID của phiên sử dụng
     * @param usageCost Chi phí sử dụng máy
     * @param serviceCost Chi phí dịch vụ
     * @return Tổng số tiền thanh toán
     */
    public double calculateTotalPayment(int sessionID, double usageCost, double serviceCost) {
        double totalAmount = usageCost + serviceCost;
        paymentDAO.savePayment(sessionID, totalAmount);
        return totalAmount;
    }

    /**
     * Lấy danh sách các khoản thanh toán
     * @return Danh sách các khoản thanh toán
     */
    public List<Payment> getAllPayments() {
        return paymentDAO.getAllPayments();
    }
}
