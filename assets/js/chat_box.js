// Show chat box when scrolled down 1000px
window.addEventListener("scroll", function () {
  const chatButton = document.getElementById("chatButton");
  if (window.scrollY >= 1000) {
    chatButton.style.display = "flex";
  }
});

// Toggle chat box visibility on button click
document.getElementById("chatButton").addEventListener("click", function () {
  const chatBox = document.getElementById("chatBox");
  chatBox.style.display = chatBox.style.display === "block" ? "none" : "block";
});
