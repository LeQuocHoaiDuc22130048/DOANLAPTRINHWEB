
  document.addEventListener("DOMContentLoaded", function () {
const loggedInUser = sessionStorage.getItem("loggedInUser");  // Lấy thông tin người dùng từ sessionStorage

if (loggedInUser) {
// Nếu người dùng đã đăng nhập, hiển thị tên người dùng
const user = JSON.parse(loggedInUser);
document.getElementById("username-info").style.display = "block";  // Hiển thị phần tên người dùng
document.getElementById("username").textContent = user.username;    // Gán tên người dùng vào thẻ span
document.getElementById("login-link").style.display = "none";       // Ẩn liên kết đăng nhập
} else {
// Nếu chưa đăng nhập, hiển thị lại liên kết đăng nhập
document.getElementById("username-info").style.display = "none";  // Ẩn tên người dùng
document.getElementById("login-link").style.display = "block";    // Hiển thị liên kết đăng nhập
}
});

