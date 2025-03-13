<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <c:import url="link.jsp"/>
    <style>
        /* Phần chứa hình ảnh */
        .image-section {
            flex: 1;
            max-width: 37%;
        }
        .sign-in-form {
            flex: 1;
            max-width: 600px;
            padding-top: 150px;
        }
        .sign-in-form h4 {
            color: #666;
            font-size: 15px;
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

        /* Hiệu ứng xuất hiện mượt */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

    </style>
  <title>Sign in</title>
</head>
<body>
<c:import url="header.jsp"/>
<div class="sign-in-container absolute_center mx-auto my-0">
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
                        class="form-control mb-2"
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
                        class="form-control mb-2"
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
                        class="form-control mb-2"
                        id="matkhau-input"
                        name="password"
                        placeholder="Nhập mật khẩu"
                        required
                />

            </div>
            <button type="submit" class="btn btn-sign-in w-100 mb-3">Đăng ký</button>
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
