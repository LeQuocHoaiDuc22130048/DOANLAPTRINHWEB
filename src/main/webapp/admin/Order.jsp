<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <c:import url="/admin/DashboardLink.jsp"/>
    <c:set var="titleName" value="Danh sách đơn hàng" scope="request"/>
    <title>${titleName}</title>
</head>
<body>
<div class="side-menu">
    <div class="brand-name">
        <img src="asset/image/logo.png" alt="eyestyle" width="100px"/>
    </div>
    <ul style="padding: 0">
        <li><a href="Dashboard" ><i class="fa-solid fa-house"></i>Trang chủ</a></li>
        <li><a href="Order" class="active"><i class="fa-solid fa-scroll"></i>Đơn hàng</a></li>
        <li><a href="ProductList"><i class="fa-solid fa-weight-hanging"></i>Sản phẩm</a></li>
        <li><a href="Category"><i class="fa-solid fa-clipboard-list"></i>Danh mục sản phẩm</a></li>
        <li><a href="Promotion"><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
        <li><a href="User"><i class="fa-solid fa-user"></i>Người dùng</a></li>
        <li><a href="Feedback"><i class="fa-solid fa-comment"></i>Phản hồi</a></li>
        <li><a href="Newsletter-subscriber"><i class="fa-solid fa-bell"></i>Đăng ký nhận tin</a></li>
        <li><a href="Banner-carousel"><i class="fa-solid fa-image"></i>Banner</a></li>
        <li><a href="InventoryList"><i class="fa-solid fa-boxes-stacked"></i>Kho hàng</a></li>
        <li><a href="PostList"><i class="fa-solid fa-pen-to-square"></i>Bài viết</a></li>
    </ul>
</div>

<div class="container">
    <jsp:include page="Header.jsp"/>
    <div class="content">

        <div class="data-table">
            <table id="table_id" class="ui celled table" style="width: 100%">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên khách hàng</th>
                    <th>Số điện thoại</th>
                    <th>Email</th>
                    <th>Địa chỉ giao hàng</th>
                    <th>Trạng thái thanh toán</th>
                    <th>Trạng thái giao hàng</th>
                    <th>Ngày tạo đơn</th>
                    <th>Tùy chỉnh</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="od" items="${orders}">
                    <tr>
                        <td>${od.orderId}</td>
                        <td>${od.buyerName}</td>
                        <td>${od.buyerPhone}</td>
                        <td>${od.buyerEmail}</td>
                        <td>${od.buyerAddress}</td>
                        <td>
                            <c:if test="${od.paymentStatus == 1}">
                                <button class="btn btn-success">Đã thanh toán</button>
                            </c:if>
                            <c:if test="${od.paymentStatus == 0}">
                                <button class="btn btn-warning">Chưa thanh toán</button>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${od.orderStatus == 1}">
                                <button class="btn btn-success">Đã giao hàng</button>
                            </c:if>
                            <c:if test="${od.orderStatus == 0}">
                                <button class="btn btn-warning">Chưa giao</button>
                            </c:if>
                        </td>
                        <td>
                        <c:set var = "odTime" value="${fn:replace(od.orderTime,'T' ,' ' )}"/>
                            ${odTime}
                        </td>
                        <td>

                                    <button
                                            class="btn btn-primary btn-sm view-details-btn"
                                            type="button" data-bs-toggle="modal"
                                            data-bs-target="#orderDetail"
                                            onclick="loadOrderDetail(${od.orderId})"
                                    >
                                        <i class="fa-solid fa-eye"></i>
                                    </button>

                                <a href="">
                                    <button class="btn btn-warning btn-sm">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- Chi tiết đơn hàng -->
<div class="modal fade" id="orderDetail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content" style="height: 80vh">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Chi tiết đơn hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center " id="orderDetailContent">
                <%--render by Ajax--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<c:import url="/admin/DashboardScript.jsp"/>

<script>
    function loadOrderDetail(orderId) {
        const content = document.getElementById('orderDetailContent');
        content.innerHTML = '<div class="text-center"><span class="spinner-border text-primary"></span></div>';

        fetch('OrderDetail?orderId=' + orderId)
            .then(res => res.text())
            .then(html =>{
            content.innerHTML = html;
            })
            .catch(err => {
                content.innerHTML = '<div class="text-danger">Không thể tải chi tiết đơn hàng.</div>';
            })
    }
</script>

</body>
</html>
