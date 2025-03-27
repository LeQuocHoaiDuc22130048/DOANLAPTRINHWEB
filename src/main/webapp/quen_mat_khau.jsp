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
      href="assets/images/logo.png"
      type="image/x-icon"
    />
<c:import url="link.jsp"/>
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
