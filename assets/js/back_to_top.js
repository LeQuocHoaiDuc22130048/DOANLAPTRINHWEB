// cuộn lên đầu trang
window.onscroll = function () {
  const backToTopButton = document.getElementById("backToTop");
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
document.getElementById("backToTop").onclick = function (event) {
  event.preventDefault(); // Ngăn chặn hành động mặc định
  window.scrollTo({ top: 0, behavior: "smooth" }); // Cuộn lên từ từ
};
