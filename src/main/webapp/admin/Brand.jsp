<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 6/1/2025
  Time: 10:42 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <c:import url="/admin/DashboardLink.jsp"/>
  <c:set var="titleName" value="Quản lý thương hiệu" scope="request"/>
  <title>${titleName}</title>

</head>
<body>
<div class="side-menu">
  <div class="brand-name">
    <img src="asset/image/logo.png" alt="eyestyle" width="100"/>
  </div>
  <ul style="padding: 0">
    <li><a href="Dashboard" ><i class="fa-solid fa-house"></i>Trang chủ</a></li>
    <li><a href="Order"><i class="fa-solid fa-scroll"></i>Đơn hàng</a></li>
    <li><a href="ProductList"><i class="fa-solid fa-weight-hanging"></i>Sản phẩm</a></li>
    <li><a href="Category" ><i class="fa-solid fa-clipboard-list"></i>Danh mục sản phẩm</a></li>
    <li><a href="Brand" class="active"><i class="fa-solid fa-comment"></i>Quản lý thương hiệu</a></li>
    <li><a href="Promotion"><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
    <li><a href="User"><i class="fa-solid fa-user"></i>Người dùng</a></li>
    <li><a href="Feedback"><i class="fa-solid fa-comment"></i>Phản hồi</a></li>
    <li><a href="Newsletter-subscriber"><i class="fa-solid fa-bell"></i>Đăng ký nhận tin</a></li>
    <li><a href="Banner-carousel"><i class="fa-solid fa-image"></i>Banner</a></li>
    <li><a href="InventoryList"><i class="fa-solid fa-boxes-stacked"></i>Kho hàng</a></li>
  </ul>
</div>

<div class="container">
  <jsp:include page="/admin/Header.jsp"/>
  <div class="content">
    <div class="btn_add_item">
      <a href="AddBrand">
        <button class="btn btn-secondary">Thêm thương hiệu</button>
      </a>
    </div>
    <div class="data-table" style="margin: 30px 0">
      <table id="table_id" class="ui celled table" style="width: 100%">
        <thead>
        <tr>
          <th>ID</th>
          <th>Tên thương hiệu</th>
          <th>Tiêu đề</th>
          <th>Ảnh</th>
          <th>Mô tả</th>
          <th>Icon</th>
          <th>Tùy chỉnh</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="brand" items="${brands}">
          <tr>
            <td>${brand.id}</td>
            <td>${brand.name}</td>
            <td><div class="tr_div">${brand.title}</div></td>
            <td>
              <img src="../${brand.img}" alt="${brand.img} " width="100px"/>
            </td>
            <td>
              ${brand.description}
            </td>
            <td>
              <img src="../${brand.icon}" alt="${brand.icon} " width="100px"/>
            </td>
            <td>
              <button
                      class="btn btn-warning btn-sm view-details-btn"
                      type="button" data-bs-toggle="modal"
                      data-bs-target="#brandEdit"
                      onclick="editBrand(this)"
                      data-id="${brand.id}"
                      data-name="${brand.name}"
                      data-title="${brand.title}"
                      data-img="../${brand.img}"
                      data-description="${brand.description}"
                      data-icon="../${brand.icon}"
              >
                <i class="fa-solid fa-pencil"></i>
              </button>
              <a>
                <button class="btn btn-danger btn-sm">
                  <i class="fa-solid fa-trash-can"></i>
                </button>
              </a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>


<div class="modal fade" id="brandEdit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-scrollable">
    <div class="modal-content" style="height: 80vh">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Sửa thương hiệu</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
      </div>
      <div class="modal-body text-center" id="editBrandContent">
        <form id="editBrandForm" enctype="multipart/form-data" method="post">
          <input type="hidden" name="idBrand" id="editId">
          <div class="row mb-3">
            <div class="col-md-6">
              <label class="form-label">Tên thương hiệu:</label>
              <input type="text" name="brandName" id="editBrand" class="form-control" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Tiêu đề:</label>
              <input type="text" name="brandTitle" id="editBrandTitle" class="form-control" required>
            </div>
          </div>

          <div class="row mb-3">
            <div class="col-md-6">
              <label class="form-label">Ảnh hiện tại:</label><br>
              <img id="imageBrand" src="" alt="Ảnh hiện tại" style="max-width: 100px;" class="mb-2"><br>
              <label class="form-label">Thay đổi ảnh khác (tuỳ chọn):</label>
              <input type="file" name="imageBrand" class="form-control" accept="image/*">
            </div>
            <div class="col-md-6">
              <label class="form-label">Icon hiện tại:</label><br>
              <img id="iconBrand" src="" alt="Icon hiện tại" style="max-width: 100px;" class="mb-2"><br>
              <label class="form-label">Thay đổi icon khác (tuỳ chọn):</label>
              <input type="file" name="iconBrand" class="form-control" accept="image/*">
            </div>
          </div>

          <div class="mb-3">
            <label for="editBrandDescription" class="form-label">Mô tả:</label>
            <textarea name="descriptionBrand" id="editBrandDescription" class="form-control" rows="4" required></textarea>
          </div>

          <div class="d-flex justify-content-end gap-2">
            <button type="submit" class="btn btn-success">Cập nhật</button>
            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Hủy</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

</body>
<c:import url="/admin/DashboardScript.jsp"/>

</html>
