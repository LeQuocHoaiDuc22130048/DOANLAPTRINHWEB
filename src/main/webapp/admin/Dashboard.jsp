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

    <c:import url="DashboardLink.jsp"/>
    <title>Trang quản lý</title>
</head>
<body>
<section class="admin">
    <div class="row-grid">
        <jsp:include page="Sidebar.jsp"/>
        <div class="admin-content">
        <jsp:include page="SidebarTop.jsp"/>
            <div class="admin-content main">
                <div class="admin-content-main-title">
                    <h1>Trang quản lý</h1>
                </div>
                </div>

                <div class="admin-content-main-content admin-dashboard-bottom">
                    <div class="admin-content-main-content-home-admin-bottom">
                        <div class="admin-content-main-content-home-admin-bottom-left">
                            <label ><h3>Doanh số trong tháng</h3></label>
                            <canvas id="revenueChart" style="box-sizing: border-box; height: 400px; width: 452px;"></canvas>
                        </div>
                        <div class="admin-content-main-content-home-admin-bottom-right">
                            <label ><h3>Sản phẩm bán chạy trong tháng</h3></label>
                            <div class="admin-content-main-content-home-table">
                                <table>
                                    <tr>
                                    <th>Mã sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Thương hiệu</th>
                                    <th>Ảnh</th>
                                    <th>Số lượng đã bán</th>

                                </tr>

                                    <c:forEach var="l" items="${ls}">
                                        <tr>
                                            <td>${l.id}</td>
                                            <td>${l.name}</td>
                                            <td>${l.brand}</td>
                                            <td><img src="../${l.path}" width="70px"></td>
                                            <td>${l.amount}</td>

                                        </tr>
                                    </c:forEach>

                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</section>

<script src="asset/js/app.js"></script>
<script src="asset/js/datapresudo.js"></script>
</body>
</html>