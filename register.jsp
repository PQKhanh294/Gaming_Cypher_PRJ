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
            let email = document.getElementById("user-email").value.trim();
            let password = document.getElementById("user-pass").value;
            let repass = document.getElementById("user-repeatpass").value;

            if (username === "" || email === "" || password === "" || repass === "") {
                alert("Vui lòng nhập đầy đủ thông tin!");
                return false;
            }

            if (!/^\S+@\S+\.\S+$/.test(email)) {
                alert("Email không hợp lệ!");
                return false;
            }

            if (password.length < 6) {
                alert("Mật khẩu phải có ít nhất 6 ký tự!");
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
                    <input name="username" type="text" id="user-name" class="form-control" placeholder="Nhập username" required>
                </div>

                <div class="mb-3">
                    <label for="user-email" class="form-label">Email</label>
                    <input name="email" type="email" id="user-email" class="form-control" placeholder="Nhập email" required>
                </div>

                <div class="mb-3">
                    <label for="user-pass" class="form-label">Password</label>
                    <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Nhập mật khẩu" required>
                </div>

                <div class="mb-3">
                    <label for="user-repeatpass" class="form-label">Repeat Password</label>
                    <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Nhập lại mật khẩu" required>
                </div>

                <button class="btn btn-primary w-100" type="submit">Sign Up</button>
                <hr>
                <a href="home.jsp" class="btn btn-secondary w-100">Back to Home</a>
            </form>
        </div>
    </div>
</body>
</html>
