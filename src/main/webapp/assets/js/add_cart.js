$(document).ready(function () {
    $(".addCartForm").submit(function () {
        event.preventDefault();
        let form = $(this);
        let quantityInput = form.find('input[name="quantity"]'); // Lấy input số lượng
        let minusBtn = form.find('.minus');
        let plusBtn = form.find('.plus');

        // Nếu không có input quantity, gán mặc định là 1
        if (quantityInput.length === 0) {
            quantityInput = $("<input>").attr({
                type: "hidden",
                name: "quantity",
                value: "1"
            });
            form.append(quantityInput); // Thêm vào form
        }

        // Sự kiện giảm số lượng
        minusBtn.click(function () {
            let currentVal = parseInt(quantityInput.val());
            if (currentVal > 1) {
                quantityInput.val(currentVal - 1);
            }
        });

        // Sự kiện tăng số lượng
        plusBtn.click(function () {
            let currentVal = parseInt(quantityInput.val());
            quantityInput.val(currentVal + 1);
        });

            let product_id = $(this).find('input[name="id"]').val();
            let quantity =quantityInput.val();
            addCart(product_id, quantity);
    });
});

function addCart(product_id, quantity) {
    $.ajax({
        url: window.location.origin + "/DoAnWeb_war/add-cart",
        type: "POST",
        data: {id: product_id, quantity: quantity},
        success: function (respond) {
            $(".cart-count").text(respond.cartQuantity);

            // Hiển thị thông báo đẹp mắt (dùng SweetAlert2)
            Swal.fire({
                text: "Sản phẩm đã được thêm vào giỏ hàng.",
                icon: "success",
                showConfirmButton: false,
                timer: 2000, // Ẩn sau 2 giây
                position: "top-end",
                toast: true
            });
        }
    });


}
