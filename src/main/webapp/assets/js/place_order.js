$(document).ready(function () {
    $(".button_order").click(function () {

        let payment_method = $("input[name='payment_method']:checked").val();

        // Kiểm tra nếu chưa chọn phương thức thanh toán
        if (!payment_method) {
            Swal.fire({
                icon: 'warning',
                title: 'Lỗi!',
                text: 'Vui lòng chọn phương thức thanh toán!',
                confirmButtonText: 'OK',
                width: '400px',
                height: '150px'
            });
            return;
        }

        //data
        const data = {
            customerName: $(".customer_details input[name='customerName']").val(),
            phoneNumber: $(".customer_details input[name='phoneNumber']").val(),
            email: $(".customer_details input[name='email']").val(),
            city: $("#city option:selected").text(),
            district: $("#district option:selected").text(),
            ward: $("#ward option:selected").text(),
            addressDetail: $("#addressDetail").val(),
            specialRequests: $("#specialRequests").val(),
            payment_method: payment_method,
            shippingFee: $("#shippingFeeHidden").val()
        };

        $.ajax({
            url: "place-order",
            type: "POST",
            data: data,
            dataType: "json",
            success: function (response) {
                if (response.status === "success") {
                    if (payment_method === "paypal") {
                        createPayPalOrder();
                    } else {
                        window.location.href = "checkout.jsp";
                    }
                } else if (response.status === "error") {
                    Swal.fire({
                        icon: 'error',
                        text: response.message,
                        confirmButtonText: 'OK',
                        width: '400px',
                        height: '150px'
                    });
                }
            },
            error: function () {
                Swal.fire({
                    icon: 'error',
                    title: 'Lỗi hệ thống!',
                    text: 'Đã xảy ra lỗi. Vui lòng thử lại!',
                    confirmButtonText: 'OK'
                });
            }
        });

    });
});

function createPayPalOrder() {
    //totalAfterDiscount== tong tien don hang sau khi đa tru khuyen mai
    let totalAfterDiscount = $("#total_price_orders").text();

    $.ajax({
        url: "create-paypal-order",
        type: "POST",
        data: { total: totalAfterDiscount },
        dataType: "json",
        success: function (response) {
            if (response.status === "success") {
                window.location.href = "https://www.sandbox.paypal.com/checkoutnow?token=" + response.orderId;
            } else {
                Swal.fire({
                    icon: 'error',
                    text: 'Không thể tạo đơn hàng PayPal!',
                    confirmButtonText: 'OK'
                });
            }
        },
        error: function () {
            Swal.fire({
                icon: 'error',
                text: 'Lỗi kết nối đến PayPal!',
                confirmButtonText: 'OK'
            });
        }
    });
}
