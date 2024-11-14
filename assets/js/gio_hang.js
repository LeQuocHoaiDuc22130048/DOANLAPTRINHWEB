document.addEventListener("DOMContentLoaded", function () {
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
    let cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];
    cartItems.push({ img, name, price });
    localStorage.setItem("cartItems", JSON.stringify(cartItems));

    // updateCartCount(cartItems.length);
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
    cartItems.forEach((item) => addCart(item.img, item.name, item.price));
  }

  function addCart(productImg, productName, productPrice) {
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
          <div class="don_gia">Đơn giá: ${productPrice}</div>
          <input type="number" id="product_quantity" min="1" value="1" style="width: 50px" />
          <div class="so_tien">Số tiền: ${productPrice}</div>
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
          console.log(cartCount);
          localStorage.setItem("cartCount", cartCount);
          updateCartCount(cartCount);
        }
      });

    cartForm.appendChild(addCartItem);
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
});
