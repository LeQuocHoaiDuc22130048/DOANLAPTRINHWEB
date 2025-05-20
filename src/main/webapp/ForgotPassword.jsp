<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Quên mật khẩu</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link
      rel="shortcut icon"
      href="assets/images/Website/logo.png"
      type="image/x-icon"
    />
<c:import url="Link.jsp"/>
  </head>
  <body>
    <div class="container d-flex justify-content-between align-items-center p-0">
      <img class="img-thumbnail border-0" style="width: 45%" src="assets/images/background-dangnhap/quen_mk.png" alt="" />
     <div class="container">
       <form class="absolute_center flex-column">
         <div class="mb-3">
           <h1 class="mb-4">Forgot password </h1>
           <p class="text-center text-secondary-emphasis">enter your otp , you shall reset password </p>
         </div>
         <div class="input-group mb-3 w-75">
           <span class="input-group-text" id="basic-addon1">Email</span>
           <input id="forgotEmail" type="email" name="email" class="form-control" placeholder="Enter your email address" aria-label="Username" aria-describedby="basic-addon1">
         </div>
         <div class="input-group mb-3 w-75">
           <span class="input-group-text" id="button-addon2">OTP</span>
           <input type="text" name="otp" class="form-control" placeholder="Enter your OTP" aria-label="Recipient's username" aria-describedby="button-addon2">
         </div>
       <div class="mt-4">
         <a class="btn btn-primary" id="sendOtpLink" type="button" href="#">Get OTP</a>
         <button type="submit" class="btn btn-primary">Submit</button>
       </div>
       </form>
     </div>
    </div>
  <script>
    $(document).ready(function() {
      const forgotForm = $('form.absolute_center');
      const forgotEmailInput = $('#forgotEmail');
      const sendOtpLink = $('#sendOtpLink');

      // Xử lý sự kiện click của nút "Get OTP"
      sendOtpLink.on('click', function(event) {
        event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>

        const email = forgotEmailInput.val();

        if (email.trim() === '') {
          alert('Vui lòng nhập địa chỉ email.');
          return;
        }

        $.ajax({
          url: 'http://localhost:8080/DoAnWeb/send-otp', // Thay thế bằng URL thực tế của bạn
          type: 'POST',
          data: { email: email },
          dataType: 'json',
          success: function(response) {
            if (response.success) {
              alert('OTP đã được gửi đến email của bạn.');
              // Có thể thực hiện thêm hành động sau khi gửi OTP thành công, ví dụ: hiển thị input OTP
            } else {
              alert('Gửi OTP không thành công: ' + response.message);
            }
          },
          error: function(xhr, status, error) {

            console.error('Lỗi AJAX khi gửi OTP:', error);
            alert('Đã có lỗi xảy ra khi gửi OTP.');
          }
        });
      });

      // Xử lý sự kiện submit của form
      forgotForm.on('submit', function(event) {
        event.preventDefault(); // Ngăn chặn hành động submit mặc định của form

        const email = forgotEmailInput.val();
        const otp = $(this).find('input[name="otp"]').val();

        if (email.trim() === '') {
          alert('Vui lòng nhập địa chỉ email.');
          return;
        }

        if (otp.trim() === '') {
          alert('Vui lòng nhập OTP.');
          return;
        }

        $.ajax({
          url: 'http://localhost:8080/DoAnWeb/verify-otp', // Thay thế bằng URL thực tế của bạn để xác minh OTP và đặt lại mật khẩu
          type: 'POST',
          data: { email: email, otp: otp },
          dataType: 'json',
          success: function(response) {
            if (response.success) {
              alert('Xác minh OTP thành công. Bạn có thể đặt lại mật khẩu.');
              // Chuyển hướng người dùng đến trang đặt lại mật khẩu hoặc thực hiện các hành động khác
              window.location.href = 'DoAnWeb/ResetPassword.jsp'; // Ví dụ chuyển hướng
            } else {
              alert('Xác minh OTP không thành công: ' + response.message);
            }
          },
          error: function(xhr, status, error) {
            console.error('Lỗi AJAX khi xác minh OTP:', error);
            alert('Đã có lỗi xảy ra khi xác minh OTP.');
          }
        });
      });
    });
  </script>
  </body>
</html>
