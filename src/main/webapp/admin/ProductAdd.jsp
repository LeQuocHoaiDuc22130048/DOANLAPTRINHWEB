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
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <c:import url="DashboardLink.jsp"/>
    <c:set var="titleName" value="Thêm sản phẩm" scope="request"/>
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
        <li><a href="AdminProductList" class="active"><i class="fa-solid fa-weight-hanging"></i>Sản phẩm</a></li>
        <li><a href="Product-category"><i class="fa-solid fa-clipboard-list"></i>Danh mục sản phẩm</a></li>
        <li><a href="Promotion"><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
        <li><a href="User"><i class="fa-solid fa-user"></i>Người dùng</a></li>
        <li><a href="Feedback"><i class="fa-solid fa-comment"></i>Phản hồi</a></li>

    </ul>
</div>

<div class="container">
    <jsp:include page="Header.jsp"/>

    <div class="content position-relative ">
        <div class="">
            <form
                    action="${pageContext.request.contextPath}/admin/ProductAdd"
                    class="form_add_product p-5 "
                    method="post"
                    enctype="multipart/form-data"
            >
                <div class="form-group pt-4">
                    <label for="idpr">Mã sản phẩm:</label>
                    <input type="text" class="form-control" id="idpr" name = "id">
                </div>
                <div class="form-group mt-3">
                    <label for="nmpr">Tên sản phẩm</label>
                    <input type="password" class="form-control" id="nmpr" name = "name">
                </div>
                <div class="form-group mt-3">
                    <label>Thương hiệu</label>
                    <select class="form-select" aria-label="Default select example" name="brand">
                        <option selected>Chọn thương hiệu</option>
                        <c:forEach items="${brandList}" var="bl">
                            <option value="${bl.id}">${bl.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group mt-3">
                    <label>Kiểu dáng</label>
                    <select class="form-select" aria-label="Default select example" name = "fShape">
                        <option selected>Chọn kiểu dáng</option>
                        <c:forEach items="${frameShapesList}" var="fs">
                            <option value="${fs.id}">${fs.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group mt-3">
                    <label >Giới tính</label>
                    <select class="form-select" aria-label="Default select example" name = "gender">
                        <option selected>Chọn giới tính</option>
                        <option value="1">Nam</option>
                        <option value="2">Nữ</option>
                        <option value="3">Trẻ em</option>
                        <option value="4">Unisex</option>
                    </select>
                </div>
                <div class="form-group mt-3">
                    <label >Chất liệu</label>
                    <input type="text" placeholder="Chất liệu" class="form-control" name = "material" required>
                </div>

                <div class="form-group mt-3">
                    <label >Màu</label>
                    <input type="text" placeholder="Nhập màu" class="form-control" name = "color" required>
                </div>

                <div class="form-group mt-3">
                    <label>Danh mục</label>
                    <select class="form-select" aria-label="Default select example" name = "category" required>
                        <option selected>Chọn danh mục</option>
                        <c:forEach items="${categoryList}" var="cL">
                            <option value="${cL.id}">${cL.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <label class="d-block mt-3">Nhập giá</label>
                <div class="input_price  d-flex justify-content-between">
                    <input type="number" placeholder="Giá nhập" class="form-control" name = "costPrice" required>
                    <input type="number" placeholder="Giá bán" class="form-control ms-5" name = "sellingPrice" required>
                </div>

                <div class="form-floating mt-3">
                    <textarea class="form-control" placeholder="Chi tiết sản phẩm" name="editor" id="editor" style="height: 200px"></textarea>
                </div>

                <div class="form-group mt-3 d-flex">
                    <div class="me-5">
                        <label>Chọn ảnh <strong>chính</strong></label>
                        <input type="file" class="form-control" id="inputGroupFile01" name="mainImg">
                    </div>
                    <div class="me-5">
                        <label>Chọn ảnh <strong>phụ</strong></label>
                        <input type="file" class="form-control" id="inputGroupFile02" name="img1">
                    </div>
                    <div class="me-5">
                        <label>Chọn ảnh <strong>phụ</strong></label>
                        <input type="file" class="form-control" id="inputGroupFile03" name = "img2">
                    </div>
                    <div>
                        <label>Chọn ảnh <strong>phụ</strong></label>
                        <input type="file" class="form-control" id="inputGroupFile04" name="img3">
                    </div>
                </div>
                <div class="mt-3 float-end ">
                    <button  type="submit" class="btn btn-primary">Thêm sản phẩm</button>
                </div>
            </form>
        </div>

    </div>
</div>

<script src="./asset/js/Chart.js"></script>

<c:import url="DashboardScript.jsp"/>
<script src="./asset/js/Chart.js"></script>
<script src = ./asset/js/Notification.js></script>
</body>
</html>
