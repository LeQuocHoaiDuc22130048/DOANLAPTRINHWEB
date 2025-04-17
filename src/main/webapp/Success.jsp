<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt hàng thành công</title>
    <c:import url="link.jsp"/>
    <link rel="stylesheet" href="assets/css/success.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="wrapper">
    <div class="success-container">
        <div class="success-message">
            <h2>✅ Bạn đã đặt hàng thành công</h2>
            <p>Cảm ơn bạn đã lựa chọn dịch vụ của <strong>EyeStyle</strong></p>
        </div>

        <div class="order-details">
            <p><strong>Mã đơn hàng:</strong>
                <c:choose>
                    <%-- Dành cho paypal--%>
                    <c:when test="${not empty param.token}">
                        #${param.token}
                    </c:when>
                    <%-- Dành cho COD/Ngân hàng--%>
                    <c:otherwise>
                        #${sessionScope.orderCode}
                    </c:otherwise>
                </c:choose>
            </p>

            <p><strong>Người nhận:</strong> ${sessionScope.customer.name}</p>
            <p><strong>Số điện thoại:</strong> ${sessionScope.customer.phone}</p>
            <p><strong>Email:</strong> ${sessionScope.customer.email}</p>
            <p><strong>Địa chỉ:</strong> ${sessionScope.customer.address}</p>
            <p><strong>Tổng tiền:</strong> ${sessionScope.orderTotal}</p>
        </div>

        <div class="product-list">
            <h5>SẢN PHẨM ĐẶT MUA</h5>
            <c:forEach var="product" items="${sessionScope.cart.list}">
                <div class="product-item">
                    <img src="${product.path_img}" alt="${product.name}" width="80">
                    <p>${product.name}</p>
                    <p><strong>Số lượng:</strong> ${product.quantity}</p>
                </div>
            </c:forEach>
        </div>
        <div class="actions">
            <a href="index" class="btn btn-primary">Quay lại trang chủ</a>
            <p>Để theo dõi đơn hàng của bạn, vui lòng <a href="dang_ki.jsp">đăng ký</a> tài khoản.</p>
        </div>
    </div>
</div>

<c:import url="script.jsp"/>

<c:choose>
    <c:when test="${not empty param.token}">
        <script src="assets/js/paypal_success.js"></script>
    </c:when>
    <c:otherwise>
        <script src="assets/js/cod_success.js"></script>
    </c:otherwise>
</c:choose>

</body>
</html>
