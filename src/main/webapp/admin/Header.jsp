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
        <div class="user">
            <div class="dropstart notification ms-auto me-3">
                <button class="btn position-relative" type="button" id="notificationDropdown"
                        data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-bell fa-lg"></i>
                    <span class="notification-badge badge bg-danger rounded-pill">2</span>
                </button>

                <ul class="dropdown-menu dropdown-menu-end p-0" aria-labelledby="notificationDropdown">
                    <li class="dropdown-header bg-light py-2 px-3 d-flex justify-content-between">
                        <span><strong>Thông báo mới</strong></span>
                        <a href="#" class="text-primary" id="markAllRead">Đánh dấu đã đọc</a>
                    </li>

                    <!-- Danh sách thông báo -->
                    <li>
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <tbody>
                                <!-- Thông báo 1 -->
                                <tr class="notification-item unread" data-notification-id="1">
                                    <td style="width: 40px;">
                                        <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center"
                                             style="width: 32px; height: 32px;">
                                            <i class="fas fa-user"></i>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="fw-bold">Khách hàng: Nguyễn Văn A</div>
                                        <div>Đã đặt lịch hẹn mới vào ngày 15/06/2023</div>
                                        <div class="notification-time">10 phút trước</div>
                                    </td>
                                </tr>

                                <!-- Thông báo 2 -->
                                <tr class="notification-item unread" data-notification-id="2">
                                    <td>
                                        <div class="bg-success text-white rounded-circle d-flex align-items-center justify-content-center"
                                             style="width: 32px; height: 32px;">
                                            <i class="fas fa-comment"></i>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="fw-bold">Khách hàng: Trần Thị B</div>
                                        <div>Để lại đánh giá 5 sao cho dịch vụ</div>
                                        <div class="notification-time">1 giờ trước</div>
                                    </td>
                                </tr>

                                <!-- Thông báo 3 -->
                                <tr class="notification-item" data-notification-id="3">
                                    <td>
                                        <div class="bg-warning text-white rounded-circle d-flex align-items-center justify-content-center"
                                             style="width: 32px; height: 32px;">
                                            <i class="fas fa-exclamation"></i>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="fw-bold">Khách hàng: Lê Văn C</div>
                                        <div>Yêu cầu hỗ trợ kỹ thuật khẩn</div>
                                        <div class="notification-time">2 ngày trước</div>
                                    </td>
                                </tr>

                                <!-- Thông báo 4 -->
                                <tr class="notification-item" data-notification-id="4">
                                    <td>
                                        <div class="bg-info text-white rounded-circle d-flex align-items-center justify-content-center"
                                             style="width: 32px; height: 32px;">
                                            <i class="fas fa-calendar-check"></i>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="fw-bold">Khách hàng: Phạm Thị D</div>
                                        <div>Xác nhận thanh toán dịch vụ</div>
                                        <div class="notification-time">3 ngày trước</div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </li>

                    <li class="dropdown-footer bg-light py-2 px-3 text-center">
                        <a href="#" class="text-primary">Xem tất cả thông báo</a>
                    </li>
                </ul>
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
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Quản lý tài khoản</a></li>
                    <li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                </ul>

            </div>
        </div>
    </div>
</div>


