<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script>
        function validateForm() {
            let username = document.getElementById("user-name").value.trim();
            let password = document.getElementById("user-pass").value;
            let repass = document.getElementById("user-repeatpass").value;

            if (username === "" || password === "" || repass === "") {
                alert("Vui lòng nhập đầy đủ thông tin!");
                return false;
            }

            if (password !== repass) {
                alert("Mật khẩu nhập lại không khớp!");
                return false;
            }

            return true;
        }
    </script>
    <style>
        body {
            background-color: #f8f9fa;
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
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <form action="RegisterServlet" method="post" class="form-signup" onsubmit="return validateForm();">
                <h1 class="h3 mb-3 text-center">Sign Up</h1>

                <%-- Hiển thị thông báo từ Servlet nếu có --%>
                <% String message = (String) request.getAttribute("message");
                    if (message != null) { %>
                    <div class="alert alert-warning text-center"><%= message %></div>
                <% } %>

                <div class="mb-3">
                    <label for="user-name" class="form-label">User Name</label>
                    <input name="username" type="text" id="user-name" class="form-control" placeholder="Enter your username" required>
                </div>

                <div class="mb-3">
                    <label for="user-pass" class="form-label">Password</label>
                    <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Enter your password" required>
                </div>

                <div class="mb-3">
                    <label for="user-repeatpass" class="form-label">Repeat Password</label>
                    <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Confirm your password" required>
                </div>

                <button class="btn btn-primary w-100" type="submit"><i class="fas fa-user-plus"></i> Sign Up</button>
                <hr>
                <a href="login.jsp" class="btn btn-secondary w-100"><i class="fas fa-angle-left"></i> Back to Login</a>
            </form>
        </div>
    </div>
</body>
</html>
