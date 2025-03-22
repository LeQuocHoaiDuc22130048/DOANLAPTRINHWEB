<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="availableData" class="vn.edu.hcmuaf.fit.doanweb.Util.AvailableData" scope="page"/>
<c:set var="brands" value="${availableData.getBrands('BRANDS')}"/>
<c:set var="shapes" value="${availableData.getShapes('SHAPES')}"/>
<c:set var="materials" value="${availableData.getMaterials('MATERIALS')}"/>
<c:set var="colors" value="${availableData.getColors('COLORS')}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Kính mát</title>
    <c:import url="link.jsp"/>
</head>
<body>
<div class="wrapper">
    <!-- preloader start -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <!-- preloader end -->
    <jsp:include page="header.jsp"/>
    <main id="main absolute_center">
        <div class="container-fluid">
            <div class="archive-product-wrap">
                <div class="absolute_center flex-column mt-100">
                    <img src="assets/images/kinh-mat-thoi-trang-chinh-hang-100.jpg" alt="Banner kính mát "/>
                    <div class="absolute_center mx-2 my-5">
                        <p class="w-100 px-5">
                            Qua nhiều thập kỷ, kính mát vẫn là phụ kiện thời trang được
                            ưa chuộng. Sự chung sức của các thương hiệu xa xỉ hàng đầu
                            như RayBan, Gucci, Dior,…đã góp phần làm đầy thị trường kính
                            râm bằng vô vàn kiểu dáng hot trend, xịn, ngầu và có nhiều
                            tính năng vượt trội, chinh phục thành công không ít các tín
                            đồ. Tất cả đã mở ra thế giới sắc màu cho kính mắt hàng hiệu,
                            không chỉ nâng tầm phong cách mà còn mang đến khả năng bảo
                            vệ mắt tối ưu.
                        </p>
                    </div>
                    <div class="absolute_center">
                        <h3 class="m-2">
                            Đối tượng
                        </h3>
                    </div>
                    <table class="w-100">
                        <tbody>
                        <tr>
                            <td>
                                <a title="Gọng mát nữ" href="kinh_mat_nu.html">
                                    <img
                                            src="assets/images/bst-kinh-mat-nu-thoi-trang.jpg"
                                            alt=""
                                            class="img-thumbnail border border-0"
                                    />
                                </a>
                            </td>

                            <td>
                                <a title="Gọng mát nam" href="kinh_mat_nam.html">
                                    <img
                                            src="assets/images/bst-kinh-mat-nam-thoi-trang.jpg"
                                            alt=""
                                            class="img-thumbnail border border-0"
                                    />
                                </a>
                            </td>

                            <td>
                                <a title="Gọng mát trẻ em" href="kinh_mat_tre_em.html">
                                    <img
                                            src="assets/images/bst-kinh-mat-tre-em-thoi-trang.jpg"
                                            alt=""
                                            class="img-thumbnail border border-0"
                                    />
                                </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <p class="tag-in-category">
                        <strong>Tìm kiếm nhiều:</strong>
                        <br/>
                        <a href="" title="Mắt kính chính hãng">Gọng kính chính hãng</a>
                        <a href="" title="Gọng kính cận thể thao">Gọng thể thao</a>
                        <a href="" title="Gọng kính giá rẻ">Gọng giá rẻ</a>
                        <a href="" title="Gọng kính cận màu đen">Gọng màu đen</a>
                        <a href="" title="Gọng kính cận màu trắng">Gọng màu trắng</a>
                        <a href="" title="Gọng kính cận màu nâu">Gọng màu nâu</a>
                        <a href="" title="Gọng kính cận màu hồng">Gọng màu hồng</a>
                        <a href="" title="Gọng kính cận màu vàng">Gọng màu vàng</a>
                    </p>

                    <p class="tag-in-category">
                        <strong>Có thể bạn thích:</strong>
                        <br/>
                        <a href="" title="Gọng kính Cartier">Cartier</a>
                        <a href="" title="Gọng kính Montblanc">Montblanc</a>
                        <a href="" title="Gọng kính Bolon">Bolon</a>
                        <a href="" title="Gọng kính Chopard">Chopard</a>
                        <a href="" title="Gọng kính Furla">Furla</a>
                        <a href="" title="Gọng kính Exfash">Exfash</a>
                        <a href="" title="Gọng kính Parim">Parim</a>
                        <a href="" title="Gọng kính EyesCloud">EyesCloud</a>
                        <a href="" title="Gọng kính Molsion">Molsion</a>
                        <a href="" title="Gọng kính Gucci">Gọng Gucci</a>
                        <a href="" title="Gọng kính Burberry">Gọng Burberry</a>
                        <a href="" title="Gọng kính Versace">Gọng Versace</a>
                        <a href="" title="Gọng kính RayBan">Gọng RayBan</a>
                        <a href="" title="Gọng kính Oakley">Gọng Oakley</a>
                        <a href="" title="Gọng kính Dior">Gọng Dior</a>
                        <a href="" title="Gọng kính Police">Gọng Police</a>
                    </p>
                    <div class="container">
                        <div class="productfilter_filter_wrapper productfilter_columns_3">
                            <div class="product-filter-inner">
                                <div class="dropup-center dropup">
                                    <button class="bg-transparent py-2 px-2 rounded m-2 dropdown-toggle dropdown_btn"
                                            type="button"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        Thương hiệu
                                    </button>
                                    <div class="dropdown-menu container-fluid shadow ms-2" style="width: 800px">
                                        <div class="row row-cols-5 w-auto ms-2">
                                            <c:forEach var="brand" items="${brands}">
                                                <div class="col">
                                                    <a class="dropdown_item_link px-2 py-2 m-2 text-center text-nowrap"
                                                       href="filter?type=brand_id&value=${brand.id}"> ${brand.name}
                                                    </a>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="dropup-center dropup">
                                    <label><input class="d-none" checked type="text" name="type" value="brand_id"/></label>
                                    <button class="bg-transparent py-2 px-2 rounded m-2 dropdown-toggle dropdown_btn"
                                            type="button" data-bs-toggle="dropdown" aria-expanded="false">Giới tính
                                    </button>
                                    <div class="dropdown-menu container-fluid shadow " style="width: 500px">
                                        <div class="row row-cols-4 w-auto ms-2">
                                            <div class="col">
                                                <a class="dropdown_item_link px-2 py-2 text-center text-nowrap" href="filter?type=gender&value=1">
                                                    <img class="img-thumbnail" src="assets/images/icon-nam .jpg" alt=""/>
                                                </a>
                                            </div>
                                            <div class="col">
                                                <a class="dropdown_item_link px-2 py-2 text-center text-nowrap" href="filter?type=gender&value=2">
                                                    <img class="img-thumbnail" src="assets/images/icon-nu .jpg" alt=""/>
                                                </a>
                                            </div>
                                            <div class="col">
                                                <a class="dropdown_item_link px-2 py-2 text-center text-nowrap" href="filter?type=gender&value=3">
                                                    <img class="img-thumbnail" src="assets/images/icon-tre-em.jpg" alt=""/>
                                                </a>
                                            </div>
                                            <div class="col">
                                                <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                                   href="filter?type=gender&value=4"><img class="img-thumbnail"
                                                                        src="assets/images/icon-unisex .jpg"
                                                                        alt=""/> </a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="dropup-center dropup">
                                    <label><input class="d-none" checked type="text" name="type"
                                                  value="brand_id"/></label>
                                    <button class="bg-transparent py-2 px-2 rounded m-2 dropdown-toggle dropdown_btn"
                                            type="button"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        Kiểu dáng
                                    </button>
                                    <div class="dropdown-menu container-fluid shadow " style="width: 500px">
                                        <div class="row row-cols-4 w-auto ms-2">
                                            <c:forEach var="shape" items="${shapes}">
                                                <div class="col">
                                                    <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                                       href="filter?type=shape_id&value=${shape.id}">
                                                        <img class="img-thumbnail" src="${shape.imgPath}" alt=""/>
                                                    </a>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="dropup-center dropup">
                                    <label><input class="d-none" checked type="text" name="type"
                                                  value="brand_id"/></label>
                                    <button class="bg-transparent py-2 px-2 rounded m-2 dropdown-toggle dropdown_btn"
                                            type="button"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        Chất liệu
                                    </button>
                                    <div class="dropdown-menu container-fluid shadow " style="width: 500px">
                                        <div class="row row-cols-4 w-auto ms-2">
                                            <c:forEach var="material" items="${materials}">
                                                <div class="col">
                                                    <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                                       href="filter?type=material&value=${material.name}">
                                                        <img class="img-thumbnail" src="${material.path}" alt=""/>
                                                    </a>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="dropup-center dropup">
                                    <label><input class="d-none" checked type="text" name="type"
                                                  value="brand_id"/></label>
                                    <button class="bg-transparent py-2 px-2 rounded m-2 dropdown-toggle dropdown_btn"
                                            type="button"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        Color
                                    </button>
                                    <div class="dropdown-menu container-fluid shadow " style="width: 500px">
                                        <div class="row row-cols-5 w-auto ms-2">
                                            <c:forEach var="color" items="${colors}">
                                                <div class="col">
                                                    <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                                       href="filter?type=color&value=${color.name}"><img class="img-thumbnail"
                                                                                        src="${color.path}" alt=""/>
                                                    </a>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="dropup-center dropup">
                                    <label><input class="d-none" checked type="text" name="type"
                                                  value="brand_id"/></label>
                                    <button class="bg-transparent py-2 px-2 rounded m-2 dropdown-toggle dropdown_btn"
                                            type="button"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        Mức giá
                                    </button>
                                    <div class="dropdown-menu container-fluid shadow " style="width: 500px">
                                        <div class="row row-cols-5 w-auto ms-2">
                                            <div class="col">
                                                <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                                   href="${pageContext.request.contextPath}/filter?min=0&max=1000"> 0 -
                                                    1Tr
                                                </a>
                                            </div>

                                            <div class="col"><a
                                                    class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                                    href="${pageContext.request.contextPath}/filter?min=1000&max=2000">
                                                1 - 2Tr
                                            </a></div>
                                            <div class="col">
                                                <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                                   href="${pageContext.request.contextPath}/filter?min=2000&max=4000"> 2
                                                    - 4Tr
                                                </a>
                                            </div>
                                            <div class="col">
                                                <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                                   href="${pageContext.request.contextPath}/filter?min=4000&max=10000">
                                                    4 - 10Tr
                                                </a>
                                            </div>
                                            <div class="col">
                                                <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                                   href="${pageContext.request.contextPath}/filter?min=10000&max=20000">
                                                    10 - 20Tr
                                                </a>
                                            </div>
                                            <div class="col">
                                                <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                                   href="${pageContext.request.contextPath}/filter?min=20000&max=999999">
                                                    trên 20Tr
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="product-list-container w-100 p-2">
                            <div class="row page show-list" id="productContainer">
                                <c:forEach var="product" items="${requestScope.product_list}">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="product-item">
                                            <!-- Phần hình ảnh sản phẩm -->
                                            <div class="thumb">
                                                <div class="hover-content">
                                                    <ul>
                                                        <!-- Xem chi tiết -->
                                                        <li>
                                                            <a href="#"><i class="fa fa-eye"></i></a>
                                                        </li>
                                                        <!-- Đánh giá -->
                                                        <li>
                                                            <a href="#" class="rate-product"><i class="fa fa-star"></i></a>
                                                        </li>
                                                        <!-- Thêm vào giỏ hàng -->
                                                        <li>
                                                            <a href="#" class="btn_gio_hang"><i
                                                                    class="fa fa-shopping-cart"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <img src="${product.path}" alt="${product.name}"
                                                     class="product-image w-100">
                                            </div>

                                            <!-- Thông tin sản phẩm -->
                                            <div class="product-info">
                                                <h4 class="product-name">${product.productName}</h4>
                                                <span class="product-price">
                                            <fmt:formatNumber value="${product.price}" type="currency"
                                                              currencySymbol="VND" minFractionDigits="0"/>
                                             </span>
                                                <ul class="stars">
                                                    <!-- Hiển thị 5 ngôi sao mặc định -->
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
<%--                    Pagination--%>
                        </div>
                    </div>
                </div>
            </div>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
<c:import url="script.jsp"/>
</body>
</html>
