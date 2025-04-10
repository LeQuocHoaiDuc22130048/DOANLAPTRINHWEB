<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 1/15/2025
  Time: 3:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet"
          type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <script type="text/javascript"
            charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js">
    </script>
    <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="https://cdn.datatables.net/2.2.1/css/dataTables.semanticui.css">
    <link rel="stylesheet" href="asset/css/style.css">
    <title>Trang quản lý</title>
    <style>
        div#productTable_filter {
            position: absolute;
            top: -30px;
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
            <div class="admin-content-main">
                <div class="admin-content-main-title">
                    <h1>Danh sách mã giảm giá</h1>
                </div>
                <div class="admin-content-main-content" style="max-height: 375px">
                    <div class="admin-content-main-content-manager-list">
                        <table id="productTable">
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th>Mã code</th>
                                <th>Mô tả</th>
                                <th>Mức giảm</th>
                                <th>Trạng thái</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="discount" items="${discounts}">
                                <tr>
                                    <td>${discount.id}</td>
                                    <td>${discount.code}</td>
                                    <td>${discount.description}</td>
                                    <td>${discount.discountPercentage}%</td>
                                    <td>
                                        <c:if test="${discount.status == 1}"><a href="" class="edit-class">Đang hoạt
                                            động</a></c:if>
                                        <c:if test="${discount.status != 1}"><a href="" class="delete-class">Không hoạt
                                            động</a></c:if>

                                    </td>

                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>
                    </div>

                </div>
                <form action="${pageContext.request.contextPath}/admin/AddPromotion" method="post">
                    <div class="admin-content-main-add-category">
                        <div class="admin-content-main-title">
                            <h1>Thêm mã giảm giá</h1>
                        </div>
                        <div class="admin-content-main-add-category-top promotion">
                            <input type="text" name="code" placeholder="Mã code">
                            <div class="select-status">
                                <label>Mức giảm %</label>
                                <input type="number" name="percent">
                            </div>
                            <select name="status" style="border: none;outline: none;margin: 10px;">
                                <option value="1" >Hoạt động</option>
                                <option value="2">Không Hoạt động</option>
                            </select>
                            <div class="save-cancel">
                                <button class="main-btn" type="submit" style="margin-left: 165px;">Lưu</button>
                            </div>
                        </div>
                        <div class="admin-content-main-add-category-bottom">
                            <textarea rows="4" placeholder="Mô tả" name="description" style="width: 80%"></textarea>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</section>

<script src="asset/js/app.js"></script>
<script src="asset/js/datapresudo.js"></script>
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

