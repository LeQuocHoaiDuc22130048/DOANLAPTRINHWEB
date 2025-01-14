<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
            rel="stylesheet"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet"
          type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <script type="text/javascript"
            charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js">
    </script>

    <link rel="stylesheet" href="https://cdn.datatables.net/2.2.1/css/dataTables.semanticui.css">
    <link rel="stylesheet" href="asset/css/style.css">
    <style>
        div#productTable_filter {
            position: absolute;
            top: -40px;
            right: 0;
        }

        div#productTable_filter label input {
            padding: 10px;
            width: 40vh;
            border: none;
            outline: #2e404f;
        }
    </style>
    <title>Trang quản lý</title>
</head>
<body>
<section class="admin">
    <div class="row-grid">
        <jsp:include page="Sidebar.jsp"/>
        <div class="admin-content">
            <jsp:include page="SidebarTop.jsp"/>
            <div class="admin-content main">
                <div class="admin-content-main-title">
                    <h1>Danh sách đơn hàng</h1>
                </div>
                <div class="admin-content-main-content">
                    <div class="admin-content-main-content-order-list">
                        <table id="productTable">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên</th>
                                <th>SĐT</th>
                                <th>Email</th>
                                <th>Địa chỉ</th>
                                <th>Chi tiết</th>
                                <th>Ngày</th>
                                <th>Giao hàng</th>
                                <th>Tùy biến</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td>${order.orderId}</td>
                                    <td>${order.buyerName}</td>
                                    <td>${order.buyerPhone}</td>
                                    <td>${order.buyerEmail}</td>
                                    <td>${order.buyerAddress}</td>
                                    <td><a href="${pageContext.request.contextPath}/admin/OrderDetail?orderId=${order.orderId}" class="edit-class">Chi tiết</a></td>
                                    <td>${order.orderDate}</td>
                                    <td>

                                        <c:if test="${order.transportStatus > 0}"><a href="" class="confirm-order">Đã
                                            giao</a></c:if>
                                        <c:if test="${order.transportStatus <= 0}"><a href="" class="nonconfirm-order">Chưa
                                            giao</a></c:if>
                                    </td>

                                    <td>
                                        <a class="delete-class" href="">Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>

<script src="asset/js/app.js"></script>
</body>
<script>
    $(document).ready(function () {
        $('#productTable').DataTable({
            "language": {
                "sSearch": "Tìm kiếm sản phẩm",
                "sProcessing": "Đang xử lý",
                "oPaginate": {
                    "sFirst": "Đầu",
                    "sPrevious": "Trước",
                    "sNext": "Tiếp",
                    "sLast": "Cuối"
                }
            }
        });
    });
</script>
</html>