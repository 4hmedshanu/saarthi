function toggleChatbot() {
    const modal = document.getElementById("chatbotModal");
    modal.style.display = modal.style.display === "flex" ? "none" : "flex";
}

function sendMessage() {
    const input = document.getElementById("userInput");
    const message = input.value.trim();
    if (!message) return;

    const chatBody = document.getElementById("chatBody");

    const userDiv = document.createElement("div");
    userDiv.className = "user-message";
    userDiv.textContent = message;
    chatBody.appendChild(userDiv);

    input.value = "";
    chatBody.scrollTop = chatBody.scrollHeight;

    setTimeout(() => {
        const botDiv = document.createElement("div");
        botDiv.className = "bot-message";
        botDiv.textContent = getBotResponse(message);
        chatBody.appendChild(botDiv);
        chatBody.scrollTop = chatBody.scrollHeight;
    }, 600);
}

function getBotResponse(msg) {
    msg = msg.toLowerCase();
    if (msg.includes("ticket") || msg.includes("book")) {
        return "You can book a ticket using the 'My Tickets' section.";
    } else if (msg.includes("location") || msg.includes("stop")) {
        return "To find your nearest stop, please click on 'Find My Bus'.";
    } else if (msg.includes("hello") || msg.includes("hi")) {
        return "Hello! How can I help you with your bus journey today?";
    } else {
        return "I'm not sure about that. Try asking about booking or bus info.";
    }
 }


