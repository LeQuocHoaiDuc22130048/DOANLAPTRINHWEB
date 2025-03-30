<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 1/15/2025
  Time: 4:58 AM
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
            <jsp:include page="Header.jsp"/>
            <div class="admin-content-main">
                <div class="admin-content-main-title">
                    <h1>Quản lý danh mục</h1>
                </div>
                <div class="admin-content-main-content" style="max-height: 375px">
                    <div class="admin-content-main-content-manager-list">
                        <table id="productTable">
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th>Tên</th>
                                <th>Số sản phẩm</th>
                                <th>Trạng thái</th>
                                <th>Tùy chỉnh</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="category" items="${categories}">
                                <tr>
                                    <td>${category.id}</td>
                                    <td>${category.name}</td>
                                    <td>${category.productCount}</td>
                                    <td>
                                        <c:if test="${category.status == 1}">Hiện</c:if>
                                        <c:if test="${category.status != 1}">Ẩn</c:if>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/admin/DeleteCategory"
                                              method="post" style="display:inline;">
                                            <input type="hidden" name="id" value="${category.id}"/>
                                            <button type="submit" class="delete-class">Xóa</button>
                                        </form>
                                    </td>

                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>
                    </div>

                </div>
                <form action="${pageContext.request.contextPath}/admin/AddCategory" method="post">
                    <div class="admin-content-main-add-category">
                        <div class="admin-content-main-title">
                            <h1>Thêm danh mục</h1>
                        </div>
                        <div class="admin-content-main-add-category-top">

                            <input type="text" placeholder="Tên" name="name">
                            <div class="select-status">
                                <label for="">Trạng Thái</label>
                                <select name="status" id="">
                                    <option value="1">Hiện</option>
                                    <option value="0">Ẩn</option>
                                </select>
                            </div>

                            <div class="save-cancel">
                                <button class="main-btn">Lưu</button>
                            </div>
                        </div>
                        <div class="admin-content-main-add-category-bottom">

                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</section>

<script src="asset/js/app.js"></script>
<script src="asset/js/datapresudo.js"></script>
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
