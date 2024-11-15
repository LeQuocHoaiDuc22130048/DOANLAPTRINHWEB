

const sendMessButton = document.getElementById("send-message");
const messInput = document.getElementById("message-input");
const messContainer = document.getElementById("message");

// sự kiện click cho nút gửi
sendMessButton.addEventListener("click",()=>{

    const messText = messInput.value.trim();// lấy tin nhắn

    if(messText){
        const messEle = document.createElement("div");
        messEle.classList.add("message");
        messEle.textContent=messText;

        //bỏ tin nhắn vào thẻ div message
        messContainer.appendChild(messEle);

        // hiển thị tin nhắn mới nhất
        messContainer.scrollTop=messContainer.scrollHeight;
        // xóa tin nhắn trong hộp soạn tin nhắn sau khi gửi
        messInput.value='';
    }
});


    
