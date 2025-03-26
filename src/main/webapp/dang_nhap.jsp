<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Trang đăng nhập</title>
<c:import url="link.jsp"/>
    </head>

    <body>
      <!-- ***** Header Area Start ***** -->
      <header class="header-area header-sticky">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <nav class="main-nav">
                <!-- ***** Logo Start ***** -->
                <a href="index.jsp" class="logo">
                  <img src="assets/images/logo.png" />
                </a>
                <!-- ***** Logo End ***** -->
                <!-- ***** Menu Start ***** -->
                <ul class="nav">
                  <li class="scroll-to-section">
                    <a href="index.jsp#top" class="active">Trang chủ</a>
                  </li>
                  <li class="scroll-to-section">
                    <a href="index.jsp#kinh_mat">Kính mát</a>
                  </li>
                  <li class="scroll-to-section">
                    <a href="index.jsp#gong_kinh">Gọng kính</a>
                  </li>
                  <li class="scroll-to-section">
                    <a href="index.jsp#trong_kinh">Tròng kính</a>
                  </li>
                  <li class="scroll-to-section">
                    <a href="index.jsp#kinh_ap_trong">Kính áp tròng</a>
                  </li>
                  <li class="submenu">
                    <a href="javascript:;">Trang phụ</a>
                    <ul>
                      <li><a href="san_pham.html">Sản phẩm</a></li>
                      <li>
                        <a href="chi_tiet_san_pham.html">Chi tiết sản phẩm</a>
                      </li>
                      <li class="scroll-to-section">
                        <a href="bai_viet.html">Bài viết</a>
                      </li>
                      <li><a href="lien_he.jsp">Liên hệ</a></li>
                    </ul>
                  </li>
                  <li class="username"> 
                    <a href="dang_nhap.jsp" id="login_link"><i class="fa-solid fa-user-large"></i></a>
                    <div class=username_login id="username-info" style="display: none;"><span id="username"></span></div>
                  </li>
                  <li class="gio_hang_shop">
                    <a href="gio_hang.jsp">
                      <span>Giỏ hàng </span>
                      <i class="fa-solid fa-cart-shopping"></i>
                    </a>
                    <div class="count_div">
                      <span class="cart-count">0</span>
                    </div>
                  </li>
                </ul>
                <a class="menu-trigger">
                  <span>Menu</span>
                </a>
                <!-- ***** Menu End ***** -->
              </nav>
            </div>
          </div>
        </div>
      </header>
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
              <label for="username" class="form-label">Tên tài khoản</label>
              <input
                type="text"
                class="form-control"
                id="username-input"
                name="username"
                placeholder="Nhập tên tài khoản"
                required
              />
            </div>

            <div class="matkhau">
              <label for="password" class="form-label">Mật khẩu</label>
              <input
                type="password"
                class="form-control"
                id="matkhau-input"
                name="password"
                placeholder="Nhập mật khẩu"
                required
              />
            </div>

            <div class="remember-container">
              <input type="checkbox" id="remember" class="form-check-input" />
              <label for="remember" class="form-check-label"
                >Lưu tên tài khoản</label
              >
              <a href="quen_mat_khau.html">Quên mật khẩu</a>
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
            <c:set var="Error" value="${requestScope.Error}" />
            <p class="text-center text-danger">${Error}</p>
          </form>
            <p>Đăng nhập thành công!</p>
          </div>
        </div>

      <!-- ***** Footer Start ***** -->
    <c:import url="footer.jsp"/>
    </body>
</html>
