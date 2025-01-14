<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <h1>Chi tiết đơn hàng</h1>
                </div>
                <div class="admin-content-main-content">
                    <div class="admin-content-main-content-order-list">
                        <table>
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Ảnh</th>
                                <th>Mã sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                                <th>Tùy biến</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="total" value="0"/>
                            <c:forEach var="od" items="${orderDetail}">
                                <tr>
                                    <td>${od.productId}</td>
                                    <td><img width="70px" src="../${od.productImage}" alt=""></td>
                                    <td>${od.productCode}</td>
                                    <td><f:formatNumber value="${od.sellingPrice}"/>đ</td>
                                    <td>${od.quantityInOrder}</td>
                                    <td><c:set var="itemTotalPrice" value="${od.totalPrice}"/>
                                        <f:formatNumber value="${itemTotalPrice}"/>đ
                                        <c:set var="total" value="${total + itemTotalPrice}"/></td>
                                    <td>
                                        <a class="delete-class" href="">Xóa</a>
                                    </td>
                                </tr>

                            </c:forEach>


                            <tr>
                                <td style="font-weight: bold;" colspan="6">Tổng cộng</td>
                                <td style="font-weight: 700;"> <f:formatNumber value="${total}"/>đ </td>
                            </tr>
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

</script>
</html>