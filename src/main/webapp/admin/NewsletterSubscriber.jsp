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
  <c:set var="titleName" value="Đăng ký nhận tin" scope="request"/>
  <title>${titleName}</title>

</head>
<body>
<div class="side-menu">
  <div class="brand-name">
    <img src="asset/image/logo.png" alt="eyestyle" width="100px"/>
  </div>
  <ul style="padding: 0">
    <li><a href="Dashboard" ><i class="fa-solid fa-house"></i>Trang chủ</a></li>
    <li><a href="Order"><i class="fa-solid fa-scroll"></i>Đơn hàng</a></li>
    <li><a href="ProductList"><i class="fa-solid fa-weight-hanging"></i>Sản phẩm</a></li>
    <li><a href="Category"><i class="fa-solid fa-clipboard-list"></i>Danh mục sản phẩm</a></li>
    <li><a href="Promotion"><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
    <li><a href="User"><i class="fa-solid fa-user"></i>Người dùng</a></li>
    <li><a href="Feedback"><i class="fa-solid fa-comment"></i>Phản hồi</a></li>
    <li><a href="Newsletter-subscriber" class="active"><i class="fa-solid fa-bell"></i>Đăng ký nhận tin</a></li>
    <li><a href="Banner-carousel"><i class="fa-solid fa-image"></i>Đăng ký nhận tin</a></li>
    <li><a href="InventoryList"><i class="fa-solid fa-boxes-stacked"></i>Kho hàng</a></li>
  </ul>
</div>

<div class="container">
  <jsp:include page="/admin/Header.jsp"/>
  <div class="content">
    <div class="d-flex justify-content-end mb-3">
      <button class="btn btn-success" onclick="showSendAllModal()">
        <i class="fa-solid fa-paper-plane"></i> Gửi email cho tất cả người đăng ký
      </button>
    </div>

    <div class="data-table">
      <table id="table_id" class="ui celled table" style="width: 100%">
        <thead>
        <tr>
          <th>ID</th>
          <th>Tên</th>
          <th>Email</th>
          <th>Ngày đăng ký</th>
          <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="subscriber" items="${subscribers}">
          <tr>
            <td>${subscriber.id}</td>
            <td>${subscriber.name}</td>
            <td>${subscriber.email}</td>
            <td>${subscriber.created_at}</td>
            <td>
              <a>
                <button class="btn btn-primary btn-sm"
                        data-id="${subscriber.id}"
                        data-email="${subscriber.email}"
                        data-name="${subscriber.name}"
                        onclick="showMailModal(this)">
                  <i class="fa-solid fa-envelope"></i>
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

<!-- Modal gửi mail -->
<div class="modal fade" id="mailModal" tabindex="-1" aria-labelledby="mailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="mailModalLabel">Gửi email đến: <span id="subscriberName"></span></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
      </div>
      <div class="modal-body">
        <input type="hidden" id="subscriberEmail" />
        <div class="mb-3">
          <label for="newsletterContent" class="form-label">Nội dung email</label>
          <textarea class="form-control" id="newsletterContent" rows="5"></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="sendSingleBtn" onclick="sendNewsletterMail()">Gửi email</button>
        <button type="button" class="btn btn-success d-none" id="sendAllBtn" onclick="sendToAll()">Gửi tất cả</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
      </div>
    </div>
  </div>
</div>



</body>
<c:import url="/admin/DashboardScript.jsp"/>
</html>
