<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Computers</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f8f9fa; }
        .container { margin-top: 50px; }
        .card { border: none; transition: 0.3s; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); border-radius: 10px; }
        .card:hover { transform: scale(1.05); }
        .status-available { color: green; font-weight: bold; }
        .status-inuse { color: red; font-weight: bold; }
        .btn-book { background-color: #28a745; color: white; font-weight: bold; border-radius: 20px; padding: 8px 20px; transition: 0.3s; }
        .btn-book:hover { background-color: #218838; }
        .disabled-btn { background-color: #d6d6d6; color: #555; cursor: not-allowed; }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center mb-4">Available Computers</h2>
    <div class="row">
        <% 
            String[] zones = {"PRO", "VIP", "FPS", "STANDARD", "ELITE"};
            for (int i = 1; i <= 30; i++) {
                String zone = zones[i % zones.length]; // Chia zone theo vòng lặp
                boolean isAvailable = Math.random() > 0.3; // 70% có sẵn, 30% đang sử dụng
        %>
        <div class="col-md-4 mb-3">
            <div class="card p-3">
                <h5 class="card-title">Computer <%= i %></h5>
                <p class="text-muted">Zone: <strong><%= zone %></strong></p>
                <% if (isAvailable) { %>
                    <p class="status-available">🟢 Available</p>
                    <button class="btn btn-book">Book Now</button>
                <% } else { %>
                    <p class="status-inuse">🔴 In Use</p>
                    <button class="btn btn-book disabled-btn" disabled>In Use</button>
                <% } %>
            </div>
        </div>
        <% } %>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>