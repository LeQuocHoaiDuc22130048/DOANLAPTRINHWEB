<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 1/15/2025
  Time: 6:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link
          href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
          rel="stylesheet"
  />

  <title>Trang quản lý</title>
  <style>
    div#productTable_filter {
      position: absolute;
      top: -40px;
      right: 0;
    }

    div#productTable_filter label input {
      padding: 10px;
      width: 40vh;
      border: none;
      outline: #2e404f;
    }
  </style>
</head>
<body>
<section class="admin">
  <div class="row-grid">
    <jsp:include page="SideMenu.jsp"/>
    <div class="admin-content">
      <jsp:include page="Header.jsp"/>
      <div class="admin-content main">
        <div class="admin-content-main-title">
          <h1>Danh sách phản hồi</h1>
        </div>
        <div class="admin-content-main-content">
          <div class="admin-content-main-content-manager-list">
            <table id="productTable">
              <thead>
              <tr>
                <th>STT</th>
                <th>Tên người dùng</th>
                <th>Email</th>
                <th>Nội dung câu hỏi</th>
                <th>Ngày gửi</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="feedback" items="${feedBacks}">
                <tr>
                  <td>${feedback.id}</td>
                  <td>${feedback.name}</td>
                  <td>${feedback.email}</td>
                  <td>${feedback.message}</td>
                  <td>${feedback.createdAt}</td>
                </tr>
              </c:forEach>




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
<script>
  $(document).ready(function () {
    $('#productTable').DataTable({
      "language": {
        "sSearch": "Tìm kiếm",
        "sProcessing": "Đang xử lý",
        "oPaginate": {
          "sFirst": "Đầu",
          "sPrevious": "Trước",
          "sNext": "Tiếp",
          "sLast": "Cuối"
        }
      }
    });
  });
</script>
</html>
