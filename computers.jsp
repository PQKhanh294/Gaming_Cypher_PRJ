<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Computer List</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/computer.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <i class="fas fa-desktop"></i> Computer List
        </div>
        
        <div class="text-center">
            <a href="${pageContext.request.contextPath}/home.jsp" class="btn-custom btn-back">
                <i class="fas fa-home"></i> Back to Home
            </a>
            <a href="${pageContext.request.contextPath}/ComputerServlet" class="btn-custom btn-update">
                <i class="fas fa-sync-alt"></i> Update Status
            </a>
        </div>

        <!-- Success Message -->
        <c:if test="${not empty success}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> ${success}
            </div>
        </c:if>

        <!-- Error Message -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-triangle"></i> ${error}
            </div>
        </c:if>

        <!-- Computer List -->
        <c:choose>
            <c:when test="${empty computers}">
                <div class="no-computers">
                    <i class="fas fa-exclamation-triangle"></i> No computers found
                </div>
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
                                    <button type="submit" class="btn-book">
                                        <i class="fas fa-book"></i> Book Now
                                    </button>
                                </form>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
