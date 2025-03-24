<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Computer List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/computer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <i class="fas fa-desktop me-2"></i> Computer List
        </div>
        <div class="text-center mb-4">
            <a href="${pageContext.request.contextPath}/home.jsp" class="btn-custom btn-back"><i class="fas fa-home"></i> Back to Home</a>
            <a href="${pageContext.request.contextPath}/ComputerServlet" class="btn-custom btn-update"><i class="fas fa-sync-alt"></i> Update Status</a>
        </div>

        <c:if test="${not empty success}">
            <div class="alert alert-success"><i class="fas fa-check-circle me-2"></i> ${success}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger"><i class="fas fa-exclamation-triangle me-2"></i> ${error}</div>
        </c:if>

        <c:choose>
            <c:when test="${empty computers}">
                <div class="no-computers"><i class="fas fa-exclamation-triangle me-2"></i> No computers found.</div>
            </c:when>
            <c:otherwise>
                <div class="computer-grid">
                    <c:forEach var="computer" items="${computers}">
                        <div class="computer-card">
                            <div class="computer-id">${computer.id}</div>
                            <i class="fas fa-desktop computer-icon"></i>
                            <div class="computer-name">${computer.name}</div>
                            <div class="computer-zone">${computer.zone}</div>
                            <div class="${computer.status == 'Available' ? 'status-available' : computer.status == 'In Use' ? 'status-booked' : 'status-maintenance'}">
                                ${computer.status == 'In Use' ? 'Booked' : computer.status}
                            </div>
                            <c:if test="${computer.status == 'Available'}">
                                <form action="${pageContext.request.contextPath}/DetailBookingServlet" method="post">
                                    <input type="hidden" name="computerId" value="${computer.id}">
                                    <button type="submit" class="btn-book"><i class="fas fa-book me-2"></i> Book Now</button>
                                </form>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
