

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="shortcut icon"
      href="assets/images/logo.png"
      type="image/x-icon"
    />
    <title>Trang đăng kí</title>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="assets/css/bootstrap.min.css"
    />

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css" />
    <link rel="stylesheet" href="assets/css/owl-carousel.css" />
    <link rel="stylesheet" href="assets/css/lightbox.css" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/blog.css" />
    <link rel="stylesheet" href="assets/css/eyestyle.css" />

    <style>
      .sign-in-container {
        display: flex;
        align-items: center;
        justify-content: center;
        max-width: 1700px;
        margin: 0 auto;
        padding-top: 70px;
        padding-bottom: 50px;
      }

      /* Phần chứa hình ảnh */
      .image-section {
        flex: 1;
        max-width: 37%;
        padding-top: 70px;
      }

      .image-section img {
        width: 100%;
        height: auto;
        border-radius: 5px;
      }

      .sign-in-form {
        flex: 1;
        max-width: 600px;
        padding-bottom: 50px;
        padding-left: 50px;
        padding-top: 150px;
      }
      #username-input {
        margin-bottom: 20px;
      }
      #email-input {
        margin-bottom: 20px;
      }
      #matkhau-input {
        margin-bottom: 30px;
      }
      .title {
        font-size: 24px;
        margin-bottom: 10px;
        font-weight: bold;
        text-align: center;
      }

      .sign-in-form h4 {
        color: #666;
        font-size: 15px;
        margin-bottom: 20px;
        text-align: center;
      }

      .form-label {
        font-weight: bold;
        margin-bottom: 5px;
        display: block;
      }

      .form-control {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 14px;
      }

      .text-center {
        padding-top: 20px;
      }

      .btn-sign-in {
        background-color: #6fe3ff;
        color: #000;
        border: none;
        padding: 12px;
        font-size: 16px;
        font-weight: bold;
        width: 100%;
        border-radius: 6px;
        cursor: pointer;
      }

      .btn-sign-in:hover {
        background-color: #5dcfe3;
      }

      .error-message {
        color: #f44336;
        background-color: #ffebee;
        border: 1px solid #f44336;
        border-radius: 4px;
        padding: 10px 15px;
        margin-top: 10px;
        font-size: 14px;
        max-width: 40%;
        font-family: Arial, sans-serif;
        display: none;
        animation: fadeIn 0.3s ease-in-out;
      }

      /* Hiệu ứng xuất hiện mượt */
      @keyframes fadeIn {
        from {
          opacity: 0;
        }
        to {
          opacity: 1;
        }
      }
      /*thông báo tài khoản đã tồn tại*/
      .fail-message {
        color: #dc3545;
        background-color: #f8d7da;
        border: 1px solid #f5c6cb;
        padding: 10px;
        border-radius: 5px;
        margin-top: 10px;
        display: none;
      }

      .success-message {
        color: #0e0e0e;
        background-color: #86e780;
        border: 1px solid #7ad57a;
        padding: 10px;
        border-radius: 5px;
        margin-top: 10px;
        display: none;
      }


    </style>
  </head>
  <body>
    <!-- ***** Header Area Start ***** -->
    <jsp:include page="header.jsp" />
    <!-- ***** Header Area End ***** -->

    <!-- ****** Login Start ***** -->
    <div id="login"></div>
    <!-- ****** Login End ***** -->

    <div class="sign-in-container">
      <div class="image-section">
        <img src="assets\images\background-dangnhap\bg4.png" alt="" />
      </div>
      <div class="sign-in-form">
        <h3 class="title">Đăng kí tài khoản</h3>
        <h4>Hãy đăng kí ngay để được hưởng đặc quyền riêng dành cho bạn</h4>

        <form id="register-form" action="sign-in" method="post">
          <div class="taikhoan">
            <label  class="form-label">Tên tài khoản</label>
            <input
              type="text"
              class="form-control"
              id="username-input"
              name="userName"
              placeholder="Nhập tên tài khoản"
              required
            />
            <div id="error-message" class="error-message"></div>
          </div>

          <div class="email">
            <label  class="form-label">Email</label>
            <input
              type="text"
              class="form-control"
              id="email-input"
              name="email"
              placeholder="Nhập email"
              required
            />
            <div id="error-message" class="error-message"></div>
          </div>

          <div class="matkhau">
            <label class="form-label">Mật khẩu</label>
            <input
              type="password"
              class="form-control"
              id="matkhau-input"
              name="password"
              placeholder="Nhập mật khẩu"
              required
            />
            <div id="error-message" class="error-message"></div>
            <div
              id="account-exists-message"
              class="account-exists-message"
            ></div>
          </div>
          <button type="submit" class="btn btn-sign-in w-100 mb-3">
            Đăng kí
          </button>

          <!-- Nút Đăng ký với Facebook và Google -->
          <div class="text-center mb-3">Hoặc đăng ký với</div>
          <div class="d-flex justify-content-center mb-3">
            <button
              type="button"
              class="btn btn-primary mr-2"
              style="background-color: #3b5998"
            >
              <i class="fab fa-facebook-f"></i> Facebook
            </button>
            <button type="button" class="btn btn-danger">
              <i class="fab fa-google"></i> Google
            </button>
          </div>

          <div class="text-center">
            <span
              >Bạn đã có tài khoản?
              <a href="dang_nhap.jsp">Đăng nhập ngay</a></span
            >
          </div>

          <!-- Thông báo đăng kí thành công -->
          <div id="login-success-message" class="success-message" style="${empty requestScope['success-message'] ? 'display: none;' : 'display: block;'}">
            <p>${requestScope['success-message']}</p>
          </div>

          <!-- Thông báo đăng kí thất bại -->
          <div id="login-fail-message" class="fail-message" style="${empty requestScope['fail-message'] ? 'display: none;' : 'display: block;'}">
            <p>${requestScope['fail-message']}</p>
          </div>

        </form>
      </div>
    </div>

    <!-- ***** Footer Start ***** -->
    <jsp:include page="footer.jsp" />

  </body>
</html>
