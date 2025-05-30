<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 1/14/2025
  Time: 7:32 PM
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
    <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="asset/css/style.css">
    <link rel="stylesheet" href="asset/styles.css">
    <link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/43.3.1/ckeditor5.css">
    <title>Trang quản lý</title>
</head>
<body>
<section class="admin">
    <div class="row-grid">
        <jsp:include page="Sidebar.jsp"/>
        <div class="admin-content">
            <jsp:include page="Header.jsp"/>
            <div class="admin-content main">
                <div class="admin-content-main-title">
                    <h1>Sửa sản phẩm</h1>
                </div>
                <form action="${pageContext.request.contextPath}/admin/UpdateProduct" method="post">
                    <div class="admin-content-main-content">
                        <div class="admin-content-main-content-product-add">
                            <div class="admin-content-main-content-left">
                                <div class="admin-content-main-content-two-input">
                                    <input type="text" placeholder="" name="id" value="${product.id}" readonly
                                           required>
                                    <input type="text" placeholder="Tên sản phẩm " name="name" value="${product.name}">
                                    <input type="text" placeholder="Màu" name="color" value="${product.color}">
                                    <input type="text" placeholder="Chất liệu" name="material"
                                           value="${product.material}">
                                    <input type="text" placeholder="Số lượng" name="quantity"
                                           value="${product.quantity}">
                                    <select name="brandId"
                                            style="height: 40px;border: none;background-color: var(--sub-bg-color);margin-bottom: 20px;outline: none;border-radius: var(--main-border-radius);padding-left: 6px;"> <%-- Lấy các thương hiệu từ cơ sở dữ liệu --%>
                                        <c:forEach var="brand" items="${brands}">
                                            <option value="${brand.id}"
                                                    <c:if test="${brand.id == product.brandId}">selected</c:if>>${brand.name}</option>
                                        </c:forEach>
                                    </select>

                                    <select name="shapeId"
                                            style="height: 40px;border: none;background-color: var(--sub-bg-color);margin-bottom: 20px;outline: none;border-radius: var(--main-border-radius);padding-left: 6px;">
                                        <c:forEach var="shape" items="${frameShapes}">
                                            <option value="${shape.id}"
                                                    <c:if test="${shape.id == product.shapeId}">selected</c:if>>${shape.name}</option>
                                        </c:forEach>
                                    </select>

                                    <select name="gender"
                                            style="height: 40px;border: none;background-color: var(--sub-bg-color);margin-bottom: 20px;outline: none;border-radius: var(--main-border-radius);padding-left: 6px;">
                                        <option value="1" <c:if test="${product.gender == 1}">selected</c:if>>Nam
                                        </option>
                                        <option value="2" <c:if test="${product.gender == 2}">selected</c:if>>Nữ
                                        </option>
                                        <option value="3" <c:if test="${product.gender == 3}">selected</c:if>>Trẻ em
                                        </option>
                                        <option value="4" <c:if test="${product.gender == 4}">selected</c:if>>Unisex
                                        </option>
                                    </select>

                                    <select name="categoryId"
                                            style="height: 40px;border: none;background-color: var(--sub-bg-color);margin-bottom: 20px;outline: none;border-radius: var(--main-border-radius);padding-left: 6px;">
                                        <c:forEach var="category" items="${categories}">
                                            <option value="${category.id}"
                                                    <c:if test="${category.id == product.categoryId}">selected</c:if>>${category.name}</option>
                                        </c:forEach>
                                    </select


                                </div>
                                <div class="admin-content-main-content-two-input">
                                    <input type="number" step="100.000" name="costPrice" placeholder="Giá nhập"
                                           value="${product.costPrice}">
                                    <input type="number" step="100.000" name="sellingPrice" placeholder="Giá bán"
                                           value="${product.sellingPrice}">
                                </div>

                                <textarea name="description"
                                          placeholder="Chi tiết sản phẩm">${product.description}</textarea>
                                <button class="main-btn" type="submit">Sửa sản phẩm</button>
                            </div>
                            <div class="admin-content-main-content-right">
                                <div class="admin-content-main-content-right-image">
                                    <label style="display: table; margin-bottom: 10px">Ảnh trước</label>

                                    <img src="../${image.path}" width="200px" height="200px">

                                </div>
                                <div class="admin-content-main-content-right-images" style="margin-top: 50px">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</section>
<script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
<script>
    CKEDITOR.replace('description');
</script>
<script type="module" src="asset/main.js"></script>
<script src="asset/js/app.js"></script>
</body>
</html>

