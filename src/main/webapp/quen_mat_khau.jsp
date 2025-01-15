<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Quên mật khẩu</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link
      rel="shortcut icon"
      href="assets/images/logo.png"
      type="image/x-icon"
    />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css" />

    <style>
      .forgot-password-container {
        display: flex;
        align-items: center;
        justify-content: space-between;
        max-width: 1700px;
        margin: 0 auto;
        padding-top: 50px;
      }
      .img-section {
        flex: 1;
        max-width: 40%;
        padding-left: 100px;
      }
      .img-section img {
        width: 100%;
        height: auto;
      }
      .forgot-form {
        flex: 1;
        padding-left: 100px;
        padding-top: 20px;
      }
      .forgot-form form {
        display: flex;
        flex-direction: column;
      }

      .btn-submit {
        background-color: #007bff;
        color: #0f0e0e;
        font-weight: bold;
        padding: 10px 20px;
        max-width: 70%;
        border: none;
        cursor: pointer;
        margin-bottom: 20px;
        border-radius: 5px;
      }
      .btn-submit:hover {
        background-color: #5bc3f4;
      }

      .title {
        padding-left: 150px;
        margin-bottom: 30px;
        font-size: 27px;
        font-weight: bold;
      }

      .form-label {
        margin-bottom: 10px;
        font-weight: bold;
      }
      .text-center a {
        font-size: 17px;
        display: flex;
      }

      .text-center a:hover {
        text-decoration: none;
      }

      .error-message {
        background-color: rgb(247, 168, 151);
        color: #070707;
        max-width: 70%;
        height: 40px;
        padding: 5px;
        border-radius: 5px;
        display: none;
      }

      .password-message {
        background-color: #e8c141;
        color: #090909;
        border: 1px solid #ffeeba;
        max-width: 70%;
        height: 40px;
        padding: 5px;
        margin-top: 20;
        border-radius: 5px;
        display: none;
      }

      .error-message,
      .password-message {
        animation: fade-in 0.5s ease-in-out;
        transition: opacity 0.5s ease-in-out;
      }

      #username-input,
      #email-input {
        max-width: 70%;
        margin-bottom: 30px;
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
        margin-left: 100px;
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
        margin-left: 100px;
      }
    </style>
  </head>
  <body>
    <div class="forgot-password-container">
      <div class="img-section">
        <img src="assets/images/background-dangnhap/quen_mk.png" alt="" />
      </div>
      <div class="forgot-form">
        <form id="forgot-password-form" action="forget" method="post">
          <h3 class="title">Quên mật khẩu</h3>
          <div class="username">
            <label for="username-input" class="form-label"
              >Nhập tên tài khoản</label
            >
            <input
              type="text"
              class="form-control"
              id="username-input"
              name="username"
              placeholder="Nhập tên tài khoản của bạn"
              required
            />
          </div>
          <div class="email">
            <label for="email-input" class="form-label"
              >Nhập email của bạn</label
            >
            <input
              type="email"
              class="form-control"
              id="email-input"
              name="email"
              placeholder="Nhập email của bạn"
              required
            />
          </div>

          <button type="submit" class="btn btn-submit">Lấy lại mật khẩu</button>

          <div id="password-message" class="password-message">
            <p>Mật khẩu của bạn là: <span id="user-password"></span></p>
          </div>

          <div id="error-message" class="error-message">

          </div>

          <div class="text-center">
            <span><a href="dang_nhap.html">Trở lại trang đăng nhập</a></span>
          </div>
          <!-- Thông báo đăng kí thất bại -->
          <div id="login-fail-message" class="fail-message" style="${empty requestScope['fail-message'] ? 'display: none;' : 'display: block;'}">
            <p>${requestScope['fail-message']}</p>
          </div>

          <!-- Thông báo đăng kí thành công -->
          <div id="login-success-message" class="success-message" style="${empty requestScope['success-message'] ? 'display: none;' : 'display: block;'}">
            <p>${requestScope['success-message']}</p>
          </div>

        </form>
      </div>
    </div>


  </body>
</html>
