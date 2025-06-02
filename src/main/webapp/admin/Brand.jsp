<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 6/1/2025
  Time: 10:42 PM
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
  <c:set var="titleName" value="Quản lý thương hiệu" scope="request"/>
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
    <li><a href="Brand" class="active"><i class="fa-solid fa-comment"></i>Quản lý thương hiệu</a></li>
    <li><a href="Promotion"><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
    <li><a href="User"><i class="fa-solid fa-user"></i>Người dùng</a></li>
    <li><a href="Feedback"><i class="fa-solid fa-comment"></i>Phản hồi</a></li>
    <li><a href="Newsletter-subscriber"><i class="fa-solid fa-bell"></i>Đăng ký nhận tin</a></li>
    <li><a href="Banner-carousel"><i class="fa-solid fa-image"></i>Banner</a></li>
    <li><a href="InventoryList"><i class="fa-solid fa-boxes-stacked"></i>Kho hàng</a></li>
  </ul>
</div>

<div class="container">
  <jsp:include page="/admin/Header.jsp"/>
  <div class="content">
    <div class="btn_add_item">
      <a href="AddBrand">
        <button class="btn btn-secondary">Thêm thương hiệu</button>
      </a>
    </div>
    <div class="data-table" style="margin: 30px 0">
      <table id="table_id" class="ui celled table" style="width: 100%">
        <thead>
        <tr>
          <th>ID</th>
          <th>Tên thương hiệu</th>
          <th>Tiêu đề</th>
          <th>Ảnh</th>
          <th>Mô tả</th>
          <th>Icon</th>
          <th>Tùy chỉnh</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="brand" items="${brands}">
          <tr>
            <td>${brand.id}</td>
            <td>${brand.name}</td>
            <td><div class="tr_div">${brand.title}</div></td>
            <td>
              <img src="../${brand.img}" alt="${brand.img} " width="100px"/>
            </td>
            <td>
              ${brand.description}
            </td>
            <td>
              <img src="../${brand.icon}" alt="${brand.icon} " width="100px"/>
            </td>
            <td>
              <a>
                <button class="btn btn-warning btn-sm">
                  <i class="fa-solid fa-pen"></i>
                </button>
              </a>
              <a>
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
