<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <c:set var="titleName" value="Kho hàng" scope="request"/>
    <title>${titleName}</title>
    <c:import url="/admin/DashboardLink.jsp"/>
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
        <li><a href="Brand"><i class="fa-solid fa-comment"></i>Quản lý thương hiệu</a></li>
        <li><a href="Promotion"><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
        <li><a href="User"><i class="fa-solid fa-user"></i>Người dùng</a></li>
        <li><a href="Feedback"><i class="fa-solid fa-comment"></i>Phản hồi</a></li>
        <li><a href="Newsletter-subscriber"><i class="fa-solid fa-bell"></i>Đăng ký nhận tin</a></li>
        <li><a href="Banner-carousel"><i class="fa-solid fa-image"></i>Banner</a></li>
        <li><a href="InventoryList" class="active"><i class="fa-solid fa-boxes-stacked"></i>Kho hàng</a></li>
        <li><a href="PostList"><i class="fa-solid fa-pen-to-square"></i>Bài viết</a></li>
    </ul>
</div>

<div class="container">
    <jsp:include page="Header.jsp"/>
    <div class="content">
        <div class="content-2">
            <div class="list-inventory">
                <div class="title">
                    <h2>Danh sách sản phẩm trong kho</h2>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#importModal">
                        <i class="fa-solid fa-file-import"></i> Nhập kho
                    </button>
                </div>

                <c:if test="${not empty message}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                            ${message}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            ${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <div class="data-table">
                    <table id="table_id" class="ui celled table" style="width: 100%">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Thương hiệu</th>
                            <th>Giá bán</th>
                            <th>Số lượng tồn kho</th>
                            <th>Trạng thái</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="product" items="${products}">
                            <tr>
                                <td>${product.id}</td>
                                <td>
                                    <img src="${context}/${product.img}" alt="${product.productName}" style="width: 50px; height: 50px; object-fit: cover;">
                                </td>
                                <td>${product.productName}</td>
                                <td>
                                    <img src="${context}/${product.brand}" alt="${product.brand}" style="width: 50px; height: 50px; object-fit: cover;">
                                </td>
                                <td>${product.price}</td>
                                <td>${product.quantity}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${product.quantity <= 0}">
                                            <span class="badge bg-danger">Hết hàng</span>
                                        </c:when>
                                        <c:when test="${product.quantity <= 10}">
                                            <span class="badge bg-warning">Sắp hết hàng</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-success">Còn hàng</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Import Inventory Modal -->
<div class="modal fade" id="importModal" tabindex="-1" aria-labelledby="importModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="importModalLabel">Nhập kho từ Excel</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="${context}/admin/InventoryList" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <input type="hidden" name="action" value="import">
                    <div class="mb-3">
                        <label for="excelFile" class="form-label">Chọn file Excel:</label>
                        <input class="form-control" type="file" id="excelFile" name="excelFile" accept=".xls,.xlsx" required>
                        <div class="form-text">
                            File Excel phải có định dạng: ID sản phẩm | Số lượng nhập
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Nhập kho</button>
                </div>
            </form>
        </div>
    </div>
</div>

<c:import url="/admin/DashboardScript.jsp"/>

</body>
</html>