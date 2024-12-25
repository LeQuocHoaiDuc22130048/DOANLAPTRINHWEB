

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
    <header class="header-area header-sticky">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <nav class="main-nav">
              <!-- ***** Logo Start ***** -->
              <a href="index.html" class="logo">
                <img src="assets/images/logo.png" />
              </a>
              <!-- ***** Logo End ***** -->
              <!-- ***** Menu Start ***** -->
              <ul class="nav">
                <li class="scroll-to-section">
                  <a href="./index.html#top" class="active">Trang chủ</a>
                </li>
                <li class="scroll-to-section">
                  <a href="./index.html#kinh_mat">Kính mát</a>
                </li>
                <li class="scroll-to-section">
                  <a href="./index.html#gong_kinh">Gọng kính</a>
                </li>
                <li class="scroll-to-section">
                  <a href="./index.html#trong_kinh">Tròng kính</a>
                </li>
                <li class="scroll-to-section">
                  <a href="./index.html#kinh_ap_trong">Kính áp tròng</a>
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
                    <li><a href="lien_he.html">Liên hệ</a></li>
                  </ul>
                </li>
                <li class="username"> 
                  <a href="dang_nhap.jsp" id="login_link"><i class="fa-solid fa-user-large"></i></a>
                  <div class=username_login id="username-info" style="display: none;"><span id="username"></span></div>
                </li>
                <li class="gio_hang_shop">
                  <a href="./gio_hang.html">
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

    <div class="sign-in-container">
      <div class="image-section">
        <img src="assets\images\background-dangnhap\bg4.png" alt="" />
      </div>
      <div class="sign-in-form">
        <h3 class="title">Đăng kí tài khoản</h3>
        <h4>Hãy đăng kí ngay để được hưởng đặc quyền riêng dành cho bạn</h4>
        <form id="register-form" action="sign-in" method="post">
          <div class="taikhoan">
            <label for="username" class="form-label">Tên tài khoản</label>
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
            <label for="email" class="form-label">Email</label>
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
            <label for="password" class="form-label">Mật khẩu</label>
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
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-3 inf_first">
            <div class="first-item">
              <div class="logo">
                <img src="./assets/images/logo.png" alt="eyestyle nhom 65" />
              </div>
              <ul>
                <li>
                  <a href="#">Đại học Nông Lâm TPHCM</a>
                </li>
                <li><a href="#">nhom65@company.com</a></li>
                <li><a href="#">0123 456 789</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-3 inf">
            <h4>Mua sắm &amp; Danh mục</h4>
            <ul>
              <li><a href="./chi_tiet_san_pham.html">Kính mát</a></li>
              <li><a href="./chi_tiet_san_pham.html">Gọng kính</a></li>
              <li><a href="./chi_tiet_san_pham.html">Tròng kính</a></li>
              <li><a href="./chi_tiet_san_pham.html">Kính áp tròng</a></li>
            </ul>
          </div>
          <div class="col-lg-3 inf">
            <h4>Trợ giúp &amp; Thông tin</h4>
            <ul>
              <li><a href="#">Sản phẩm cập nhật</a></li>
              <li><a href="./bai_viet.html">Đời sống</a></li>
              <li><a href="./gio_hang.html">Vận chuyển</a></li>
              <li><a href="./lien_he.html">Liên hệ hỗ trợ</a></li>
            </ul>
          </div>
          <div class="col-lg-3 inf">
            <h4>Điều hướng</h4>
            <ul>
              <li><a href="#">Trang chủ</a></li>
              <li><a href="./san_pham.html">Sản phẩm</a></li>
              <li><a href="./lien_he.html">Liên hệ</a></li>
              <li><a href="./bai_viet.html">Bài viết</a></li>
            </ul>
          </div>
          <div class="col-lg-12">
            <div class="under-footer">
              <p>
                Group65 © 2022 HexaShop Co., Ltd. All Rights Reserved.

                <br />Design:
                <a href="#">Group 65</a>
              </p>
              <ul>
                <li>
                  <a href="#"><i class="fa fa-facebook"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-twitter"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-linkedin"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-behance"></i></a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>


  </body>
</html>
