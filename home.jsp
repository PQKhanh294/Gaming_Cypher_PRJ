<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cypher Gaming</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/home.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js" defer></script>
</head>
<body>
    <!-- Navbar -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- Hero Section -->
    <header class="hero-section">
        <img src="img/home0.png" alt="Cypher Gaming" class="hero-image">
        <div class="overlay">
            <h1>Welcome to Cypher Gaming</h1>
            <p>Experience the ultimate gaming space with professional services.</p>
            <button class="btn btn-light btn-lg">Join Now</button>
        </div>
    </header>

    <!-- Gaming Sections -->
    <div class="gallery">
        <div class="section active" onclick="expandSection(this)">
            <img src="img/home1.png" alt="Arena">
            <div class="text-content">
                <h3>ESPORTS Space</h3>
                <h2>ARENA</h2>
                <p>Possessing a modern design style that emphasizes customer experience...</p>
            </div>
        </div>
        <div class="section" onclick="expandSection(this)">
            <img src="img/home2.png" alt="Decor">
            <div class="text-content">
                <h3>ESPORTS SPACE</h3>
                <h2>DECOR</h2>
                <p>Possessing a modern design style that emphasizes customer experience...</p>
            </div>
        </div>
        <div class="section" onclick="expandSection(this)">
            <img src="img/home3.png" alt="Clean">
            <div class="text-content">
                <h3>ESPORTS Space</h3>
                <h2>CLEAN</h2>
                <p>Possessing a modern design style that emphasizes customer experience...</p>
            </div>
        </div>
        </div>
    <div class="container custom-section">
    <!-- Row 1 -->
    <div class="row align-items-center mb-5">
        <div class="col-md-6 image-section">
            <img src="img/home4.png" alt="Gaming Monitor" class="img-fluid">
        </div>
        <div class="col-md-6 text-content2">
            <h3>PRJ ESPORTS ARENA</h3>
            <h2>Screen 240Hz - 360Hz</h2>
            <p>Equipped with 100% 240Hz screens from top brands like Samsung, Predator, and Asus, and is a pioneer in using the Zowie XL2566K 360Hz display.</p>
        </div>
    </div>

    <!-- Row 2 -->
    <div class="row align-items-center">
        <div class="col-md-6 text-content2">
            <h3>PRJ ESPORTS ARENA</h3>
            <h2>HI-END GEAR</h2>
            <p>Using gaming gear according to eSports standards, including: AKKO mechanical keyboard, Endgame Gear gaming mouse from Germany, and Zowie EC series mouse.</p>
        </div>
        <div class="col-md-6 image-section">
            <img src="img/home5.png" alt="Gaming Monitor" class="img-fluid">
        </div>
    </div>
</div>
    <div class="contact-section">
    <div class="col-md-6 contact-image">
        <img src="img/home6.png" alt="Contact Image">
    </div>
    <div class="col-md-6 contact-form">
        <form>
            <select>
                <option>PRJ Esports Center </option>
            </select>
            <input type="text" placeholder="Full Name">
            <input type="text" placeholder="Phone Number">
            <input type="email" placeholder="Email">
            <textarea placeholder="Message"></textarea>
            <button type="submit">SEND</button>
        </form>
    </div>
</div>   
</body>
<footer class="footer bg-dark text-light py-4">
    <div class="container">
        <div class="row">
            <!-- Social Media Section -->
            <div class="col-md-4 footer-content">
                <h4 class="footer-title">SOCIAL MEDIA</h4>
                <ul class="list-unstyled">
                    <li><i class="fab fa-facebook"></i> PRJ Gaming</li>
                    <li><i class="fas fa-phone"></i> (+84) 704 599 624</li>
                    <li><i class="fab fa-discord"></i> DISCORD</li>
                    <li><i class="fab fa-tiktok"></i> @prj.gaming</li>
                    <li><i class="fas fa-envelope"></i> <a href="mailto:contact@vikingsgaming.com" class="text-white">contact@vikings.gaming</a></li>
                </ul>
            </div>
            <div class="col-md-4 footer-content">
                <h5>LINKS</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-light">Home</a></li>
                    <li><a href="#">Order</a></li>
                    <li><a href="#">Booking</a></li>
                    <li><a href="#">Services</a></li>
                </ul>
            </div>
            <div class="col-md-4 footer-content">
                <h5>EVENTS & OFFERS</h3>
                <ul class="list-unstyled">
                    <li><a href="#">Tournaments & Events</a></li>
                    <li><a href="#">Discounts</a></li>
                    <li><a href="#">Membership</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-bottom text-center mt-3">
        <p class="mb-0">&copy; 2025 PRJ Gaming. All rights reserved.</p>
    </div>
    <button class="btn btn-warning call-button position-fixed bottom-3 end-3 rounded-circle p-3">
        <i class="fas fa-phone text-white"></i>
    </button>
</footer>
</html>
