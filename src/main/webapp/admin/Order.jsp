<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <jsp:include page="DashboardLink.jsp"/>
    <c:set var="titleName" value="Đơn hàng" scope="request"/>
    <title>${titleName}</title>
</head>
<body>
<div class="side-menu">
    <div class="brand-name">
        <img src="asset/image/logo.png" alt="eyestyle" width="100px"/>
    </div>
    <ul style="padding: 0">
        <li><a href="Dashboard"><i class="fa-solid fa-house"></i>Trang chủ</a></li>
        <li><a href="Order" class="active"><i class="fa-solid fa-scroll"></i>Đơn hàng</a></li>
        <li><a href="AdminProductList"><i class="fa-solid fa-weight-hanging"></i>Sản phẩm</a></li>
        <li><a href="ProductCategory"><i class="fa-solid fa-clipboard-list"></i>Danh mục sản phẩm</a></li>
        <li><a href="Promotion"><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
        <li><a href="User"><i class="fa-solid fa-user"></i>Người dùng</a></li>
        <li><a href="Feedback"><i class="fa-solid fa-comment"></i>Phản hồi</a></li>

    </ul>
</div>

<div class="container">
    <jsp:include page="Header.jsp"/>
    <div class="content" style="min-height: 150vh; margin-top: 0;">
        <div class="data-table position-absolute" style="width: 124%; transform: scale(0.8);right: -164px;)">
            <table id="table_id" class="ui celled table" style="width: 100%">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã khách hàng</th>
                    <th>Tên khách hàng</th>
                    <th>Số điện thoại</th>
                    <th>Email</th>
                    <th>Địa chỉ nhận hàng</th>
                    <th>Tổng giá</th>
                    <th>Trạng thái thanh toán</th>
                    <th>Trạng thái đơn hàng</th>
                    <th>Ngày tạo đơn</th>
                    <th>Tùy chỉnh</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orders}">
                <tr>
                        <td>${order.id}</td>
                        <td>${order.userId}</td>
                        <td>${order.customerName}</td>
                        <td>${order.phoneNumber}</td>
                        <td>${order.email}</td>
                        <td>${order.shippingAddress}</td>
                        <td><f:formatNumber value="${order.totalPrice}" type="currency" currencyCode="VND"/></td>
                        <td>
                            <c:if test="${order.paymentStatus == 1}">
                                <label>Đã thanh toán</label>
                            </c:if>
                            <c:if test="${order.paymentStatus != 1}">
                                <label>Chưa thanh toán</label>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${order.orderStatus == 1}">
                                <label>Đã giao</label>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${fn:contains(order.orderDate, 'T')}">
                                <c:set var="formattedDate" value="${fn:replace(order.orderDate, 'T', ' ')}"/>
                            </c:if>

                            ${formattedDate}
                        </td>
                        <td>
                                <a href="OrderDetail?orderId=${order.id}" class="btn btn-primary btn-sm"><i class="fa-solid fa-eye"></i></a>
                            <button class="btn btn-danger btn-sm"><i class="fa-solid fa-trash-alt"></i></button>
                        </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    $("#table_id").DataTable({
        language: {
            processing: "Message khi đang tải dữ liệu",
            search: "",
            searchPlaceholder: "Tìm kiếm",
            lengthMenu: "Số lượng đơn hàng trên 1 trang _MENU_ ",
            info: "",
            infoEmpty:
                "Khi không có dữ liệu, Hiển thị 0 đơn hàng trong 0 tổng cộng 0 ",
            infoFiltered:
                "(Message bổ sung cho info khi không search đc record nào _MAX_)",
            // infoPostFix: "Alo Alo",
            loadingRecords: "",
            zeroRecords: "Khi tìm kiếm không match với record nào",
            emptyTable: "Không có dữ liệu",
            paginate: {
                first: "Trang đầu",
                previous: "Trang trước",
                next: "Trang sau",
                last: "Trang cuối",
            },
            aria: {
                sortAscending: ": Message khi đang sắp xếp theo column",
                sortDescending: ": Message khi đang sắp xếp theo column",
            },
        },
    });
</script>

<jsp:include page="DashboardScript.jsp"/>
</body>
</html>
