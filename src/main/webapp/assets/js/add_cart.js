document.addEventListener("submit", function (event) {
    if (event.target && event.target.classList.contains("addCartForm")) {
        event.preventDefault();

        const form = event.target;

        let quantityInput = form.querySelector('input[name="quantity"]');
        let minusBtn = form.querySelector(".minus");
        let plusBtn = form.querySelector(".plus");

        // Nếu không có input quantity, gán mặc định là 1
        if (!quantityInput) {
            quantityInput = document.createElement("input");
            quantityInput.type = "hidden";
            quantityInput.name = "quantity";
            quantityInput.value = "1";
            form.appendChild(quantityInput);
        }

        // Sự kiện giảm số lượng
        if (minusBtn) {
            minusBtn.addEventListener("click", function () {
                let currentVal = parseInt(quantityInput.value, 10);
                if (currentVal > 1) {
                    quantityInput.value = currentVal - 1;
                }
            });
        }

        // Sự kiện tăng số lượng
        if (plusBtn) {
            plusBtn.addEventListener("click", function () {
                let currentVal = parseInt(quantityInput.value, 10);
                quantityInput.value = currentVal + 1;
            });
        }

        const product_id = form.querySelector('input[name="id"]').value;
        const quantity = quantityInput.value;
        addCart(product_id, quantity);
    }
});

function addCart(product_id, quantity) {
    fetch(window.location.origin + "/DoAnWeb/add-cart", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: new URLSearchParams({ id: product_id, quantity: quantity })
    })
        .then(response => response.json())
        .then(data => {
            document.querySelector(".cart-count").textContent = data.cartQuantity;

            // Hiển thị thông báo đẹp mắt (SweetAlert2)
            Swal.fire({
                text: "Sản phẩm đã được thêm vào giỏ hàng.",
                icon: "success",
                showConfirmButton: false,
                timer: 2000,
                position: "top-end",
                toast: true
            });
        });
}
