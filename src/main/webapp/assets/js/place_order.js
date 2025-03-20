$(document).ready(function () {
    $(".button_order").click(function () {

        //data
        var data = {
            customerName: $(".customer_details input[name='customerName']").val(),
            phoneNumber: $(".customer_details input[name='phoneNumber']").val(),
            email: $(".customer_details input[name='email']").val(),
            address: $(".delivery_details input[name='address']").val(),
            city: $(".delivery_details input[name='city']").val(),
            payment_method: $("input[name='payment_method']:checked").val()
        };

        $.ajax({
            url: "place-order",
            type:"POST",
            data: data,
            dataType: "json",
            success: function (response) {
                console.log("Response từ server:", response);
                if (response.status === "success") {
                    // Swal.fire({
                    //     icon: 'success',
                    //     title: 'Thành công!',
                    //     text: response.message,
                    //     confirmButtonText: 'OK'
                    // }).then(() => {
                        window.location.href = "gio_hang.jsp";
                    // });
                } else {
                    Swal.fire({
                        icon: 'error',
                        text: response.message,
                        confirmButtonText: 'OK',
                        width: '400px',
                        height:'150px'
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
