<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <c:import url="/admin/DashboardLink.jsp"/>
    <c:set var="titleName" value="Banner" scope="request"/>
    <title>${titleName}</title>

</head>
<body>
<div class="side-menu">
    <div class="brand-name">
        <img src="asset/image/logo.png" alt="eyestyle" width="100px"/>
    </div>
    <ul style="padding: 0">
        <li><a href="Dashboard"><i class="fa-solid fa-house"></i>Trang chủ</a></li>
        <li><a href="Order"><i class="fa-solid fa-scroll"></i>Đơn hàng</a></li>
        <li><a href="ProductList"><i class="fa-solid fa-weight-hanging"></i>Sản phẩm</a></li>
        <li><a href="Category"><i class="fa-solid fa-clipboard-list"></i>Danh mục sản phẩm</a></li>
        <li><a href="Promotion"><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
        <li><a href="User"><i class="fa-solid fa-user"></i>Người dùng</a></li>
        <li><a href="Feedback"><i class="fa-solid fa-comment"></i>Phản hồi</a></li>
        <li><a href="Newsletter-subscriber"><i class="fa-solid fa-bell"></i>Đăng ký nhận tin</a></li>
        <li><a href="Banner-carousel" class="active"><i class="fa-solid fa-image"></i>Banner</a></li>
    </ul>
</div>

<div class="container">
    <jsp:include page="/admin/Header.jsp"/>
    <div class="content">
        <div class="btn_add_item">
            <button onclick="showAddBannerModal()" class="btn btn-primary">Thêm Banner</button>
        </div>
        <div class="data-table">
            <table id="table_id" class="ui celled table" style="width: 100%">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Tiêu đề</th>
                    <th>Hình ảnh</th>
                    <th>Liên kết</th>
                    <th>Trạng thái</th>
                    <th>Tuỳ chỉnh</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="banner" items="${requestScope.banners}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${banner.title}</td>
                        <td>
                            <img src="../${banner.image_url}" alt="${banner.title}" width="100"><br/>
                        </td>
                        <td>
                            <a href="${banner.link_url}">${banner.link_url}</a>
                        </td>
                        <td>
                            <label class="toggle-switch">
                                <input type="checkbox" ${banner.status == 1 ? "checked" : ""}
                                       onchange="toggleStatus(${banner.id}, this.checked)">
                                <span class="slider"></span>
                            </label>
                        </td>
                        <td>
                            <button onclick="editBanner(${banner.id})" class="btn btn-warning btn-sm">
                                <i class="fa-solid fa-pen"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Modal thêm banner -->
        <div id="addBannerModal" class="custom-modal" style="display: none">
            <div class="custom-modal-content">
                <h3>Thêm Banner Mới</h3>
                <form id="addBannerForm">
                    <label>Tiêu đề:</label>
                    <input type="text" name="title" class="form-control mb-2">
                    <label>Liên kết:</label>
                    <input type="text" name="link_url" class="form-control mb-2">
                    <label>Hình ảnh:</label>
                    <input type="file" name="image" accept="image/*" class="form-control mb-3">
                    <div class="d-flex justify-content-end gap-2">
                        <button type="submit" class="btn btn-success">Thêm</button>
                        <button type="button" onclick="hideAddBannerModal()" class="btn btn-secondary">Hủy</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Modal sửa banner -->
        <div id="editBannerModal" class="custom-modal" style="display: none">
            <div class="custom-modal-content">
                <h3>Sửa Banner</h3>
                <form id="editBannerForm">
                    <input type="hidden" name="id" id="editId">
                    <label>Tiêu đề:</label>
                    <input type="text" name="title" id="editTitle" class="form-control mb-2">
                    <label>Liên kết:</label>
                    <input type="text" name="link_url" id="editLink" class="form-control mb-2">
                    <label>Ảnh hiện tại:</label>
                    <img id="currentImagePreview" src="" alt="Ảnh hiện tại" style="max-width: 100px; display: none;">
                    <label>Thay đổi ảnh khác (tuỳ chọn):</label>
                    <input type="file" name="image" class="form-control mb-3">
                    <div class="d-flex justify-content-end gap-2">
                        <button type="submit" class="btn btn-success">Cập nhật</button>
                        <button type="button" onclick="hideEditBannerModal()" class="btn btn-secondary">Hủy</button>
                    </div>
                </form>
            </div>
        </div>


    </div>
</div>

</body>
<c:import url="/admin/DashboardScript.jsp"/>
</html>
