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
    <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="asset/css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                <div class="admin-content-main-content admin-dashboard-top">
                    <div class="admin-content-main-content-home-admin">
                        <div class="admin-content-main-content-home-table">
                            <label  class="label-table" style="display: flex; justify-content: center"><h3>Danh sách đơn hàng theo ngày</h3><i class="ri-arrow-down-s-fill"></i></label>
                            <div id="calender" class="hidden">
                                <input type="date" id="date-picker" min="" max="">
                            </div>
                            <table> <tr>
                                <th>STT</th>
                                <th>Mã đơn hàng</th>
                                <th>Mã khách hàng</th>
                                <th>Chi tiết đơn hàng</th>
                                <th>Tổng thanh toán</th>
                                <th>Trạng thái thanh toán</th>
                                <th>Trạng thái vận chuyển</th>
                                <th>Tùy chỉnh</th>
                            </tr>
                                <tr>
                                    <td>1</td>
                                    <td>xyz</td>
                                    <td>abc</td>
                                    <td><a href="order_detail.html" class="confirm-order">Chi tiết</a></td>
                                    <td>1000000đ</td>
                                    <td><a href="" class="confirm-order">Đã thanh toán</a></td>
                                    <td><a href="" class="confirm-order">Đã giao hàng</a></td>
                                    <td>
                                        <a href="order_detail.html" class="confirm-order">Sửa</a>
                                    </td>

                            </table>

                        </div>

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
                                <table> <tr>
                                    <th>Mã sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Thương hiệu</th>
                                    <th>Số lượng đã bán</th>

                                </tr>
                                    <tr>
                                        <td>abc</td>
                                        <td>xyz</td>
                                        <td>gucci</td>
                                        <td>10</td>

                                    </tr>
                                    <tr>
                                        <td>abc</td>
                                        <td>xyz</td>
                                        <td>gucci</td>
                                        <td>10</td>

                                    </tr>
                                    <tr>
                                        <td>abc</td>
                                        <td>xyz</td>
                                        <td>gucci</td>
                                        <td>10</td>

                                    </tr>
                                    <tr>
                                        <td>abc</td>
                                        <td>xyz</td>
                                        <td>gucci</td>
                                        <td>10</td>

                                    </tr>

                                </table>

                            </div>
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