const context = window.appContext;
// Search Popup
document.addEventListener("DOMContentLoaded", function () {
  // Search popup toggle
  const searchIcon = document.getElementById("search_icon_link");
  const searchPopup = document.getElementById("search-popup");

  if (searchIcon && searchPopup) {
    searchIcon.addEventListener("click", function (e) {
      e.preventDefault();
      searchPopup.classList.toggle("active");
      // Đóng popup khi nhấn ngoài
      setTimeout(() => {
        document.addEventListener("click", function closePopup(e) {
          if (!searchPopup.contains(e.target) && e.target !== searchIcon) {
            searchPopup.classList.remove("active");
            document.removeEventListener("click", closePopup);
          }
        });
      }, 100);
    });
  }

  const searchForm = document.getElementById("searchForm");
  const keywordInput = document.getElementById("keywordInput");
  if (searchForm && keywordInput) {
    // Bắt sự kiện khi click vào nộp form tìm kiếm (icon tìm kiem)
    searchForm.addEventListener("submit", function (e) {
      e.preventDefault(); // Ngăn form gửi đi
      const keyword = keywordInput.value.trim();
      if (keyword) {
        window.location.href = `${context}/search?keyword=${encodeURIComponent(keyword)}`;
      }
    });

    // Bắt sự kiện khi click các từ gợi ý
    document.querySelectorAll(".suggestion-tags a").forEach((link) => {
      link.addEventListener("click", function (e) {
        e.preventDefault();
        const keyword = e.currentTarget.textContent.trim();
        if (keywordInput) keywordInput.value = keyword;
        window.location.href = `${context}/search?keyword=${encodeURIComponent(keyword)}`;
      });
    });
  }
});
