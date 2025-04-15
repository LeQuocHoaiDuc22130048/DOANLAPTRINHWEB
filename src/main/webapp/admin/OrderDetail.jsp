<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 4/13/2025
  Time: 12:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <jsp:include page="DashboardLink.jsp"/>
  <c:set var="titleName" value="Chi tiết đơn hàng" scope="request"/>
  <title>${titleName}</title>
</head>
<body>
<div class="side-menu">
  <div class="brand-name">
    <img src="asset/image/logo.png" alt="eyestyle" width="100px"/>
  </div>
  <ul style="padding: 0">
    <li><a href="Dashboard"><i class="fa-solid fa-house"></i>Trang chủ</a></li>
    <li><a href="Order" class="active"><i class="fa-solid fa-scroll"></i>Đơn hàng</a></li>
    <li><a href="AdminProductList"><i class="fa-solid fa-weight-hanging"></i>Sản phẩm</a></li>
    <li><a href="ProductCategory"><i class="fa-solid fa-clipboard-list"></i>Danh mục sản phẩm</a></li>
    <li><a href="Promotion"><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
    <li><a href="User"><i class="fa-solid fa-user"></i>Người dùng</a></li>
    <li><a href="Feedback"><i class="fa-solid fa-comment"></i>Phản hồi</a></li>

  </ul>
</div>

<div class="container">
  <jsp:include page="Header.jsp"/>
  <div class="content" >
    <div style="margin-top: 100px">
      <table id="table_id" class="ui celled table" style="width: 100%">
        <thead>
        <tr>
          <th>ID</th>
          <th>Ảnh</th>
          <th>Thương hiệu</th>
          <th>Mã sản phẩm</th>
          <th>Giá</th>
          <th>Số lượng</th>
          <th>Thành tiền</th>
          <th>Tùy biến</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <c:forEach var="od" items="${orderDetail}">
          <td>${od.productId}</td>
          <td><img width="../${od.productImage}" alt=""></td>
          <td><img width="70px" src="asset/imgs/oakley.jpg" alt=""></td>
          <td>95001_N1S</td>
          <td>5.000.000đ</td>
          <td>1</td>
          <td>5.000.000đ</td>
          <td>
            <a class="btn btn-danger" href="">
              <i class="fa-solid fa-trash-alt"></i>
            </a>
          </td>
        </tr>
        </c:forEach>
        <tr>
          <td style="font-weight: bold;" colspan="6">Tổng cộng</td>
          <td style="font-weight: 700;">15.000.000đ</td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>
