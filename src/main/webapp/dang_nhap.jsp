
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
    <title>Trang đăng nhập</title>
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
    <head>
      <style>
        .login-container {
          display: flex;
          align-items: center;
          justify-content: center;
          max-width: 1700px;
          margin: 0 auto;
          padding-top: 70px;
          padding-bottom: 100px;
        }

        /* Phần chứa hình ảnh */
        .image-section {
          flex: 1;
          max-width: 37%;
          padding-top: 80px;
        }

        .image-section img {
          width: 100%;
          height: 520px;
          border-radius: 5px;
        }

        .login-form {
          flex: 1;
          max-width: 600px;
          padding-bottom: 50px;
          padding-left: 50px;
          padding-top: 80px;
        }
        #username-input {
          margin-bottom: 30px;
        }

        #matkhau-input {
          margin-bottom: 40px;
        }
        .title {
          font-size: 24px;
          margin-bottom: 10px;
          font-weight: bold;
          text-align: center;
        }

        .login-form h4 {
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
          padding-top: 30px;
        }

        .remember-container {
          display: flex;
          align-items: center;
          justify-content: space-between;
          padding-left: 30px;
          padding-bottom: 30px;
        }
        .btn-login {
          background-color: #6ffffd;
          color: #000;
          border: none;
          padding: 12px;
          font-size: 16px;
          font-weight: bold;
          width: 100%;
          border-radius: 6px;
          cursor: pointer;
        }

        .btn-login:hover {
          background-color: #5dcfe3;
        }

        .success-message {
          background-color: #08ef68;
          color: white;
          padding: 10px;
          text-align: center;
          border-radius: 5px;
          margin-top: 20px;
          font-size: 16px;
          max-width: 50%;
          margin-left: 140px;
        }

        .fail-message {
          background-color: #e85d51;
          color: white;
          padding: 10px;
          text-align: center;
          border-radius: 5px;
          margin-top: 20px;
          font-size: 16px;
          max-width: 50%;
          margin-left: 140px;
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

      <div class="login-container">
        <div class="image-section">
          <img src="assets\images\background-dangnhap\bg1.png" alt="" />
        </div>
        <div class="login-form">
          <h3 class="title">Đăng nhập tài khoản</h3>
          <h4>Hãy đăng nhập ngay để được hưởng đặc quyền riêng dành cho bạn</h4>
          <form id="login-form" action="login" method="post">
            <div class="taikhoan">
              <label class="form-label">Tên tài khoản</label>
              <input
                type="text"
                class="form-control"
                id="username-input"
                name="username"
                placeholder="Nhập tên tài khoản"
                value="${sessionScope.username != null ? sessionScope.username : ''}" required
              />
            </div>

            <div class="matkhau">
              <label class="form-label">Mật khẩu</label>
              <input
                type="password"
                class="form-control"
                id="matkhau-input"
                name="password"
                placeholder="Nhập mật khẩu"

              />
            </div>

            <div class="remember-container">
              <input type="checkbox" id="remember" class="form-check-input" />
              <label for="remember" class="form-check-label"
                >Lưu tên tài khoản</label
              >
              <a href="quen_mat_khau.jsp">Quên mật khẩu</a>
            </div>

            <button type="submit" class="btn btn-login">Đăng nhập</button>

            <div class="text-center">
              <span
                >Bạn chưa có tài khoản?
                <a href="dang_ki.jsp">Đăng kí ngay</a></span
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
  </head>
</html>
