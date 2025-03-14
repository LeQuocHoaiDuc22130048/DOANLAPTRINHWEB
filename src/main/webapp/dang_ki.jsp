<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="assets/css/register.css"/>
    <c:import url="link.jsp"/>
  <title>Sign in</title>
</head>
<body>
<c:import url="header.jsp"/>
<div class="sign-in-container container absolute_center mx-auto">
    <div class="image-section mt-4">
        <img class="img-thumbnail border-0" src="./assets/images/background-dangnhap/bg4.png" alt=""/>
    </div>
    <div class="sign-in-form pl-5">
        <h3 class="text-center font-weight-bolder mb-2 fa-2x">Đăng kí tài khoản</h3>
        <h4 class="text-center mb-1">Hãy đăng kí ngay để được hưởng đặc quyền riêng dành cho bạn</h4>
        <form id="register-form" action="${pageContext.request.contextPath}/sign-in" method="post">
            <div class="taikhoan">
              <label for="username-input" class="form-label">UserName</label>
             <input
                        type="text"
                        class="rounded form-control mb-2"
                        id="username-input"
                        name="userName"
                        placeholder="Nhập tên tài khoản"
                        required
                />
            </div>

            <div class="email">
                <label for="email-input" class="form-label">Email</label>
                <input
                        type="text"
                        class=" rounded form-control mb-2"
                        id="email-input"
                        name="email"
                        placeholder="Nhập email"
                        required
                />
            </div>

            <div class="matkhau">
                <label for="matkhau-input" class="form-label">Mật khẩu</label>
                <input
                        type="password"
                        class="form-control rounded mb-2"
                        id="matkhau-input"
                        name="password"
                        placeholder="Nhập mật khẩu"
                        required
                />

            </div>
          <div class="absolute_center">  <button type="submit" class="btn btn-sign-in text-light bg-primary w-50 mb-3">Đăng ký</button></div>
            <!-- Nút Đăng ký với Facebook và Google -->
            <div class="d-flex justify-content-center align-items-center mb-3">
              <p class="mr-4">Hoặc đăng ký với</p>
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
            <span>Bạn đã có tài khoản?<a href="dang_nhap.jsp">Đăng nhập ngay</a></span>
            </div>
        </form>
    </div>
</div>
<!-- ***** Footer Start ***** -->
<c:import url="footer.jsp"/>
</body>
</html>
