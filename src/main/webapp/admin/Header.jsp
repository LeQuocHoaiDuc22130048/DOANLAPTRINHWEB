<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 1/10/2025
  Time: 7:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header">
    <div class="nav">
        <div class="header-title">
            <h2>${titleName}</h2>
            <div class="underline"></div>
        </div>
        <div class="search">
            <input type="text" placeholder="Tìm kiếm..." />
            <button type="submit">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </div>
        <div class="add_btn">
            <a href="#" class="nav-link dropdown-toggle" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Thêm
            </a>
            <ul class="dropdown-menu dropdown-menu w-auto" aria-labelledby="navbarDarkDropdownMenuLink">
                <li><a class="dropdown-item" href="ProductAdd">Thêm sản phẩm</a></li>
                <li><a class="dropdown-item" href="ListCategories">Thêm danh mục</a></li>
                <li><a class="dropdown-item" href="#">...</a></li>
            </ul>
        </div>
        <div class="user">
            <div class="dropstart notification ms-auto me-3">
                <button class="btn position-relative" type="button" id="notificationDropdown"
                        data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-bell fa-lg"></i>
                    <span class="notification-badge badge bg-danger rounded-pill">2</span>
                </button>


            </div>

            <%--Modal notify--%>
            <div class="modal fade" id="notificationModal" tabindex="-1" aria-labelledby="notificationModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="notificationModalLabel">Chi tiết thông báo</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="notificationModalBody">
                            <!-- Nội dung sẽ được điền bằng JavaScript -->
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-primary">Xử lý</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="img-case dropdown">
                <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown">
                    <img src="./asset/image/user.png" alt="" />
                    <span>admin</span>
                </button>
                <ul class="dropdown-menu w-25">
                    <li><a class="dropdown-item" href="#">Quản lý tài khoản</a></li>
                    <li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                </ul>

            </div>
        </div>
    </div>
</div>


