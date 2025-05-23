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
  <c:set var="titleName" value="Phản hồi" scope="request"/>
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
    <li><a href="Category" ><i class="fa-solid fa-clipboard-list"></i>Danh mục sản phẩm</a></li>
    <li><a href="Promotion" ><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
    <li><a href="User" ><i class="fa-solid fa-user"></i>Người dùng</a></li>
    <li><a href="Feedback" class="active" ><i class="fa-solid fa-comment"></i>Phản hồi</a></li>
    <li><a href="Newsletter-subscriber"><i class="fa-solid fa-bell"></i>Đăng ký nhận tin</a></li>
    <li><a href="Banner-carousel"><i class="fa-solid fa-image"></i>Banner</a></li>
  </ul>
</div>

<div class="container">
  <jsp:include page="/admin/Header.jsp"/>
  <div class="content">

    <div class="data-table">
      <table id="table_id" class="ui celled table" style="width: 100%">
        <thead>
        <tr>
          <th>ID</th>
          <th>Tên</th>
          <th>Email</th>
          <th>Nội dung</th>
          <th>Trạng thái</th>
          <th>Phản hồi</th>
          <th>Ngày gửi</th>
          <th>Ngày phản hồi</th>
          <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="feedback" items="${feedBacks}">
          <tr>
            <td>${feedback.id}</td>
            <td>${feedback.name}</td>
            <td>${feedback.email}</td>
            <td>${feedback.message}</td>
            <td>
              <c:if test="${feedback.status == 0}">
                <button class="btn btn-warning btn-sm">Chưa trả lời</button>
              </c:if>
            </td>
            <td>
                ${feedback.response}
            </td>
            <td>
              <c:set var="feTime" value="${fn:replace(feedback.createdAt,'T' ,'  ' )}"/>
                ${feTime}
            </td>
            <td>
              <c:set var="fe2Time" value="${fn:replace(feedback.updatedAt,'T' ,'  ' )}"/>
                ${fe2Time}
            </td>
            <td>
              <a>
                <button class="btn btn-primary btn-sm" data-id="${feedback.id}" data-email="${feedback.email}" data-name="${feedback.name}" onclick="showReplyModal(this)">
                  <i class="fa-solid fa-reply"></i>
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

<div class="modal" id="replyModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Phản hồi người dùng</h5>
      </div>
      <div class="modal-body">
        <input type="hidden" id="feedbackId">
        <input type="hidden" id="feedbackEmail">
        <div class="mb-3">
          <label for="replyContent">Nội dung phản hồi</label>
          <textarea id="replyContent" class="form-control" rows="5"></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button onclick="sendReply()" class="btn btn-success">Gửi</button>
        <button data-bs-dismiss="modal" class="btn btn-secondary">Đóng</button>
      </div>
    </div>
  </div>
</div>


</body>
<c:import url="/admin/DashboardScript.jsp"/>
</html>
