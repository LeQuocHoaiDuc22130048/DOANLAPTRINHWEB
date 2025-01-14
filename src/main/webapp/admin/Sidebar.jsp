<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 1/10/2025
  Time: 6:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="asset/css/style.css">
</head>
<div class="admin-sidebar" style="height: 104vh">
    <div class="admin-sidebar-top">
        <img src="asset/imgs/logo.png" alt="">
    </div>
    <div class="admin-sidebar-content">
        <ul>
            <li><a href=""><i class="ri-dashboard-line"></i>Trang quản lý<i class="ri-add-box-line"></i></a>
                <ul class="sub-menu">
                    <div class="sub-menu-items"><li><a href="admin.html"><i class="ri-arrow-right-s-fill"></i>Tổng quan</a></li></div>

                </ul>
            </li>
            <li><a href=""><i class="ri-file-list-line"></i>Đơn hàng<i class="ri-add-box-line"></i></a>
                <ul class="sub-menu">
                    <div class="sub-menu-items">
                        <li><a href="${pageContext.request.contextPath}/admin/OrderList"><i class="ri-arrow-right-s-fill"></i>Danh sách</a></li>

                    </div>

                </ul>
            </li>
            <li></i><a href=""><i class="ri-file-list-line"></i>Sản phẩm<i class="ri-add-box-line"></i></a>
                <ul class="sub-menu">
                    <div class="sub-menu-items">
                        <li><a href="${pageContext.request.contextPath}/admin/AdminProductList"><i class="ri-arrow-right-s-fill"></i>Danh sách sản phẩm</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/ProductAdd"><i class="ri-arrow-right-s-fill"></i>Thêm</a></li>
                    </div>
                </ul>

            </li>

            <li></i><a href=""><i class="ri-file-list-line"></i>Danh mục sản phẩm<i class="ri-add-box-line"></i></a>
                <ul class="sub-menu">
                    <div class="sub-menu-items">
                        <li><a href="${pageContext.request.contextPath}/admin/ListCategories"><i class="ri-arrow-right-s-fill"></i>Quản lý danh mục</a></li>
                    </div>
                </ul>
            </li>
            <li></i><a href=""><i class="ri-discount-percent-line"></i>Khuyến mãi<i class="ri-add-box-line"></i></a>
                <ul class="sub-menu">
                    <div class="sub-menu-items">
                        <li><a href="${pageContext.request.contextPath}/admin/PromotionList"><i class="ri-arrow-right-s-fill"></i>Danh sách mã giảm giá</a></li>
                    </div>
                </ul>
            </li>
            <li><a href=""><i class="ri-user-line"></i>Người dùng<i class="ri-add-box-line"></i></a>
                <ul class="sub-menu">
                    <div class="sub-menu-items">
                        <li><a href="manager_user.html"><i class="ri-arrow-right-s-fill"></i>Quản lý người dùng</a></li>

                    </div>

                </ul>
            </li>
            <li><a href=""><i class="ri-feedback-line"></i>Phản hồi<i class="ri-add-box-line"></i></a>
                <ul class="sub-menu">
                    <div class="sub-menu-items">
                        <li><a href="feedback.html"><i class="ri-arrow-right-s-fill"></i>Phản hồi</a></li>
                    </div>

                </ul>
            </li>
        </ul>
    </div>
</div>
</html>
