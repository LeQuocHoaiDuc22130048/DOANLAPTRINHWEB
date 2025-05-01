<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Lịch sử mua hàng</title>
    <c:import url="../Link.jsp"/>
</head>

<body>
<%--<!-- ***** Preloader Start ***** -->--%>
<div id="preloader">
    <div class="jumper">
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>
<%--<!-- ***** Preloader End ***** -->--%>

<!-- ***** Header Area Start ***** -->
<jsp:include page="../Header.jsp"/>
<!-- ***** Header Area End ***** -->

<div class="main-content">
    <div id="orderListDiv">
        <h2>Lịch sử mua hàng</h2>

        <c:if test="${empty requestScope.orderList}">
            <p>Bạn chưa có đơn hàng nào.</p>
        </c:if>

        <table class="order-table">
            <thead>
            <tr>
                <th>Mã đơn hàng</th>
                <th>Ngày đặt</th>
                <th>Giá trị đơn</th>
                <th>Trạng thái</th>
                <th>Chi tiết</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${requestScope.orderList}">
                <tr>
                    <td>${order.order_code}</td>
                    <td>${order.created_at}</td>
                    <td><f:formatNumber value="${order.total_price}"/> đ</td>
                    <td>
                        <c:choose>
                            <c:when test="${order.status_order}">
                                <span class="order-status-confirmed">Đã xác nhận</span>
                            </c:when>
                            <c:otherwise>
                                <span class="order-status-pending">Chờ xác nhận</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a class="view-link" href="${context}/user/orderDetail?code=${order.order_code}">Xem chi tiết</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div id="orderDetailDiv" style="display: none;">
        <button class="back-button" onclick="goBackToList()">Quay lại</button>
        <h2>Chi tiết đơn hàng</h2>
        <div id="detailLoader" style="display: none;">Đang tải...</div>

        <table class="order-table">
            <thead>
            <tr>
                <th>STT</th>
                <th>Sản phẩm</th>
                <th>Đơn giá</th>
                <th>Số lượng</th>
                <th>Tổng tiền</th>
            </tr>
            </thead>
            <tbody id="orderDetailBody">
            </tbody>
        </table>

    </div>

</div>

<!-- ***** Footer Start ***** -->
<jsp:include page="../Footer.jsp"/>
<!-- ***** Footer End ***** -->

<c:import url="../Script.jsp"/>
<script src="../assets/js/ViewDetailHistoryOrder.js"></script>
</body>
</html>

