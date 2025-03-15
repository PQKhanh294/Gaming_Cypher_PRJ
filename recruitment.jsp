<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Application - Cypher Gaming</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-center mb-4">Job Application</h2>

            <form action="RecruitmentServlet" method="post">
                <div class="row">
                    <!-- Full Name -->
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Full Name</label>
                        <input type="text" name="fullname" class="form-control" required>
                    </div>

                    <!-- Age -->
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Age</label>
                        <input type="number" name="age" class="form-control" min="18" required>
                    </div>

                    <!-- Address -->
                    <div class="col-12 mb-3">
                        <label class="form-label fw-bold">Address</label>
                        <input type="text" name="address" class="form-control" required>
                    </div>

                    <!-- Citizen ID -->
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Citizen ID</label>
                        <input type="text" name="cccd" class="form-control" required>
                    </div>

                    <!-- Email -->
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>

                    <!-- Phone Number -->
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Phone Number</label>
                        <input type="tel" name="phone" class="form-control" required>
                    </div>

                    <!-- Job Position -->
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Job Position</label>
                        <select name="position" class="form-select" required>
                            <option value="Waiter">Waiter</option>
                            <option value="Chef">Chef</option>
                            <option value="HR Manager">HR Manager</option>
                        </select>
                    </div>

                    <!-- Application Reason -->
                    <div class="col-12 mb-3">
                        <label class="form-label fw-bold">Why do you want to apply?</label>
                        <textarea name="reason" class="form-control" rows="3" required></textarea>
                    </div>

                    <!-- Submit Button -->
                    <div class="col-12 text-center">
                        <button type="submit" class="btn btn-success w-50">Submit Application</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
