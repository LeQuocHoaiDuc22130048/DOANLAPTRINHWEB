


const chatBox = document.getElementById("chat-box");
const messageInput = document.getElementById("message-input");
const sendMessageButton = document.getElementById("send-message");
const closeChatButton = document.getElementById("close-chat");

// hiển thị hợp thoại soạn tin nhắn
chatBox.addEventListener("click", function() {
  chatBox.classList.toggle("opened");
  // Khi chat box mở rộng, hiển thị phần nhập tin nhắn
  if (chatBox.classList.contains("opened")) {
    messageInput.style.display = "block";
    sendMessageButton.style.display = "block";
    closeChatButton.style.display = "block";
  } else {
    messageInput.style.display = "none";
    sendMessageButton.style.display = "none";
    closeChatButton.style.display = "none";
  }
  
  // messageInput.style.display = "block";
  // sendMessageButton.style.display = "block";
  // closeChatButton.style.display = "block";
  
  messageInput.addEventListener("click", function(e) {
    e.stopPropagation();
  });

  sendMessageButton.addEventListener("click", function(e) {
    e.stopPropagation();
  });
});

// Xử lý gửi tin nhắn
sendMessageButton.addEventListener("click", () => {
  const message = messageInput.value.trim();
  if (message) {
    // Hiển thị tin nhắn trong phần chat
    const messageElement = document.createElement("div");
    messageElement.textContent = message;
    document.getElementById("messages").appendChild(messageElement);
    messageInput.value = "";
  }
});

// Xử lý nhấn vào nút "X" để ẩn chat box
closeChatButton.addEventListener("click", function() {
  chatBox.style.display = "none"; 
});


// thu nhỏ chat box
 document.addEventListener("DOMContentLoaded",()=>{
   const chatHeader = document.querySelector(".chat-header");
   // thu nhỏ / mở rộng
   chatHeader.addEventListener("click",()=>{
       chatBox.classList.toggle("minimized");
   });

 });
