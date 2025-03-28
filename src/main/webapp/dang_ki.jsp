<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set value="${pageContext.request.contextPath}" var="context"/>
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
<div class="sign-in-container container d-flex align-items-center justify-content-between mx-auto">
    <div class="image-section mt-4">
        <img class="img-fluid border-0" src="./assets/images/background-dangnhap/bg4.png" alt=""/>
    </div>
    <div class="sign-in-form">
        <h3 class="text-center font-weight-bolder mb-2 fa-2x">Đăng kí tài khoản</h3>
        <h4 class="text-center mb-1">Hãy đăng kí ngay để được hưởng đặc quyền riêng dành cho bạn</h4>
        <form id="register-form ab" class="" action="${context}/sign-in" method="post">
            <div class="mb-3 w-75">
                <label for="exampleInputUserName" class="form-label">User name</label>
                <input type="password" class="form-control" id="exampleInputUserName">
            </div>
            <div class="mb-3  w-75">
                <label for="exampleInputEmail1" class="form-label">Email address</label>
                <input type="email" name="email"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            </div>
            <div class="mb-3  w-75">
                <label for="exampleInputPassword1" class="form-label">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1">
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div>
<!-- ***** Footer Start ***** -->
<c:import url="footer.jsp"/>
</body>
</html>
