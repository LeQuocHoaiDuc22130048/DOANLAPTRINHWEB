<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quên mật khẩu</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link
            rel="shortcut icon"
            href="assets/images/Website/logo.png"
            type="image/x-icon"
    />
    <c:import url="Link.jsp"/>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center p-0">
    <form class="absolute_center flex-column" action="${pageContext.request.contextPath}/ResetPassword" method="post">
        <div class="mb-3">
            <h1 class="mb-4">Đổi mật khẩu </h1>
            <p class="text-center text-secondary-emphasis">Nhập vào mật khẩu mới để cập nhật mật khẩu </p>
        </div>
        <div class="input-group mb-3 w-75">
            <span class="input-group-text" id="basic-addon1">Mật khẩu mới </span>
            <input id="newPassword" type="password" name="newPassword" class="form-control"
                   placeholder="Enter your password" aria-label="Username" aria-describedby="basic-addon1">
        </div>
        <div class="input-group mb-3 w-75">
            <span class="input-group-text" id="button-addon2">Xác nhận mật khẩu </span>
            <input type="password" id="confilmPassword" name="otp" class="form-control"
                   placeholder="Enter your confirm password" aria-label="Recipient's username"
                   aria-describedby="button-addon2">
        </div>
        <div class="mt-4">
            <button type="submit" class="btn btn-primary">Lưu</button>
        </div>
    </form>
</div>
</body>
</html>
