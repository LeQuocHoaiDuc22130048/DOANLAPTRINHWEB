document.getElementById("chatButton").addEventListener("click", function () {
  const chatBox = document.getElementById("chatBox");
  const hamburgerIcon = document.getElementById("hamburgerIcon");
  const closeIcon = document.getElementById("closeIcon");

  if (chatBox.style.display === "block") {
    chatBox.style.display = "none";
    hamburgerIcon.style.display = "flex";
    closeIcon.style.display = "none";
  } else {
    chatBox.style.display = "block";
    hamburgerIcon.style.display = "none";
    closeIcon.style.display = "flex";
  }
});
