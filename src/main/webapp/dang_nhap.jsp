<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set value="${pageContext.request.contextPath}" var="context"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>Trang đăng nhập</title>
    <c:import url="link.jsp"/>
</head>

<body>
<c:import url="header.jsp"/>
<!-- ***** Header Area End ***** -->

<div class="container-fluid mt-100">
    <div class="row">
        <div class="col-6">
            <img class="img-fluid border-0 rounded" src="${context}/assets/images/background-dangnhap/bg1.png" alt=""/>
        </div>
        <div class="col-6 ">
            <div class="flex-column absolute_center">
                <h3 class="text-center mb-3 mt-5 ">Đăng nhập</h3>
                <form action="${pageContext.request.contextPath}/login" class="w-75">
                    <!-- Email input -->
                    <div data-mdb-input-init class="form-outline mb-4 w-100">
                        <label class="form-label" for="form1Example1">Tên đăng nhập</label>
                        <input type="text" id="form1Example1" class="form-control" name="username"/>
                    </div>

                    <!-- Password input -->
                    <div data-mdb-input-init class="form-outline mb-4 w-100">
                        <label class="form-label" for="form1Example2">Mật khẩu </label>
                        <input type="password" id="form1Example2" class="form-control" name="password"/>
                    </div>

                    <!-- 2 column grid layout for inline styling -->
                    <div class="row mb-4">
                        <div class="col d-flex justify-content-center">
                            <!-- Checkbox -->
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="form1Example3" checked/>
                                <label class="form-check-label" for="form1Example3"> Remember me </label>
                            </div>
                        </div>

                        <div class="col">
                            <!-- Simple link -->
                            <a href="#!">Forgot password?</a>
                        </div>
                    </div>

                    <!-- Submit button -->
                    <button data-mdb-ripple-init type="submit" class="btn btn-primary btn-block m-auto w-100">Sign in
                    </button>
                </form>
                <p class="mt-3 fs-6">Bạn chưa có tài khoản <a href="dang_ki.jsp">Đăng ký ngay !</a></p>
            </div>
        </div>
    </div>
</div>


<!-- ***** Footer Start ***** -->
<c:import url="footer.jsp"/>
</body>
</html>
