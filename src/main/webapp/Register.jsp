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
                <form action="${context}/sign-in" method="post" class="w-75">
                    <!-- Email input -->
                    <div data-mdb-input-init class="form-outline mb-4 w-100">
                        <label class="form-label" for="userName">Tên đăng nhập</label>
                        <input required type="text" id="userName" class="form-control" name="username"/>
                    </div>
                    <div data-mdb-input-init class="form-outline mb-4 w-100">
                        <label class="form-label" for="email">Email</label>
                        <input required type="email" id="email" class="form-control" name="email"/>
                    </div>
                    <!-- Password input -->
                    <div data-mdb-input-init class="form-outline mb-4 w-100">
                        <label class="form-label" for="password">Mật khẩu </label>
                        <input required type="password" id="password" class="form-control" name="password"/>
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
</body>
</html>
