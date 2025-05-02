$(document).ready(function () {
    let urlParams = new URLSearchParams(window.location.search);
    let orderId = urlParams.get('token'); // Lấy orderId từ PayPal
    if (orderId) {
        $.ajax({
            url: "capture-paypal-order",
            type: "GET",
            data: { token: orderId },
            dataType: "json",
            success: function (response) {
                if (response.status === "success") {
                    Swal.fire({
                        icon: 'success',
                        text: 'Thanh toán thành công! Đơn hàng đã được xác nhận.',
                        confirmButtonText: 'OK'
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        text: response.message,
                        confirmButtonText: 'OK'
                    });
                }
            },
            error: function () {
                Swal.fire({
                    icon: 'error',
                    text: 'Lỗi khi xác nhận thanh toán!',
                    confirmButtonText: 'OK'
                });
            }
        });
    }
});