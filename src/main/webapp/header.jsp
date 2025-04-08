<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set value="${pageContext.request.contextPath}" var="context"/>
<head>
    <meta charset="UTF-8">
    <title>Header</title>
</head>
<header class="header-area header-sticky fixed-top">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="index" class="logo">
                        <img alt="logo" src="assets/images/logo.png"/>
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li class="scroll-to-section">
                            <a href="index" class="active">Trang chủ</a>
                        </li>
                        <li class="scroll-to-section">
                            <a href="product-category?categoryId=3">Kính mát</a>
                        </li>
                        <li class="scroll-to-section">
                            <a href="product-category?categoryId=9">Gọng kính</a>
                        </li>
                        <li class="scroll-to-section">
                            <a href="product-category?categoryId=5">Tròng kính</a>
                        </li>
                        <li class="scroll-to-section">
                            <a href="product-category?categoryId=7">Kính áp tròng</a>
                        </li>
                        <li class="submenu">
                            <a href="javascript:">Trang phụ</a>
                            <ul>
                                <li><a href="product-category?categoryId=3">Sản phẩm</a></li>
                                <li>
                                    <!-- ***** Default when no product is selected ***** -->
                                    <a href="product-detail?id=1">Chi tiết sản phẩm</a>
                                </li>
                                <li class="scroll-to-section">
                                    <a href="${context}/allPost">Bài viết</a>
                                </li>
                                <li><a href="lien_he.jsp">Liên hệ</a></li>
                            </ul>
                        </li>
                        <li class="username">
                        <c:choose>
                            <c:when test="${sessionScope.user != null}">
                                <div class="dropdown">
                                    <img class="btn btn-secondary dropdown-toggle rounded-circle w-50" href="#" role="button" data-bs-toggle="dropdown"
                                         aria-expanded="false" alt="avatar" src="${context}/assets/images/logo.png"/>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Cập nhật hồ sơ </a></li>
                                        <li><a class="dropdown-item" href="#">Lịch sử mua hàng</a></li>
                                        <li><a class="dropdown-item" href="#">Sản phẩm đã thích </a></li>
                                        <li><a class="dropdown-item" href="#"> Đăng xuất </a></li>
                                    </ul>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <a href="dang_nhap.jsp" id="login_link"><i class="fa-solid fa-user-large"></i></a>
                            </c:otherwise>
                        </c:choose>
                        </li>
                        <li class="gio_hang_shop">
                            <a href="${context}/gio_hang">
                                <span>Giỏ hàng </span>
                                <i class="fa-solid fa-cart-shopping"></i>
                            </a>
                            <div class="count_div">
                                <span class="cart-count">
                                    ${sessionScope.cart != null ? sessionScope.cart.totalQuantity : 0}
                                </span>
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
