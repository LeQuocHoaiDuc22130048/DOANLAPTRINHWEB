document.addEventListener("DOMContentLoaded", function () {
  function recalculateTotal() {
    calculateTotal(); // Gọi hàm tính lại tổng tiền
  }

  const btn = document.querySelectorAll(".btn_gio_hang");
  btn.forEach(function (element) {
    element.addEventListener("click", function (event) {
      event.preventDefault();
      const btnItem = event.target;
      const product = btnItem.closest(".item");
      const productImg = product.querySelector("img").src;
      const productName = product.querySelector("h4").innerText;
      const productPrice = product.querySelector("span").innerText;
      saveToLocalStorage(productImg, productName, productPrice);
    });
  });

  // Hàm lưu sản phẩm vào localStorage
  function saveToLocalStorage(img, name, price) {
    const unitPrice = parseInt(price.replace(/[^\d]/g, "")) || 0;
    let cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];

    let productExists = false;

    // Kiểm tra nếu sản phẩm đã tồn tại
    cartItems = cartItems.map((item) => {
      if (item.name === name) {
        productExists = true;
        item.quantity += 1; // Tăng số lượng lên 1
        item.totalPrice = item.quantity * item.unitPrice; // Cập nhật tổng tiền
      }
      return item;
    });

    // Nếu sản phẩm chưa tồn tại, thêm mới
    if (!productExists) {
      cartItems.push({
        img,
        name,
        unitPrice,
        quantity: 1,
        totalPrice: unitPrice,
      });
    }

    localStorage.setItem("cartItems", JSON.stringify(cartItems));

    // Cập nhật tổng tiền ngay sau khi thêm sản phẩm
    // loadCartItems();
    alert("Đã thêm sản phẩm vào giỏ hàng");
    calculateTotal();
  }

  // Chỉ thực thi addCart khi đang ở trên trang có .cart_form (giohang.html)
  const cartForm = document.querySelector("form.cart_form");
  if (cartForm) {
    loadCartItems();
  }

  // Hàm tải sản phẩm từ localStorage vào giỏ hàng
  function loadCartItems() {
    let cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];
    // Ẩn sản phẩm mẫu nếu giỏ hàng có sản phẩm
    if (cartItems.length === 0) {
      document.querySelector(".no-list").style.display = "block";
      document.querySelector(".cart_checkout_page").style.display = "none";
    } else {
      document.querySelector(".no-list").style.display = "none";
      document.querySelector(".cart_checkout_page").style.display = "block";
    }
    if (cartItems.length >= 0) {
      document.querySelector(".cart_item").style.display = "none";
    }
    cartItems.forEach((item) =>
      addCart(item.img, item.name, item.unitPrice.toString(), item.quantity)
    );
  }

  function addCart(productImg, productName, productPrice, productQuantity = 1) {
    const unitPrice = parseInt(
      (productPrice && productPrice.toString().replace(/[^\d]/g, "")) || "0"
    );

    const addCartItem = document.createElement("div");
    addCartItem.classList.add("cart_item");
    addCartItem.innerHTML = `
    <div class="product_thumbnail">
    <a href="">
    <img src="${productImg}" alt="" width="150" height="150" />
    </a>
    </div>
    <div class="product_info">
        <div class="product_name">
          <a href="">${productName}</a>
          </div>
        <div class="product_price">
          <div class="don_gia">Đơn giá: ${unitPrice.toLocaleString(
            "vi-VN"
          )} đ</div>
          <input type="number" id="product_quantity" min="1" value="${productQuantity}" style="width: 50px" />
          <div class="so_tien">Số tiền: ${(
            unitPrice * productQuantity
          ).toLocaleString("vi-VN")} đ</div>
        </div>
        <div class="product_remove">
          <i class="fa-solid fa-trash-can"></i><span>Xóa</span>
        </div>
      </div>
    `;
    addCartItem
      .querySelector(".product_remove")
      .addEventListener("click", function () {
        // Hiển thị hộp thoại xác nhận
        const confirmDelete = window.confirm(
          "Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?"
        );

        if (confirmDelete) {
          removeCartItem(productImg);
          addCartItem.remove();
          let cartCount = parseInt(localStorage.getItem("cartCount")) || 0;
          cartCount = Math.max(cartCount - 1, 0);
          localStorage.setItem("cartCount", cartCount);
          updateCartCount(cartCount);
          recalculateTotal();
        }
      });

    // Sự kiện thay đổi số lượng
    addCartItem
      .querySelector("#product_quantity")
      .addEventListener("input", function (event) {
        const quantity = parseInt(event.target.value) || 1;
        const totalPriceElement = addCartItem.querySelector(".so_tien");
        const totalPrice = quantity * unitPrice;

        // Cập nhật tổng tiền
        totalPriceElement.textContent = `Số tiền: ${totalPrice.toLocaleString(
          "vi-VN"
        )} đ`;

        // Cập nhật localStorage
        let cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];
        cartItems = cartItems.map((item) => {
          if (item.name === productName) {
            item.quantity = quantity;
            item.totalPrice = totalPrice;
          }
          return item;
        });
        localStorage.setItem("cartItems", JSON.stringify(cartItems));
        recalculateTotal();
      });

    cartForm.appendChild(addCartItem);
  }

  function calculateTotal() {
    let total = 0;
    const totalElement = document.querySelector("#total_price_orders");
    let cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];

    cartItems.forEach((item) => {
      total += item.totalPrice || 0;
    });

    if (totalElement) {
      totalElement.textContent = `${total.toLocaleString("vi-VN")} `;
    }
  }

  function removeCartItem(productImg) {
    let cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];
    cartItems = cartItems.filter((item) => item.img !== productImg);
    localStorage.setItem("cartItems", JSON.stringify(cartItems));

    if (cartItems.length === 0) {
      document.querySelector(".no-list").style.display = "block";
      document.querySelector(".cart_checkout_page").style.display = "none";
    }
  }

  loadCartItems();
  calculateTotal();
});
