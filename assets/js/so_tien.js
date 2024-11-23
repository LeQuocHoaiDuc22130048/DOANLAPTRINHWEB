document.addEventListener("DOMContentLoaded", function () {
  // Lắng nghe sự kiện thay đổi số lượng
  function attachQuantityEvent() {
    const quantityInputs = document.querySelectorAll("#product_quantity");
    quantityInputs.forEach((input) => {
      input.addEventListener("input", function () {
        const parentElement = input.closest(".product_info"); // Phần tử cha chứa thông tin sản phẩm
        const unitPriceElement = parentElement.querySelector(".don_gia");
        const totalPriceElement = parentElement.querySelector(".so_tien");

        // Lấy giá đơn vị
        const unitPrice = parseInt(
          unitPriceElement.textContent.replace(/[^\d]/g, "")
        );

        // Tính toán tổng giá
        const quantity = parseInt(input.value) || 1; // Đảm bảo số lượng hợp lệ
        const totalPrice = unitPrice * quantity;

        // Hiển thị tổng giá
        totalPriceElement.textContent = `Số tiền: ${totalPrice.toLocaleString(
          "vi-VN"
        )}đ`;

        // Cập nhật lại localStorage
        updateLocalStorage(parentElement, quantity, totalPrice); // Thêm tham số totalPrice
      });
    });
  }

  // Hàm cập nhật số lượng trong localStorage
  function updateLocalStorage(productElement, quantity, totalPrice) {
    const productName =
      productElement.querySelector(".product_name a").textContent;
    const unitPrice = parseInt(
      productElement.querySelector(".don_gia").textContent.replace(/[^\d]/g, "")
    );

    let cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];

    // Kiểm tra xem sản phẩm đã có trong cart chưa
    let productExists = false;
    cartItems = cartItems.map((item) => {
      if (item.name === productName) {
        productExists = true;
        return { ...item, quantity, unitPrice, totalPrice }; // Cập nhật quantity và totalPrice
      }
      return item;
    });

    // Nếu sản phẩm chưa có, thêm mới vào localStorage
    if (!productExists) {
      cartItems.push({ name: productName, quantity, unitPrice, totalPrice });
    }

    // Lưu lại danh sách sản phẩm vào localStorage
    localStorage.setItem("cartItems", JSON.stringify(cartItems));

    // Cập nhật lại tổng tiền
    calculateTotal();
  }

  function calculateTotal() {
    let total = 0;
    const totalElement = document.querySelector("#total_price_orders");

    // Lấy các sản phẩm từ localStorage
    let cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];

    // Cộng tổng tiền từ localStorage
    cartItems.forEach((item) => {
      total += item.totalPrice || 0; // Dùng giá trị `totalPrice` đã tính trong updateLocalStorage
    });

    // Hiển thị tổng tiền
    if (totalElement) {
      totalElement.textContent = `${total.toLocaleString("vi-VN")}`;
    }
  }

  // Gọi hàm khi trang được tải
  attachQuantityEvent();
  calculateTotal();

  // Nếu sản phẩm được thêm động, đính kèm lại sự kiện
  const observer = new MutationObserver(function (mutationsList) {
    mutationsList.forEach((mutation) => {
      if (mutation.addedNodes.length) {
        attachQuantityEvent();
      }
    });
  });

  // Theo dõi container chứa các sản phẩm
  const cartForm = document.querySelector("form.cart_form");
  if (cartForm) {
    observer.observe(cartForm, { childList: true });
  }
});
