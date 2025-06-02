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
  <c:set var="titleName" value="Quản lý bài viết" scope="request"/>
  <title>${titleName}</title>
  <style>
    .custom-modal {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      z-index: 1000;
      justify-content: center;
      align-items: center;
    }

    .custom-modal-content {
      background-color: white;
      padding: 20px;
      border-radius: 5px;
      width: 50%;
      max-width: 600px;
      max-height: 90vh;
      overflow-y: auto;
      position: relative;
    }

    .custom-modal-content h3 {
      margin-bottom: 20px;
      color: #333;
    }

    .custom-modal-content form {
      display: flex;
      flex-direction: column;
    }

    .custom-modal-content label {
      margin-bottom: 5px;
      font-weight: 500;
    }

    .custom-modal-content .form-control {
      margin-bottom: 15px;
    }

    .custom-modal-content textarea {
      min-height: 150px;
      resize: vertical;
    }

    .custom-modal-content .d-flex {
      margin-top: 20px;
    }

    .custom-modal-content .btn {
      padding: 8px 20px;
    }
  </style>
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
    <li><a href="Banner-carousel"><i class="fa-solid fa-image"></i>Banner</a></li>
    <li><a href="InventoryList"><i class="fa-solid fa-boxes-stacked"></i>Kho hàng</a></li>
    <li><a href="PostList" class="active"><i class="fa-solid fa-pen-to-square"></i>Bài viết</a></li>
  </ul>
</div>

<div class="container">
  <jsp:include page="/admin/Header.jsp"/>
  <div class="content">
    <div class="btn_add_item">
      <button onclick="showAddPostModal()" class="btn btn-primary">Thêm bài viết</button>
    </div>
    <div class="data-table">
      <table id="table_id" class="ui celled table" style="width: 100%">
        <thead>
        <tr>
          <th>STT</th>
          <th>Tiêu đề</th>
          <th>Hình ảnh</th>
          <th>URL</th>
          <th>Trạng thái</th>
          <th>Tuỳ chỉnh</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="post" items="${requestScope.posts}" varStatus="loop">
          <tr>
            <td>${loop.index + 1}</td>
            <td>${post.title}</td>
            <td>
              <img src="../${post.thumbnail}" alt="${post.title}" width="100"><br/>
            </td>
            <td>
              <a href="${post.url}" target="_blank">${post.url}</a>
            </td>
            <td>
              <label class="toggle-switch">
                <input type="checkbox" ${post.access == 1 ? "checked" : ""}
                       onchange="toggleStatusDisplay(${post.id}, this.checked)">
                <span class="slider"></span>
              </label>
            </td>
            <td>
              <button onclick="editPost(${post.id})" class="btn btn-warning btn-sm">
                <i class="fa-solid fa-pen"></i>
              </button>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>

    <!-- Modal thêm bài viết -->
    <div id="addPostModal" class="custom-modal" style="display: none">
      <div class="custom-modal-content">
        <h3>Thêm bài viết mới</h3>
        <form id="addPostForm">
          <label>Tiêu đề:</label>
          <input type="text" name="title" class="form-control mb-2" required>
          <label>Nội dung:</label>
          <textarea name="content" class="form-control mb-2" required></textarea>
          <label>URL:</label>
          <input type="url" name="url" class="form-control mb-2" required>
          <label>Hình ảnh:</label>
          <input type="file" name="thumbnail" accept="image/*" class="form-control mb-3" required>
          <div class="d-flex justify-content-end gap-2">
            <button type="submit" class="btn btn-success">Thêm</button>
            <button type="button" onclick="hideAddPostModal()" class="btn btn-secondary">Hủy</button>
          </div>
        </form>
      </div>
    </div>

    <!-- Modal sửa bài viết -->
    <div id="editPostModal" class="custom-modal" style="display: none">
      <div class="custom-modal-content">
        <h3>Sửa bài viết</h3>
        <form id="editPostForm">
          <input type="hidden" name="id" id="editId">
          <label>Tiêu đề:</label>
          <input type="text" name="title" id="editTitle" class="form-control mb-2" required>
          <label>Nội dung:</label>
          <textarea name="content" id="editContent" class="form-control mb-2" required></textarea>
          <label>URL:</label>
          <input type="url" name="url" id="editUrl" class="form-control mb-2" required>
          <label>Ảnh hiện tại:</label>
          <img id="currentImagePreview" src="" alt="Ảnh hiện tại" style="max-width: 100px; display: none;">
          <label>Thay đổi ảnh khác (tuỳ chọn):</label>
          <input type="file" name="thumbnail" class="form-control mb-3">
          <div class="d-flex justify-content-end gap-2">
            <button type="submit" class="btn btn-success">Cập nhật</button>
            <button type="button" onclick="hideEditPostModal()" class="btn btn-secondary">Hủy</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

</body>
<c:import url="/admin/DashboardScript.jsp"/>
</html>