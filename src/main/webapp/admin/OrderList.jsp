<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="asset/css/style.css">
    <title>Trang quản lý</title>
</head>
<body>
<section class="admin">
    <div class="row-grid">
        <div class="admin-sidebar">
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
                                <li><a href="order_list.html"><i class="ri-arrow-right-s-fill"></i>Danh sách</a></li>

                            </div>

                        </ul>
                    </li>
                    <li></i><a href=""><i class="ri-file-list-line"></i>Sản phẩm<i class="ri-add-box-line"></i></a>
                        <ul class="sub-menu">
                            <div class="sub-menu-items">
                                <li><a href="product_list.html"><i class="ri-arrow-right-s-fill"></i>Danh sách sản phẩm</a></li>
                                <li><a href="product_add.html"><i class="ri-arrow-right-s-fill"></i>Thêm</a></li>
                            </div>
                        </ul>

                    </li>

                    <li></i><a href="category_product.html"><i class="ri-file-list-line"></i>Danh mục sản phẩm<i class="ri-add-box-line"></i></a>
                        <ul class="sub-menu">
                            <div class="sub-menu-items">
                                <li><a href="category_product_list.html"><i class="ri-arrow-right-s-fill"></i>Quản lý danh mục</a></li>
                            </div>
                        </ul>
                    </li>
                    <li></i><a href=""><i class="ri-discount-percent-line"></i>Khuyến mãi<i class="ri-add-box-line"></i></a>
                        <ul class="sub-menu">
                            <div class="sub-menu-items">
                                <li><a href="promotion.html"><i class="ri-arrow-right-s-fill"></i>Danh sách mã giảm giá</a></li>
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
        <div class="admin-content">
            <div class="admin-content-top">
                <div class="admin-content-top-left">
                    <ul class="flex-box">
                        <li> <i class="ri-search-line"></i></li>
                        <li><i class="ri-drag-move-line"></i></li>
                    </ul>
                </div>
                <div class="admin-content-top-right">
                    <ul class="flex-box">
                        <li><i number = "3" class="ri-notification-4-line"></i ></li>
                        <li><i number = "5" class="ri-message-2-fill"></i ></li>
                        <li class="flex-box"><img style="width: 50px;" src="asset/imgs/logo.png" alt="">
                            <div class="admin-menu"><p>Nhóm 65<i class="ri-arrow-down-s-fill"></i></p></div>
                            <div class="sub-menu-admin-container hidden">
                                <div class="traingle"></div>
                                <ul class="sub-menu-admin">
                                    <li>

                                        <div class="logout">
                                            <a href="../dang_nhap.html">Đăng xuất</a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </li>


                    </ul>
                </div>
            </div>
            <div class="admin-content main">
                <div class="admin-content-main-title">
                    <h1>Danh sách đơn hàng</h1>
                </div>
                <div class="admin-content-main-content">
                    <div class="admin-content-main-content-order-list">
                        <table>
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên</th>
                                <th>SĐT</th>
                                <th>Email</th>
                                <th>Địa chỉ</th>
                                <th>Ghi chú</th>
                                <th>Chi tiết</th>
                                <th>Ngày</th>
                                <th>Trạng thái</th>
                                <th>Tùy biến</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>Lê Văn A</td>
                                <td>0123456789</td>
                                <td>abcxyz@gmai.com</td>
                                <td>154 Bắc Hải, Tân Bình, Hồ Chí Minh</td>
                                <td>Giao nhanh</td>
                                <td><a href="order_detail.html" class="edit-class">Chi tiết</a></td>
                                <td>28/11/2024</td>
                                <td><a href="" class="confirm-order">Đã xác nhân</a></td>

                                <td>
                                    <a class="delete-class" href="">Xóa</a>
                                </td>
                            </tr>

                            <tr>
                                <td>1</td>
                                <td>Lê Văn A</td>
                                <td>0123456789</td>
                                <td>abcxyz@gmai.com</td>
                                <td>154 Bắc Hải, Tân Bình, Hồ Chí Minh</td>
                                <td>Giao nhanh</td>
                                <td><a href="order_detail.html" class="edit-class">Chi tiết</a></td>
                                <td>28/11/2024</td>
                                <td><a href="" class="nonconfirm-order">Chưa xác nhân</a></td>

                                <td>
                                    <a class="delete-class" href="">Xóa</a>
                                </td>
                            </tr>

                            <tr>
                                <td>1</td>
                                <td>Lê Văn A</td>
                                <td>0123456789</td>
                                <td>abcxyz@gmai.com</td>
                                <td>154 Bắc Hải, Tân Bình, Hồ Chí Minh</td>
                                <td>Giao nhanh</td>
                                <td><a href="order_detail.html" class="edit-class">Chi tiết</a></td>
                                <td>28/11/2024</td>
                                <td><a href="" class="confirm-order">Đã xác nhân</a></td>

                                <td>
                                    <a class="delete-class" href="">Xóa</a>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>

<script src="asset/js/app.js"></script>
</body>
</html>