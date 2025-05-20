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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <c:set var="titleName" value="Danh sách sản phẩm" scope="request"/>
    <c:import url="/admin/DashboardLink.jsp"/>
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
        <li><a href="ProductList" class="active"><i class="fa-solid fa-weight-hanging"></i>Sản phẩm</a></li>
        <li><a href="Category" ><i class="fa-solid fa-clipboard-list"></i>Danh mục sản phẩm</a></li>
        <li><a href="Promotion" ><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
        <li><a href="User"><i class="fa-solid fa-user"></i>Người dùng</a></li>
        <li><a href="Feedback"><i class="fa-solid fa-comment"></i>Phản hồi</a></li>
    </ul>
</div>

<div class="container">
    <jsp:include page="/admin/Header.jsp"/>
    <div class="content">
        <div class="btn_add_item">
            <a href="ProductAdd">
                <button class="btn btn-secondary">Thêm sản phẩm</button>
            </a>
        </div>
        <div class="data-table" style="margin: 30px 0">
            <table id="table_id" class="ui celled table" style="width: 100%">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên sản phẩm</th>
                    <th>Ảnh</th>
                    <th>Thương hiệu</th>
                    <th>Giá bán</th>
                    <th>Số lượng</th>
                    <th>Tùy chỉnh</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${products}">
                <tr>
                        <td>${product.id}</td>
                        <td>${product.productName}</td>
                        <td><img src="../${product.img}" width="100px"></td>
                        <td><img src="../${product.brand}" width="100px"></td>
                        <td><fmt:formatNumber value="${product.price}" type="currency" currencyCode="VND"/></td>
                        <td>${product.quantity}</td>
                        <td>
                            <a href="">
                                <button class="btn btn-warning btn-sm">
                                    <i class="fa-solid fa-pen"></i>
                                </button>
                            </a>
                            <a href="">
                                <button class="btn btn-danger btn-sm">
                                    <i class="fa-solid fa-trash-can"></i>
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
