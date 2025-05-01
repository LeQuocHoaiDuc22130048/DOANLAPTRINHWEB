$(document).ready(function () {
    $(".button_order").click(function (e) {
        e.preventDefault();

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
                        createCodAndBankConfirmOrder(payment_method);
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
        data: {total: totalAfterDiscount},
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

function createCodAndBankConfirmOrder(payment_method) {
    $.ajax({
        url: "cod_bank_confirm_order",
        type: "POST",
        dataType: "json",
        success: function (response) {
            if (response.status === "success") {
                if (payment_method === 'cod') {
                    Swal.fire({
                        icon: 'success',
                        text: 'Đặt hàng thành công! Đơn hàng của bạn đang chờ xử lý.',
                        confirmButtonText: 'OK'
                    }).then(() => {
                        window.location.href = "Success.jsp";
                    });
                } else {
                    Swal.fire({
                        icon: 'info',
                        title: 'Đặt hàng thành công!',
                        html: `
        <p>Vui lòng <b>chuyển khoản theo thông tin được cung cấp</b> để chúng tôi xử lý đơn hàng của bạn.</p>
        <hr>
        <p>
            <b>Thông tin tài khoản:</b><br>
            Ngân hàng: BIDV<br>
            Số tài khoản: <b>0123456789</b><br>
            Chủ tài khoản: <b>EyeStyle</b><br>
            Nội dung: <b>DH + SĐT</b>
        </p>
    `,
                        confirmButtonText: 'Tôi đã hiểu'
                    }).then(() => {
                        window.location.href = "Success.jsp";
                    });
                }

            } else {
                Swal.fire({
                    icon: 'error',
                    text: 'Có lỗi xảy ra khi xác nhận đơn hàng.',
                    confirmButtonText: 'OK'
                });
            }
        },
        error: function () {
            Swal.fire({
                icon: 'error',
                text: 'Lỗi kết nối với server.',
                confirmButtonText: 'OK'
            });
        }
    });

}
