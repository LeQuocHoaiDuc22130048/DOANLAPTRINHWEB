<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 1/10/2025
  Time: 6:56 PM
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Trang quản lý</title>

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
</head>
<body>
<section class="admin">
    <div class="row-grid">
        <jsp:include page="Sidebar.jsp"/>
        <div class="admin-content">
            <jsp:include page="SidebarTop.jsp"/>
            <div class="admin-content main">
                <div class="admin-content-main-title">
                    <h1>Danh sách sản phẩm</h1>
                </div>
                <div class="admin-content-main-content">
                    <div class="admin-content-main-content-product-list">
                        <table id="productTable">
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th>Mã sản phẩm</th>
                                <th>Ảnh</th>
                                <th>Giá bán</th>
                                <th>Số lượng trong kho</th>
                                <th>Trạng thái</th>
                                <th>Tùy chỉnh</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="product" items="${products}">
                                <tr >
                                    <td>${product.id}</td>
                                    <td>${product.productName}</td>
                                    <td><img width="70px" src="../${product.img}" alt=""></td>
                                    <td><f:formatNumber value="${product.price}"/>đ</td>
                                    <td>${product.quantity}</td>
                                    <td>
                                        <c:if test="${product.quantity > 0}">Còn hàng</c:if>
                                        <c:if test="${product.quantity <= 0}">Hết hàng</c:if>
                                    </td>
                                    <td>
                                        <a class="edit-class" href="${pageContext.request.contextPath}/admin/UpdateProduct?id=${product.id}">Sửa</a>
                                        |
                                        <form method="post"
                                              action="${pageContext.request.contextPath}/admin/DeleteProduct"
                                              style="display:inline;">
                                            <input type="hidden" name="id" value="${product.id}">
                                            <button type="submit" class="delete-class"
                                                    onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này không?')">
                                                Xóa
                                            </button>
                                        </form>
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
