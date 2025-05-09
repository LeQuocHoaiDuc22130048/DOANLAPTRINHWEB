<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 1/9/2025
  Time: 1:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <c:set var="titleName" value="Trang quản lý" scope="request"/>
    <c:import url="/admin/DashboardLink.jsp"/>
    <title>${titleName}</title>
</head>
<body>
<div class="side-menu">
    <div class="brand-name">
        <img src="asset/image/logo.png" alt="eyestyle" width="100px"/>
    </div>
    <ul style="padding: 0">
        <li><a href="Dashboard" class="active"><i class="fa-solid fa-house"></i>Trang chủ</a></li>
        <li><a href="Order"><i class="fa-solid fa-scroll"></i>Đơn hàng</a></li>
        <li><a href="ProductList"><i class="fa-solid fa-weight-hanging"></i>Sản phẩm</a></li>
        <li><a href="Category"><i class="fa-solid fa-clipboard-list"></i>Danh mục sản phẩm</a></li>
        <li><a href="Promotion"><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
        <li><a href="User"><i class="fa-solid fa-user"></i>Người dùng</a></li>
        <li><a href="Feedback"><i class="fa-solid fa-comment"></i>Phản hồi</a></li>
        <li><a href="Newsletter-subscriber"><i class="fa-solid fa-bell"></i>Đăng ký nhận tin</a></li>

    </ul>
</div>

<div class="container">
    <jsp:include page="Header.jsp"/>
    <div class="content">
        <div class="cards">
            <div class="card">
                <div class="box">
                    <h2>2194</h2>
                    <h3>Thu nhập</h3>
                </div>
                <div class="icon-case">
                    <img src="./asset/image/income.png" alt="" />
                </div>
            </div>
            <div class="card">
                <div class="box">
                    <h2>3</h2>
                    <h3>Nhân viên</h3>
                </div>
                <div class="icon-case">
                    <img src="./asset/image/employee.png" alt="" />
                </div>
            </div>
            <div class="card">
                <div class="box">
                    <h2>2194</h2>
                    <h3>Sản phẩm</h3>
                </div>
                <div class="icon-case">
                    <img src="./asset/image/product.png" alt="" />
                </div>
            </div>
            <div class="card">
                <div class="box">
                    <h2>2194</h2>
                    <h3>Đơn Hàng</h3>
                </div>
                <div class="icon-case">
                    <img src="./asset/image/list.png" alt="" />
                </div>
            </div>
        </div>
        <div class="content-2">
            <div class="venue">
                <div class="title">
                    <h2>Thống kê doanh số</h2>
                    <select class="form-select form-select-md mb-1 w-25" aria-label="Default select example">
                        <option selected>--Chọn--</option>
                        <option value="1">Tuần qua</option>
                        <option value="2">Tháng qua</option>
                        <option value="3">Năm qua</option>
                    </select>
                    <button class="btn btn-primary" type="button">Lọc kết quả</button>
                </div>
                <canvas id="myLineChart">
                    <!-- Biểu đồ doanh thu -->
                </canvas>
            </div>
            <div class="list-customer">
                <div class="title">
                    <h2>Khách hàng gần đây</h2>
                    <a href="#" class="btn_a">View all</a>
                </div>
                <table>
                    <tr>
                        <th>Mã khách hàng</th>
                        <th>Tên</th>
                        <th>Chi tiết</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Nguyễn Văn A</td>
                        <td><a href="#" title="chi tiết khách hàng" class="btn-detail"><i class="fa-solid fa-circle-info"></i></a></td>
                    </tr>

                </table>
            </div>
        </div>
    </div>
</div>
<c:import url="/admin/DashboardScript.jsp"/>
<script src="./asset/js/Chart.js"></script>
<script src = ./asset/js/Notification.js></script>
</body>
</html>