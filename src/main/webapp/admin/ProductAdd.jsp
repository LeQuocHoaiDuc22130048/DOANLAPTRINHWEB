<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 1/11/2025
  Time: 9:40 PM
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
            <jsp:include page="SidebarTop.jsp"/>
            <div class="admin-content main">
                <div class="admin-content-main-title">
                    <h1>Thêm sản phẩm</h1>
                </div>
                <form action="ProductAdd" method="post" enctype="multipart/form-data">
                    <div class="admin-content-main-content">
                        <div class="admin-content-main-content-product-add">
                            <div class="admin-content-main-content-left">
                                <div class="admin-content-main-content-two-input">

                                    <input type="text" placeholder="Tên sản phẩm " name="name">
                                    <input type="text" placeholder="Màu" name="color">
                                    <input type="text" placeholder="Chất liệu" name="material">
                                    <input type="text" placeholder="Số lượng" name="quantity">
                                    <select name="brand_id"
                                            style="height: 40px;border: none;background-color: var(--sub-bg-color);margin-bottom: 20px;outline: none;border-radius: var(--main-border-radius);padding-left: 6px;"> <%-- Lấy các thương hiệu từ cơ sở dữ liệu --%>
                                        <c:forEach var="brand" items="${brands}">
                                            <option value="${brand.id}">${brand.name}</option>
                                        </c:forEach>
                                    </select>

                                    <select name="shape_id"
                                            style="height: 40px;border: none;background-color: var(--sub-bg-color);margin-bottom: 20px;outline: none;border-radius: var(--main-border-radius);padding-left: 6px;">
                                        <c:forEach var="shape" items="${frameShapes}">
                                            <option value="${shape.id}">${shape.name}</option>
                                        </c:forEach>
                                    </select>

                                    <select name="gender"
                                            style="height: 40px;border: none;background-color: var(--sub-bg-color);margin-bottom: 20px;outline: none;border-radius: var(--main-border-radius);padding-left: 6px;">
                                        <option value="1">Nam</option>
                                        <option value="2">Nữ</option>
                                        <option value="3">Trẻ em</option>
                                        <option value="4">Unisex</option>
                                    </select>

                                    <select name="category_id"
                                            style="height: 40px;border: none;background-color: var(--sub-bg-color);margin-bottom: 20px;outline: none;border-radius: var(--main-border-radius);padding-left: 6px;">
                                        <c:forEach var="category" items="${categories}">
                                            <option value="${category.id}">${category.name}</option>
                                        </c:forEach>
                                    </select


                                </div>
                                <div class="admin-content-main-content-two-input">
                                    <input type="number" step="100.000" name="costPrice" placeholder="Giá nhập">
                                    <input type="number" step="100.000" name="sellingPrice" placeholder="Giá bán">
                                </div>

                                <textarea name="description" placeholder="Chi tiết sản phẩm"></textarea>
                                <button class="main-btn" type="submit">Thêm sản phẩm</button>
                            </div>
                            <div class="admin-content-main-content-right">
                                <div class="admin-content-main-content-right-image">
                                    <label>Ảnh chính</label>
                                    <input name="file1" type="file"
                                           style="display: block;height: 40px;border: none;background-color: var(--sub-bg-color);margin-bottom: 20px;outline: none;border-radius: var(--main-border-radius);padding-left: 6px; align-content: center">
                                </div>
                                <div class="admin-content-main-content-right-images" style="margin-top: 50px">
                                    <label>Ảnh phụ</label>
                                    <input name="file2" type="file"
                                           style="display: block; height: 40px;border: none;background-color: var(--sub-bg-color);margin-bottom: 20px;outline: none;border-radius: var(--main-border-radius);padding-left: 6px; align-content: center ">
                                    <input name="file3" type="file"
                                           style="display: block; height: 40px;border: none;background-color: var(--sub-bg-color);margin-bottom: 20px;outline: none;border-radius: var(--main-border-radius);padding-left: 6px; align-content: center">
                                    <input name="file4" type="file"
                                           style="display: block; height: 40px;border: none;background-color: var(--sub-bg-color);margin-bottom: 20px;outline: none;border-radius: var(--main-border-radius);padding-left: 6px; align-content: center">
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
