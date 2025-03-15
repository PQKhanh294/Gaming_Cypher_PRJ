<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script>
        function validateForm() {
            let username = document.getElementById("inputEmail").value.trim();
            let password = document.getElementById("inputPassword").value;

            if (username === "" || password === "") {
                alert("Vui lòng nhập đầy đủ thông tin!");
                return false;
            }
            return true;
        }

        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("btn-signup").addEventListener("click", function() {
                window.location.href = "register.jsp";
            });
        });
    </script>
    <style>
        body {
            background-color: #f4f4f4;
        }
        .form-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .btn:hover {
            transform: scale(1.05);
            transition: 0.3s;
        }
        <%String error = request.getParameter("error");%>        
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <form class="form-signin" action="LoginServlet" method="post" onsubmit="return validateForm();">
                <h1 class="h3 mb-3 text-center">Sign in</h1>
                
                <%-- Hiển thị thông báo lỗi nếu có --%>
                <% if (error != null) { %>
                <div class="alert alert-danger text-center">Invalid email or password. Please try again.</div>
            <% } %>
  

                <div class="mb-3">
                    <label for="inputEmail" class="form-label">Username</label>
                    <input name="email" type="text" id="inputEmail" class="form-control" placeholder="Enter your username" required>
                </div>

                <div class="mb-3">
                    <label for="inputPassword" class="form-label">Password</label>
                    <input name="pass" type="password" id="inputPassword" class="form-control" placeholder="Enter your password" required>
                </div>

                <div class="form-check mb-3">
                    <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Remember me</label>
                </div>

                <button class="btn btn-success w-100" type="submit"><i class="fas fa-sign-in-alt"></i> Sign in</button>
                <hr>
                <button class="btn btn-primary w-100" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Sign up New Account</button>
                <hr>
                 <a href="home.jsp" class="btn btn-secondary w-100"><i class="fas fa-angle-left"></i> Back to Home</a>
            </form>
        </div>
    </div>
</body>
</html>
