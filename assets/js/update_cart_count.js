// document.addEventListener("DOMContentLoaded", function () {
// Lấy số lượng giỏ hàng từ localStorage khi trang được tải lại
let cartCount = localStorage.getItem("cartCount");
if (cartCount) {
  cartCount = parseInt(cartCount);
} else {
  cartCount = 0; // Nếu không có giá trị trong localStorage, mặc định là 0
}

// Cập nhật số lượng giỏ hàng khi trang được tải lại
updateCartCount(cartCount);

// localStorage.setItem("cartCount", 0); // Thiết lập giá trị giỏ hàng về 0 trong localStorage
// updateCartCount(0);

// Lấy tất cả các nút "Thêm vào giỏ hàng"
const btnAddToCart = document.querySelectorAll(".btn_gio_hang");

// Lặp qua tất cả các nút và gán sự kiện click
btnAddToCart.forEach(function (btn) {
  btn.addEventListener("click", function (event) {
    event.preventDefault();
    cartCount++; // Tăng số lượng giỏ hàng lên 1
    updateCartCount(cartCount); // Cập nhật số lượng hiển thị trong giỏ hàng
    localStorage.setItem("cartCount", cartCount); // Lưu số lượng giỏ hàng vào localStorage
  });
});

// Hàm cập nhật số lượng giỏ hàng trên trang
function updateCartCount(count) {
  const cartCountElement = document.querySelector(".cart-count");
  cartCountElement.innerText = count; // Cập nhật số lượng giỏ hàng vào phần tử .cart-count
}
// });
