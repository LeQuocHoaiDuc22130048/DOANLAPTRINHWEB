document.addEventListener("DOMContentLoaded", function () {
  // Nút thêm vào giỏ hàng
  const addToCartButton = document.querySelector("#add-to-cart");
  console.log(addToCartButton);

  if (addToCartButton) {
    addToCartButton.addEventListener("click", function (event) {
      event.preventDefault();

      // Lấy thông tin sản phẩm
      const productImg = document.querySelector(".slider img").src;
      const productName = document.querySelector(".product-title").innerText;
      const productPriceText = document.querySelector(
        ".price .woocommerce-Price-amount"
      ).innerText;
      const productPrice =
        parseInt(productPriceText.replace(/[^\d]/g, "")) || 0;
      const quantityInput = document.querySelector(
        ".quantity input.input-text"
      );
      const quantity = parseInt(quantityInput.value) || 1;

      // Tạo đối tượng sản phẩm
      const product = {
        img: productImg,
        name: productName,
        unitPrice: productPrice,
        quantity: quantity,
        totalPrice: productPrice * quantity,
      };

      // Lưu vào localStorage
      let cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];
      let productExists = false;

      // Kiểm tra nếu sản phẩm đã tồn tại
      cartItems = cartItems.map((item) => {
        if (item.name === product.name) {
          productExists = true;
          item.quantity += product.quantity;
          item.totalPrice = item.quantity * item.unitPrice;
        }
        return item;
      });

      // Nếu sản phẩm chưa tồn tại, thêm mới
      if (!productExists) {
        cartItems.push(product);
      }

      localStorage.setItem("cartItems", JSON.stringify(cartItems));

      // Hiển thị thông báo thành công
      alert("Sản phẩm đã được thêm vào giỏ hàng!");

      // Cập nhật số lượng giỏ hàng (nếu có phần hiển thị số lượng)
      updateCartCount();
    });
  }

  // Cập nhật số lượng sản phẩm trong giỏ hàng
  function updateCartCount() {
    const cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];
    const cartCount = cartItems.reduce(
      (total, item) => total + item.quantity,
      0
    );
    const cartCountElement = document.querySelector(".cart-count");
    if (cartCountElement) {
      cartCountElement.innerText = cartCount;
    }
  }

  // Gọi hàm để hiển thị số lượng giỏ hàng ngay khi tải trang
  updateCartCount();
});
