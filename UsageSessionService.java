package service;

import dao.UsageSessionDAO;
import model.UsageSession;

import java.util.List;

public class UsageSessionService {
    private final UsageSessionDAO usageSessionDAO;

    public UsageSessionService() {
        this.usageSessionDAO = new UsageSessionDAO();
    }

    /**
     * Tính tổng chi phí sử dụng máy tính trong một phiên sử dụng.
     * @param sessionID ID của phiên sử dụng
     * @return Tổng chi phí (giờ * giá theo giờ)
     */
    public double calculateUsageCost(int sessionID) {
        UsageSession session = usageSessionDAO.getUsageSessionById(sessionID);
        if (session != null) {
            return session.getTotalTime() * session.getCost();
        }
        return 0;
    }

    /**
     * Lấy danh sách tất cả các phiên sử dụng
     * @return Danh sách các phiên sử dụng
     */
    public List<UsageSession> getAllSessions() {
        return usageSessionDAO.getAllUsageSessions();
    }
}
