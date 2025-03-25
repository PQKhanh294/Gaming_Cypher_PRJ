<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/viewbooking.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <i class="fas fa-laptop-code"></i> Computer Lab Bookings
        </div>
        
        <div class="text-center mb-4">
            <a href="${pageContext.request.contextPath}/home.jsp" class="btn btn-neon">
                <i class="fas fa-home"></i> Back to Home
            </a>
        </div>
        
        <c:if test="${not empty error}">
            <div class="alert alert-danger shadow-sm">
                <i class="fas fa-exclamation-circle"></i> ${error}
            </div>
        </c:if>
        
        <c:choose>
            <c:when test="${empty bookings}">
                <div class="alert alert-warning shadow-sm">
                    <i class="fas fa-info-circle"></i> No bookings found.
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-cyber table-hover">
                        <thead>
                            <tr>
                                <th><i class="fas fa-bookmark me-1"></i> Booking ID</th>
                                <th><i class="fas fa-desktop me-1"></i> Computer</th>
                                <th><i class="fas fa-calendar-day me-1"></i> Date</th>
                                <th><i class="fas fa-clock me-1"></i> Start</th>
                                <th><i class="fas fa-clock me-1"></i> End</th>
                                <th><i class="fas fa-tasks me-1"></i> Purpose</th>
                                <th><i class="fas fa-info-circle me-1"></i> Status</th>
                                <th><i class="fas fa-user me-1"></i> User ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="booking" items="${bookings}">
                                <tr>
                                    <td>${booking.bookingID}</td>
                                    <td>${booking.computerID}</td>
                                    <td>${booking.bookingDate}</td>
                                    <td>${booking.startTime}</td>
                                    <td>${booking.endTime}</td>
                                    <td>${booking.purpose}</td>
                                    <td class="${booking.status == 'CONFIRMED' ? 'status-confirmed' : booking.status == 'PENDING' ? 'status-pending' : 'status-cancelled'}">
                                        ${booking.status}
                                    </td>
                                    <td>${booking.userID}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
