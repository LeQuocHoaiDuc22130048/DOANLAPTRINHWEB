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
                <div class="admin-content-main-content">
                    <div class="admin-content-main-content-product-add">
                        <div class="admin-content-main-content-left">
                            <div class="admin-content-main-content-two-input">
                                <input type="text" placeholder="Mã sản phẩm ">
                                <input type="text" placeholder="Tên sản phẩm ">
                                <input type="text" placeholder="Thương hiệu " id="brand">
                                <input type="hidden" id="brandId" name ="brandId">
                                <input type="text" placeholder=" Kiểu dáng " id="shape">
                                <input type="hidden" id="shapeId" name ="shapeId">
                                <input type="text" placeholder="Giới tính" id="gender">
                                <input type="hidden" id="genderId" name ="genderId">
                                <input type="text" placeholder="Chất liệu">
                                <input type="text" placeholder="Màu">
                                <input type="text" placeholder="Danh mục" id="category">
                                <input type="hidden" id="categoryId" name ="categoryId">
                            </div>
                            <div class="admin-content-main-content-two-input">
                                <input type="text" placeholder="Giá nhập">
                                <input type="text" placeholder="Giá bán">
                            </div>

                            <textarea name="editor" id="editor">Chi tiết sản phẩm</textarea>
                            <button class="main-btn">Thêm sản phẩm</button>
                        </div>
                        <div class="admin-content-main-content-right">
                            <div class="admin-content-main-content-right-image">
                                <label for="file">Ảnh chính</label>
                                <input id="file" type="file">
                                <div class="image-show"></div>
                            </div>
                            <div class="admin-content-main-content-right-images">
                                <label for="file">Ảnh phụ</label>
                                <input type="file">
                                <div class="images-show"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>

<script type="importmap">
    {
        "imports": {
            "ckeditor5": "https://cdn.ckeditor.com/ckeditor5/43.3.1/ckeditor5.js",
            "ckeditor5/": "https://cdn.ckeditor.com/ckeditor5/43.3.1/"
        }
    }
</script>
<script type="module" src="asset/main.js"></script>
<script src="asset/js/app.js"></script>
</body>

<script>
    $(document).ready(function () {
        function loadSuggestions(inputId, type) {
            $('#' + inputId).autocomplete({
                source : function (request, response){
                    $ajax({
                        url : "getSuggestions",
                        method : "GET",
                        data : {type: type, term: request.term},
                        success : function (data){
                            var suggestions = JSON.parse(data);
                            response($.map(suggestions, function (item){
                                return {label : item.name, value : item.id};
                            }));
                        }
                    });
                },
                select : function (event, ui){
                    $('#' + inputId).val(ui.item.label);
                    $('#' + inputId + 'Id').val(ui.item.value);
                    return false;
                }
            });
        }
        loadSuggestions('brand', 'brands');
        loadSuggestions('shape', 'frame_shapes');
        loadSuggestions('gender', 'genders');
        loadSuggestions('category', 'categories');
    })
</script>
</html>
