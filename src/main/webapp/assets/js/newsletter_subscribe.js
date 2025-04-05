$(document).ready(function () {
    $("#subscribe").submit(function (event) {
        event.preventDefault();
        let data = new FormData(this);

        let name = $("#name").val().trim();
        let email = $("#email").val().trim();

        // Kiểm tra rỗng
        if (name === "" || email === "") {
            Swal.fire({ text: "Vui lòng nhập đầy đủ thông tin!", icon: "warning", timer: 2000, toast: true });
            return;
        }

        // Kiểm tra định dạng email
        let emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailRegex.test(email)) {
            Swal.fire({ text: "Email không hợp lệ!", icon: "error", timer: 2000, toast: true });
            return;
        }

        $.ajax({
            url: "subscribe",
            type:"POST",
            data: { name: name, email: email},
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