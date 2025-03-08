package service;

import dao.ServiceUsageDAO;
import model.ServiceUsage;

import java.util.List;

public class ServiceUsageService {
    private final ServiceUsageDAO serviceUsageDAO;

    public ServiceUsageService() {
        this.serviceUsageDAO = new ServiceUsageDAO();
    }

    /**
     * Tính tổng chi phí dịch vụ của một phiên sử dụng.
     * @param sessionID ID của phiên sử dụng
     * @return Tổng chi phí dịch vụ
     */
    public double calculateTotalServiceCost(int sessionID) {
        List<ServiceUsage> serviceUsages = serviceUsageDAO.getServiceUsagesBySessionId(sessionID);
        double totalCost = 0;
        for (ServiceUsage usage : serviceUsages) {
            totalCost += usage.getTotalCost();
        }
        return totalCost;
    }
}
