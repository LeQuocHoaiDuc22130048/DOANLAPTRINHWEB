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
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <c:import url="DashboardLink.jsp"/>
    <c:set var="titleName" value="Danh sách sản phẩm" scope="request"/>
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
        <li><a href="AdminProductList" class="active"><i class="fa-solid fa-weight-hanging"></i>Sản phẩm</a></li>
        <li><a href="Product-category"><i class="fa-solid fa-clipboard-list"></i>Danh mục sản phẩm</a></li>
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
                <tr>
                    <td>${product.id}</td>
                    <td>${product.productName}</td>
                    <td>
                        <img width="100px" src="../${product.img}" alt="" />
                    </td>
                    <td>${product.price}</td>
                    <td>${product.quantity}</td>
                    <td>
                        <c:if test="${product.quantity > 0}">Còn hàng</c:if>
                        <c:if test="${product.quantity <= 0}">Hết hàng</c:if>
                    </td>
                    <td>
                        <button class="btn btn-primary btn-sm">
                            <i class="fa-solid fa-eye"></i>
                        </button>
                        <button
                                class="btn btn-danger btn-sm"
                                href=""
                                type="button"
                                data-bs-toggle="modal"
                                data-bs-target="#delete-receipt"
                        >
                            <i class="fa-solid fa-trash-can"></i>
                        </button>
                        <button
                                class="btn btn-warning btn-sm"
                                href=""
                                type="button"
                                data-bs-toggle="modal"
                                data-bs-target="#edit-receipt"
                        >
                            <i class="fa-solid fa-pen"></i>
                        </button>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal Add Product-->
<div class="modal fade" id="addProduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm sản phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="text" placeholder="Tên sản phẩm" name="name" class="form-control" aria-describedby="basic-addon1">
                <input type="text" placeholder="Màu" name="color" class="form-control mt-3" aria-describedby="basic-addon1">
                <input type="text"placeholder="Chất liệu" name="material" class="form-control mt-3" aria-describedby="basic-addon1">
                <input type="text" placeholder="Số lượng" name="quantity" class="form-control mt-3" aria-describedby="basic-addon1">
                <select class="form-select mt-3" aria-label="Default select example" name="brandId"
                        action="${pageContext.request.contextPath}/admin/ProductAdd" method="post" enctype="multipart/form-data"
                >
                    <option selected>Chọn thương hiệu</option>
                    <c:forEach var="brand" items="${brands}">
                        <option value="${brand.id}">${brand.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Thêm</button>
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

