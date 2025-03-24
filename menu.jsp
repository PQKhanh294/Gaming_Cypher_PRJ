<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cypher Gaming</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/script.js" defer></script>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <img src="img/logo.png" alt="Cypher Gaming" height="50">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item"><a class="nav-link " href="home.jsp">HOME</a></li>
                            <c:if test="${sessionScope.acc.isAdmin == 0}">
                            <li class="nav-item"><a class="nav-link" href="Product">F&B</a></li>
                            </c:if>
                            <c:if test="${sessionScope.acc.isAdmin == 0}">
                            <li class="nav-item">
                             <a class="nav-link" href="#" onclick="document.getElementById('bookingForm').submit();">BOOKING</a>
                             <form id="bookingForm" action="${pageContext.request.contextPath}/ComputerServlet" method="post" style="display: none;"></form>
                            </li>

                            </c:if>
                        <li class="nav-item"><a class="nav-link" href="#">TOURNAMENTS&EVENTS</a></li>
                            <c:if test="${sessionScope.acc.isAdmin == 1}">
                            <li class="nav-item"><a class="nav-link" href="Manage">MANAGEPRODUCT</a></li>
                            </c:if>
                            <c:if test="${sessionScope.acc.isAdmin == 1}">
                            <li class="nav-item"><a class="nav-link" href="#">VIEWBOOKINGS</a></li>
                            </c:if>
                        <li class="nav-item"><a class="nav-link" href="#">SUPPORT</a></li>
                        <li class="nav-item"><a class="nav-link" href="recruitment.jsp">RECRUITMENT</a></li>
                    </ul>

                    <div class="d-flex">
                        <c:if test="${sessionScope.acc == null}">
                            <a href="login.jsp" class="btn btn-outline-primary me-2">SIGN IN</a>
                        </c:if>
                        <c:if test="${sessionScope.acc != null}">
                            <div class="d-flex align-items-center">
                                <a href="cart.jsp" class="btn btn-outline-primary position-relative me-3">
                                    <i class="fa fa-shopping-cart"></i> Cart
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                        ${sessionScope.cartSize != null ? sessionScope.cartSize : 0}
                                    </span>
                                </a>
                                <form action="Login" method="get" style="display: inline;">
                                    <input type="hidden" name="action" value="logout">
                                    <button type="submit" class="btn btn-outline-primary onclick"window.location.href = 'register.jsp'">SIGN OUT</button>
                                </form>
                            </div>
                        </c:if>

                        <c:if test="${sessionScope.acc == null}">
                            <button class="btn btn-primary" onclick="window.location.href = 'register.jsp'">SIGN UP</button>
                        </c:if>
                    </div>
                </div>
            </div>
        </nav>
    </body>
</html>
