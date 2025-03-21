// cuộn lên đầu trang
const backToTopButton = document.getElementById("backToTop");

window.onscroll = function () {
  if (
    document.body.scrollTop > 100 ||
    document.documentElement.scrollTop > 100
  ) {
    backToTopButton.style.display = "block"; // Hiển thị nút
  } else {
    backToTopButton.style.display = "none"; // Ẩn nút
  }
};

// Cuộn về đầu trang khi nhấn nút
backToTopButton.onclick = function (event) {
  event.preventDefault(); // Ngăn chặn hành động mặc định
  window.scrollTo({ top: 0, behavior: "smooth" }); // Cuộn lên từ từ
};
