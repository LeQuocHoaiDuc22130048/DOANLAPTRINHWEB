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
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <c:import url="/admin/DashboardLink.jsp"/>
    <c:set var="titleName" value="Danh sách người dùng" scope="request"/>
    <title>${titleName}</title>

</head>
<body>
<div class="side-menu">
    <div class="brand-name">
        <img src="asset/image/logo.png" alt="eyestyle" width="100px"/>
    </div>
    <ul style="padding: 0">
        <li><a href="Dashboard" ><i class="fa-solid fa-house"></i>Trang chủ</a></li>
        <li><a href="Order"><i class="fa-solid fa-scroll"></i>Đơn hàng</a></li>
        <li><a href="ProductList"><i class="fa-solid fa-weight-hanging"></i>Sản phẩm</a></li>
        <li><a href="Category" ><i class="fa-solid fa-clipboard-list"></i>Danh mục sản phẩm</a></li>
        <li><a href="Brand"><i class="fa-solid fa-comment"></i>Quản lý thương hiệu</a></li>
        <li><a href="Promotion" ><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
        <li><a href="User" class="active"><i class="fa-solid fa-user"></i>Người dùng</a></li>
        <li><a href="Feedback"><i class="fa-solid fa-comment"></i>Phản hồi</a></li>
        <li><a href="Newsletter-subscriber"><i class="fa-solid fa-bell"></i>Đăng ký nhận tin</a></li>
        <li><a href="Banner-carousel"><i class="fa-solid fa-image"></i>Banner</a></li>
        <li><a href="InventoryList"><i class="fa-solid fa-boxes-stacked"></i>Kho hàng</a></li>
        <li><a href="PostList"><i class="fa-solid fa-pen-to-square"></i>Bài viết</a></li>
    </ul>
</div>

<div class="container">
    <jsp:include page="/admin/Header.jsp"/>
    <div class="content">
        <div class="btn_add_item">
            <a href="">
                <button class="btn btn-secondary">Thêm người dùng</button>
            </a>
        </div>
        <div class="data-table" style="margin: 30px 0">
            <table id="table_id" class="ui celled table" style="width: 100%">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>Địa chỉ</th>
                    <th>Trạng thái</th>
                    <th>Ngày tạo</th>
                    <th>Chỉnh sửa</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.phone}</td>
                        <td>
                            ${user.address}
                        </td>
                        <td>
                            <c:if test="${user.status == 1}">
                                <button class="btn btn-success">Hoạt động</button>
                            </c:if>
                        </td>
                        <td>
                            <c:set var="usTime" value="${fn:replace(user.created_at,'T' ,'  ' )}"/>
                            ${usTime}
                        </td>
                        <td>
                            <a>
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



</body>
<c:import url="/admin/DashboardScript.jsp"/>
</html>
