<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set value="${pageContext.request.contextPath}" var="context"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <c:import url="Link.jsp"/>
    <title>Sign in</title>
</head>
<body>
<c:import url="Header.jsp"/>
<div class="container-fluid mt-100">
    <div class="row" style="height: 550px">
        <div class="col-6">
            <img class="img-fluid w-100 h-75 object-fit-cover border-0 rounded"
                 src="${context}/assets/images/background-dangnhap/bg4.png" alt=""/>
        </div>
        <div class="col-6 ">
            <div class="flex-column absolute_center">
                <h3 class="text-center mb-3 mt-5 ">Đăng nhập</h3>
                <form action="${context}/sign-in" method="post" class="w-75" id="registerForm">
                    <!-- Email input -->
                    <div data-mdb-input-init class="form-outline mb-4 w-100">
                        <label class="form-label" for="userName">Tên đăng nhập</label>
                        <input required type="text" id="userName" class="form-control" name="username" placeholder="Tên đăng nhập của bạn"/>
                    </div>
                    <div data-mdb-input-init class="form-outline mb-4 w-100">
                        <label class="form-label" for="emailInput">Email</label>
                        <input required type="email" id="emailInput" class="form-control" name="email" placeholder="Email của bạn"/>
                        <span class="text-danger" id="email-error"></span>
                    </div>
                    <!-- Password input -->
                    <div data-mdb-input-init class="form-outline mb-4 w-100">
                        <label class="form-label" for="password">Mật khẩu </label>
                        <input required type="password" id="password" class="form-control" name="password"
                        placeholder="Mật khẩu của bạn"/>
                    </div>
                    <!-- Submit button -->
                    <button data-mdb-ripple-init type="submit" class="btn btn-primary btn-block m-auto w-100">Sign up
                    </button>
                </form>
                <p class="mt-3 fs-6">Bạn đã có tài khoản <a href="Login.jsp">Đăng nhập ngay !</a></p>
                <p class="text-danger"> ${requestScope.Error}</p>

            </div>
        </div>
    </div>
</div>
<!-- ***** Footer Start ***** -->
<c:import url="Footer.jsp"/>
<script src="<c:url value='/assets/js/search.js' />"></script>
<script src="<c:url value='/assets/js/best_seller.js' />"></script>
<script src="<c:url value='/assets/js/chat_box.js' />"></script>
<script src="<c:url value='/assets/js/chatbox.js' />"></script>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    $(document).ready(function () {
        let isEmailValid = false;

        $('#emailInput').on('blur', function () {
            const email = $(this).val();

            $.ajax({
                url: '/DoAnWeb/CheckEmail',
                method: 'GET',
                data: { email: email },
                dataType: 'json', // Quan trọng!
                success: function(response) {
                    if (!response.isSuccess) {
                        $('#email-error').text("");
                        isEmailValid= response.isSuccess;
                        console.log(isEmailValid);
                    } else {
                        $('#email-error').text("Email đã tồn tại"); // Email hợp lệ
                    }
                },
                error: function() {
                    $('#email-error').text("Lỗi kiểm tra email.");
                }
            });
        });
    });

</script>
</body>
</html>
