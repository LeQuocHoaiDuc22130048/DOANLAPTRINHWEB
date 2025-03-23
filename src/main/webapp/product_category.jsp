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
    <title>${category.name}</title>
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

    <!-- ***** Header Area Start ***** -->
    <jsp:include page="header.jsp"/>
    <!-- ***** Header Area End ***** -->

    <div class="shop-page-title category-page-title featured-title page-title">
        <div class="page-title-inner flex-row container medium-flex-wrap flex-has-center">
            <div class="flex-col flex-center text-center">
                <div class="is-large">
                    <nav class="woocommerce-breadcrumb breadcrumbs">
                        <a href="index">Trang Chủ</a>
                        <span class="divider">/</span>
                        ${selectedItem.name}
                    </nav>
                </div>
            </div>
        </div>
    </div>

    <!-- ***** Main Banner Area Start ***** -->
    <main id="main">
        <div class="shop-container">
            <div class="archive-product-wrap">
                <div class="container-banner-product">
                    <h1 style="text-align: center">
                        <strong>
                  <span>
                      ${selectedItem.title}
                  </span>
                        </strong>
                    </h1>
                    <p>
                        <img
                                src="${selectedItem.img}"
                                alt="Hình ${selectedItem.name}"
                        />
                    </p>
                    <div class="text hide-for-small">
                        <p class="caption-top">
                            <em>
                                ${selectedItem.description}
                            </em>
                        </p>
                    </div>

                    <c:if test="${isCategory && selectedItem.items.size()>0}">
                        <div class="shop-container section-title-container">
                            <h3 class="section-title section-title-center">
                                <b></b>
                                <span class="section-title-main">Đối tượng</span>
                                <b></b>
                            </h3>
                        </div>

                        <table style="width: 100%; border-collapse: collapse">
                            <tbody>
                            <tr style="height: 95px">
                                <c:forEach var="sub" items="${selectedItem.items}" varStatus="status">
                                <td style="width: 33.3%; height: 95px; text-align: center">
                                    <a title="${sub.name}" href="product-category?categoryId=${sub.id}">
                                        <img src="${sub.img}" alt="" width="340" height="210"/>
                                    </a>
                                </td>

                                <!-- Nếu đã hiển thị 3 phần tử, thì xuống dòng -->
                                <c:if test="${status.index == 2 && selectedItem.items.size() > 3}">
                            </tr>
                            <tr style="height: 95px">
                                <td colspan="3"
                                    style="text-align: center">
                                    <h3 class="section-title section-title-center">
                                        <b></b>
                                        <span class="section-title-main">Loại gọng</span>
                                        <b></b>
                                    </h3>
                                </td>
                            </tr>
                            <tr style="height: 95px">
                                </c:if>
                                </c:forEach>
                            </tr>
                            </tbody>
                        </table>
                    </c:if>

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
                    <div class="productfilter-wc productfilter-woocommerce">
                            <div class="productfilter_filter_wrapper productfilter_columns_3">
                                <div class="product-filter-inner">
                                    <div class="productfilter_filter_wrapper productfilter_columns_3">
                                        <div class="product-filter-inner">
                                            <div class="dropup-center dropup">
                                                <button class="bg-transparent py-2 px-2 rounded m-2 dropdown-toggle dropdown_btn"
                                                        type="button"
                                                        data-bs-toggle="dropdown" aria-expanded="false">
                                                    Thương hiệu
                                                </button>
                                                <div class="dropdown-menu container-fluid shadow ms-2" style="width: 800px">
                                                    <div class="row row-cols-5 w-auto mx-2">
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
                                                <div class="dropdown-menu container-fluid shadow" style="width: 500px">
                                                    <div class="row row-cols-5 w-auto mx-2">
                                                        <div class="col p-1">
                                                            <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                                               href="${pageContext.request.contextPath}/filter?min=0&max=1000"> 0 -
                                                                1Tr
                                                            </a>
                                                        </div>
                                                        <div class="col p-1"><a
                                                                class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                                                href="${pageContext.request.contextPath}/filter?min=1000&max=2000">
                                                            1 - 2Tr
                                                        </a></div>
                                                        <div class="col p-1">
                                                            <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                                               href="${pageContext.request.contextPath}/filter?min=2000&max=4000"> 2
                                                                - 4Tr
                                                            </a>
                                                        </div>
                                                        <div class="col p-1">
                                                            <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                                               href="${pageContext.request.contextPath}/filter?min=4000&max=10000">
                                                                4 - 10Tr
                                                            </a>
                                                        </div>
                                                        <div class="col p-1">
                                                            <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                                               href="${pageContext.request.contextPath}/filter?min=10000&max=20000">
                                                                10 - 20Tr
                                                            </a>
                                                        </div>
                                                        <div class="col p-1">
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
                                </div>
                            </div>
                    </div>
                    <div class="product-list-container">
                        <div class="row page show-list" id="productContainer">
                            <c:forEach var="product" items="${products}">
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
                                            <img src="${product.img}" alt="${product.productName}" class="product-image"
                                                 style="width: 100%;">
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
                    <!-- Phân trang -->
                    <div class="pagination">
                        <c:if test="${currentPage > 1}">
                            <div class="page-number">
                                <a href="?page=${currentPage - 1}
                &material=${param.material}
                &gender=${param.gender}
                &color=${param.color}
                &shape=${param.shape}
                &brand=${param.brand}
                &category=${param.category}
                &price=${param.price}">&lt;</a> <!-- Nút quay lại -->
                            </div>
                        </c:if>
                        <c:if test="${currentPage < totalPages}">
                            <div class="page-number">
                                <a href="?page=${currentPage + 1}
                &material=${param.material}
                &gender=${param.gender}
                &color=${param.color}
                &shape=${param.shape}
                &brand=${param.brand}
                &category=${param.category}
                &price=${param.price}">&gt;</a> <!-- Nút tiếp theo -->
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- ***** Main Banner Area End ***** -->

    <!-- ***** Product Area Starts ***** -->

    <!-- ***** Product Area Ends ***** -->

    <!-- ***** Footer Start ***** -->
    <jsp:include page="footer.jsp"/>
    <!-- ***** Footer End ***** -->
</div>
<c:import url="script.jsp"/>

</body>
</html>
