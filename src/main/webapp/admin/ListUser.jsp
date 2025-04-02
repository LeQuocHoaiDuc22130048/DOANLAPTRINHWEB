<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 1/15/2025
  Time: 5:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <jsp:include page="Header.jsp"/>
            <div class="admin-content main">
                <div class="admin-content-main-title">
                    <h1>Quản lý người dùng</h1>
                </div>
                <div class="admin-content-main-content">
                    <div class="admin-content-main-content-manager-list">
                        <table id="productTable">
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th>Tên người dùng</th>
                                <th>Email</th>
                                <th>Mật khẩu</th>
                                <th>Số điện thoại</th>
                                <th>Địa chỉ</th>
                                <th>Trạng thái</th>
                                <th>Ngày tạo</th>
                                <th>Ngày chỉnh sửa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.name}</td>
                                    <td>${user.email}</td>
                                    <td>${user.password}</td>
                                    <td>${user.phone}</td>
                                    <td>${user.address}</td>
                                    <td>
                                        <c:if test="${user.status == 1}"><a class="edit-class">Online</a></c:if>
                                        <c:if test="${user.status != 1}"><a class="delete-class">Offline</a></c:if>
                                    </td>
                                    <td>
                                        ${user.created_at}
                                    </td>
                                    <td>
                                        ${user.updated_at}
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
                "sSearch": "Tìm kiếm ",
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
