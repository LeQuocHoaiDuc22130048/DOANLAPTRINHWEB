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
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <c:import url="DashboardLink.jsp"/>
    <c:set var="titleName" value="Danh mục sản phẩm" scope="request"/>
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
        <li><a href="AdminProductList" ><i class="fa-solid fa-weight-hanging"></i>Sản phẩm</a></li>
        <li><a href="Product-category" class="active"><i class="fa-solid fa-clipboard-list"></i>Danh mục sản phẩm</a></li>
        <li><a href="Promotion"><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
        <li><a href="User"><i class="fa-solid fa-user"></i>Người dùng</a></li>
        <li><a href="Feedback"><i class="fa-solid fa-comment"></i>Phản hồi</a></li>

    </ul>
</div>

<div class="container">
    <jsp:include page="Header.jsp"/>

    <div class="content">
        <div class="data-table mx-3" style="margin-top: 100px;">
            <table id="table_id" class="ui celled table" style="width: 100%">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên</th>
                    <th>Số lượng sản phẩm</th>
                    <th>Ảnh danh mục</th>
                    <th>Trạng thái</th>
                    <th>Tùy chỉnh</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${categories}" var="category">
                    <tr>
                        <td>${category.id}</td>
                        <td>${category.name}</td>
                        <td>${category.productCount}</td>
                        <td>
                            <img width="100px" src="../${category.img}" alt="">
                        </td>
                        <td>
                            <c:if test="${category.status == 1}">Hiện</c:if>
                            <c:if test="${category.status != 1}">Ẩn</c:if>
                        </td>
                        <td>
                                <button type="submit" class="btn btn-danger">Xóa</button>
                                <button
                                        class="btn btn-warning"
                                        data-bs-toggle="modal"
                                        data-bs-target="#updateCategory"
                                >
                                   <a href="CategoryDetail?categoryId=${category.id}">
                                       <i class="fa-solid fa-pen"></i>
                                   </a>
                                </button>
                        </td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal Update status category-->
<div class="modal fade" id="updateCategory" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Cập nhật danh mục</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <c:choose>
                    <input type="text" value="${requestScope.}" class="form-control" name = "name"  required>
                </c:choose>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Lưu</button>
            </div>
        </div>
    </div>
</div>
<script src="./asset/js/Chart.js"></script>

<c:import url="DashboardScript.jsp"/>
<script src="./asset/js/Chart.js"></script>
<script src = ./asset/js/Notification.js></script>
</body>
</html>
