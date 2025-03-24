<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chatbot UI</title>

    <!-- Google Fonts & Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Symbols+Outlined">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0&family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0">
    <link rel="stylesheet" href="css/style.css">

    <!-- JavaScript -->
    <script src="js/script.js" defer></script>
</head>
<body>

    <!-- Button Toggle Chatbot -->
    <button id="chatbot-toggler" class="chatbot-toggler">
    <span class="material-symbols-outlined">mode_comment</span> <!-- First span -->
    <span class="material-symbols-outlined">close</span> <!-- Second span -->
</button>

<!--    <button class="chatbot-toggler">
        <span class="material-symbols-outlined">mode_comment</span>
        <span class="material-symbols-outlined">close</span>
    </button>-->

    <!-- Chatbot UI -->
    <div class="chatbot">
        <header>
            <h2>BackDoorBot</h2>
            <span class="material-symbols-outlined close-btn">keyboard_arrow_down</span>
        </header>

        <ul class="chatbox">
            <li class="chat incoming">
                <span class="material-symbols-outlined">smart_toy</span>
                <p>Hi there! <br> How can I help you today?</p>
            </li>
        </ul>

        <div class="chat-input">
            <textarea placeholder="Type a message..."></textarea>
            <button id="send-btn">
                <span class="material-symbols-outlined">send</span>
            </button>
        </div>
    </div>

</body>
</html>
