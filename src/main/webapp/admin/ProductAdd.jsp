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
    <c:set var="titleName" value="Thêm sản phẩm" scope="request"/>
    <c:import url="/admin/DashboardLink.jsp"/>
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
        <li><a href="ProductList" class="active"><i class="fa-solid fa-weight-hanging"></i>Sản phẩm</a></li>
        <li><a href="Category"><i class="fa-solid fa-clipboard-list"></i>Danh mục sản phẩm</a></li>
        <li><a href="Promotion"><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
        <li><a href="User"><i class="fa-solid fa-user"></i>Người dùng</a></li>
        <li><a href="Feedback"><i class="fa-solid fa-comment"></i>Phản hồi</a></li>

    </ul>
</div>


<div class="container">
    <jsp:include page="Header.jsp"/>
    <div class="content">
        <div class="container-fluid bg-light rounded border-secondary border-opacity-50">
            <div class="input-form p-3">
                <h3>Thông tin chung</h3>
                <div class="line"></div>

                <form id="addProductForm" enctype="multipart/form-data">
                    <div class="input-wrapper d-flex align-items-center mt-3">
                        <div class="label_input w-25">
                            <label>Danh mục:</label>
                        </div>
                        <select class="form-select w-50 " aria-label="Default select example" name="idCategory">
                            <option selected value="">Chọn danh mục</option>
                            <c:forEach var="ct" items="${categories}">
                                <option value="${ct.id}">${ct.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="line"></div>
                    <div class="input-wrapper d-flex align-items-center mt-3">
                        <div class="label_input w-25">
                            <label>Thương hiệu:</label>
                        </div>
                        <select class="form-select w-50" aria-label="Default select example" name="idBrand">
                            <option selected value="">Chọn thương hiệu</option>
                            <c:forEach var="br" items="${brands}">
                                <option value="${br.id}">${br.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="line"></div>

                    <div class="input-wrapper d-flex align-items-center mt-3">
                        <div class="label_input w-25">
                            <label>Hình dáng kính:</label>
                        </div>
                        <select class="form-select w-50" aria-label="Default select example" name="idFrame">
                            <option selected value="">Chọn hình dáng</option>
                            <c:forEach var="fs" items="${frameShapes}">
                                <option value="${fs.id}">${fs.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="line"></div>

                    <div class="input-wrapper d-flex align-items-center mt-3">
                        <div class="label_input w-25">
                            <label>Mã sản phẩm:</label>
                        </div>
                        <div class="input-group w-50">
                            <input type="text" class="form-control" placeholder="Mã sản phẩm" aria-label="Mã sản phẩm"
                                   name="productName">
                        </div>
                    </div>
                    <div class="line"></div>

                    <div class="input-wrapper d-flex align-items-center mt-3">
                        <div class="label_input w-25">
                            <label>Chất liệu:</label>
                        </div>
                        <div class="input-group w-50">
                            <input type="text" class="form-control" placeholder="Chất liệu" aria-label="Chất liệu"
                                   name="material">
                        </div>
                    </div>
                    <div class="line"></div>

                    <div class="input-wrapper d-flex align-items-center mt-3">
                        <div class="label_input w-25">
                            <label>Giới tính:</label>
                        </div>
                        <select class="form-select w-50" aria-label="Default select example" name="gender">
                            <option selected value="">Giới tính</option>
                            <option value="1">Nam</option>
                            <option value="2">Nữ</option>
                            <option value="3">Trẻ em</option>
                            <option value="4">Unisex</option>
                        </select>
                    </div>
                    <div class="line"></div>

                    <div class="input-wrapper d-flex align-items-center mt-3">
                        <div class="label_input w-25">
                            <label>Màu:</label>
                        </div>
                        <div class="input-group w-50">
                            <input type="text" class="form-control" placeholder="Màu" aria-label="Màu" name="color">
                        </div>
                    </div>
                    <div class="line"></div>

                    <div class="input-wrapper d-flex align-items-center mt-3">
                        <div class="label_input w-25">
                            <label>Giá nhập:</label>
                        </div>
                        <div class="input-group w-50">
                            <input id="gia-nhap" type="number" class="form-control" placeholder="Giá nhập"
                                   aria-label="Giá nhập" name="costPrice">
                        </div>
                        <span id="gia-nhap-hien-thi" class="align-content-center ms-5" style="color: red">0 VNĐ</span>
                    </div>
                    <div class="input-wrapper d-flex align-items-center mt-3">
                        <div class="label_input w-25">
                            <label>Giá bán:</label>
                        </div>
                        <div class="input-group w-50">
                            <input id="gia-ban" type="number" class="form-control" placeholder="Giá bán"
                                   aria-label="Giá bán" name="sellingPrice">
                        </div>
                        <span id="gia-ban-hien-thi" class="align-content-center ms-5" style="color: red">0 VNĐ</span>
                    </div>
                    <div class="line"></div>

                    <div class="input-wrapper d-flex align-items-center mt-3">
                        <div class="label_input w-25">
                            <label>Số lượng:</label>
                        </div>
                        <div class="input-group w-50">
                            <input type="number" class="form-control" placeholder="Số lượng" aria-label="Số lượng"
                                   name="quantity">
                        </div>
                    </div>
                    <div class="line"></div>

                    <div class="input-wrapper d-flex align-items-center mt-3">
                        <div class="label_input w-25">
                            <label>Mô tả:</label>
                        </div>
                        <div class="input-group w-50 form-floating">
                            <textarea class="form-control" placeholder="Mô tả sản phẩm" id="editor"
                                      name="description"></textarea>
                        </div>
                    </div>
                    <div class="line"></div>

                    <div class="input-wrapper d-flex align-items-center mt-3">
                        <div class="label_input w-25">
                            <label>Chọn ảnh <strong>chính</strong>:</label>
                        </div>
                        <div class="input-group w-50 d-grid">
                            <input type="file" id="file-input-main" accept="image/png, image/jpeg"
                                   onchange="previewMain()" name="mainImage">
                            <label for="file-input-main" class="btn btn-primary rounded w-50">
                                <i class="fa-solid fa-upload"></i> &nbsp; Chọn ảnh
                            </label>
                            <p id="chooseImage" class="text-center w-50 mt-3">Chưa chọn file ảnh</p>
                            <div id="image-main"></div>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="input-wrapper d-flex align-items-center mt-3">
                        <div class="label_input w-25">
                            <label>Chọn ảnh phụ:</label>
                        </div>
                        <div class="input-group w-50 d-grid">
                            <input type="file" id="file-input" accept="image/png, image/jpeg" onchange="preview()"
                                   multiple name="subImage">
                            <label for="file-input" class="btn btn-primary rounded w-50">
                                <i class="fa-solid fa-upload"></i> &nbsp; Chọn ảnh
                            </label>
                            <p id="num-of-file" class="text-center w-50 mt-3">Chưa chọn file ảnh</p>
                            <div id="images"></div>
                        </div>
                    </div>
                    <div class="line"></div>

                    <div class="input-wrapper d-flex align-items-center mt-3">
                        <div class="label_input w-25">
                            <label>Tùy chỉnh:</label>
                        </div>
                        <div class="input-group w-50">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="checkDisplayProduct">
                                <label class="form-check-label" for="checkDisplayProduct">
                                    Hiển thị
                                </label>
                            </div>

                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="input-wrapper d-flex align-items-center mt-3">
                        <div class="label_input w-25">
                            <label></label>
                        </div>
                        <div class="input-group w-50">
                            <button type="submit" class="btn btn-primary me-3 rounded">Thêm sản phẩm</button>
                            <button class="btn btn-primary rounded">Thoát</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<c:import url="/admin/DashboardScript.jsp"/>

<script>
    let editorInstance;
    ClassicEditor.create(document.querySelector('#editor'))
        .then(editor => {
            editorInstance = editor
        })
        .catch(error => {
        console.error(error);
    });

    document.getElementById(`addProductForm`).addEventListener('submit', function (e) {
        e.preventDefault();

        const plainDescription = editorInstance.editing.view.document.getRoot().getChild(0).getChild(0).data;
        const formData = new FormData(this);

        formData.set('description', plainDescription);

        fetch('ProductAdd', {
            method: 'POST',
            body: formData
        })
            .then(res => res.json())
            .then(data => {
            if (data.success) {
                Swal.fire({
                    title: "Thêm sản phẩm thành công",
                    text: data.message,
                    icon: 'success',
                    draggable: true
                });
                // this.reset();
                // editorInstance.setData('');
            } else {
                Swal.fire("Lỗi", data.message, 'error')
            }
        })
            .catch(err => {
                Swal.fire('Lỗi!', 'Đã xảy ra lỗi khi gửi yêu cầu.', 'error');
                console.error(err);
            });
    })
</script>

</body>
</html>
