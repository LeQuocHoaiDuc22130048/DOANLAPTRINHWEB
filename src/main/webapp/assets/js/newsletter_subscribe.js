$(document).ready(function () {
    $("#subscribe").submit(function (event) {
        event.preventDefault();
        let data = new FormData(this);

        $.ajax({
            url: "subscribe",
            type:"POST",
            data: { name: $("#name").val(), email: $("#email").val() },
            success: function (response){
                Swal.fire({
                    text: response.message,
                    icon: response.success ? "success" : "error",
                    showConfirmButton: false,
                    timer: 2000,
                    position: "top-end",
                    toast: true
                });

                if (response.success) {
                    $("#subscribe")[0].reset(); // Xóa nội dung form
                }
            },
            error: function (){
                Swal.fire({
                    text: "Lỗi kết nối, vui lòng thử lại!",
                    icon: "error",
                    showConfirmButton: false,
                    timer: 2000,
                    position: "top-end",
                    toast: true
                });
            }
        })
    })
});