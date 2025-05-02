<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Chi Tiết Sản Phẩm</title>
    <c:import url="Link.jsp"/>
</head>
<body>
<!-- preloader start -->

<div class="wrapper">
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <!-- preloader end -->

    <!-- ***** Header Area Start ***** -->
    <jsp:include page="Header.jsp"/>

    <!-- ***** Header Area End ***** -->

    <div class="shop-page-title category-page-title featured-title page-title">
        <div class="page-title-inner flex-row container medium-flex-wrap flex-has-center">
            <div class="flex-col flex-center text-center">
                <div class="is-large">
                    <nav class="woocommerce-breadcrumb breadcrumbs">
                        <a href="index">Trang Chủ</a>
                        <span class="divider">/</span>
                        Kính
                        <span class="divider">/</span>
                        ${requestScope.brand.name}
                    </nav>
                </div>
            </div>
        </div>
    </div>

    <main id="main">
        <div class="shop-container">
            <div class="row" id="row-617919374">
                <div id="col-left" class="col medium-6 small-12 large-6">
                    <div class="col-inner">
                        <div class="slider-container">
                            <div class="slider">
                                <img
                                        src="${requestScope.product.path_image}"
                                        alt=""
                                        width="510px"
                                        height="510px"
                                />
                                <img
                                        src="${requestScope.images[1].path}"
                                        alt=""
                                        width="510px"
                                        height="510px"
                                />
                                <img
                                        src="${requestScope.images[2].path}"
                                        alt=""
                                        width="510px"
                                        height="510px"
                                />
                                <img
                                        src="${requestScope.images[0].path}"
                                        alt=""
                                        width="510px"
                                        height="510px"
                                />
                            </div>
                        </div>
                        <div class="arrow-left-right">
                            <i class="fa-thin fa-angles-left fa"></i>
                            <i class="fa-thin fa-angles-right fa"></i>
                        </div>
                    </div>
                    <div class="more-images">
                        <div class="col-4-images">
                            <img src="${requestScope.product.path_image}" alt=""/>
                        </div>
                        <div class="col-4-images">
                            <img src="${requestScope.images[1].path}" alt=""/>
                        </div>
                        <div class="col-4-images">
                            <img src="${requestScope.images[2].path}" alt=""/>
                        </div>
                        <div class="col-4-images">
                            <img src="${requestScope.images[0].path}" alt=""/>
                        </div>
                    </div>
                </div>
                <div id="col-right" class="col product-page medium-6 small-12 large-6">
                    <div class="col-inner">
                        <div class="thuong-hieu brand">
                            <a href="#" class="brand-ref"
                            ><img src="${requestScope.brand.icon}" alt="${requestScope.brand.name}"
                            /></a>
                        </div>
                        <div class="product-title-container">
                            <h1 class="product-title product_title entry-title">
                                ${requestScope.product.name}
                                ${requestScope.product.description}
                            </h1>
                        </div>
                        <div class="product-price-container is-xxlarge">
                            <div class="price-wrapper">
                                <p class="price product-page-price">
                      <span class="woocommerce-Price-amount amount">
                        <f:formatNumber value="${requestScope.product.sellingPrice}"/>
                        <span class="woocommerce-Price-currencySymbol">đ</span>
                      </span>
                                </p>
                            </div>
                        </div>

                        <form class="addCartForm">
                            <div class="quantity button-added">
                                <input type="button" value="-" class="minus"/>
                                <input
                                        type="number"
                                        step="1"
                                        min="1"
                                        max=""
                                        name="quantity"
                                        value="1"
                                        title=""
                                        class="input-text qty text"
                                        size="4"
                                        pattern=""
                                        inputmode=""
                                />
                                <input type="button" value="+" class="plus"/>
                            </div>
                            <div class="add-to-cart-container form-normal is-large">
                                <input type="hidden" name="id" value="${requestScope.product.id}"/>
                                <button id="add-to-cart" class="single_add_to_cart_button button alt">
                                    Thêm vào giỏ hàng
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="is-divider divider"></div>
            <div class="row align-middle-align-center tab-button" id="row-1581544597">
                <div class="col hide-for-small small-12 large-12">
                    <div class="col-inner text-left">
                        <div class="row list-tab-icon-title">
                            <div class="col medium-3 small-6 large-3">
                                <div class="col-inner">
                                    <div class="icon-box featured-box tab-title-icon icon-box-left text-left">
                                        <div class="icon-box-img">
                                            <div class="icon">
                                                <div class="icon-inner">
                                                    <img src="assets/images/Website/doiTra.jpg" alt=""/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="icon-box-text last-reset">
                                            <div class="ly-do-mua">
                                                Bảo hành 6 tháng
                                                <br/>
                                                Duy nhất tại Việt Nam
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col hide-for-small small-12 large-12">
                    <div class="col-inner text-left">
                        <div class="row list-tab-icon-title">
                            <div class="col medium-3 small-6 large-3">
                                <div class="col-inner">
                                    <div
                                            class="icon-box featured-box tab-title-icon icon-box-left text-left"
                                    >
                                        <div class="icon-box-img">
                                            <div class="icon">
                                                <div class="icon-inner">
                                                    <img src="assets/images/Website/camket.jpg" alt=""/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="icon-box-text last-reset">
                                            <div class="ly-do-mua">
                                                Cam kết sản phẩm chính hãng
                                                <br/>
                                                Đền gấp 10 lần
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col hide-for-small small-12 large-12">
                    <div class="col-inner text-left">
                        <div class="row list-tab-icon-title">
                            <div class="col medium-3 small-6 large-3">
                                <div class="col-inner">
                                    <div
                                            class="icon-box featured-box tab-title-icon icon-box-left text-left"
                                    >
                                        <div class="icon-box-img">
                                            <div class="icon">
                                                <div class="icon-inner">
                                                    <img src="assets/images/Website/quytrinh.jpg" alt=""/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="icon-box-text last-reset">
                                            <div class="ly-do-mua">
                                                Quy trình đo mắt chuẩn Quốc Tế
                                                <br/>
                                                Thời gian đo tối thiểu 20 phút
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col hide-for-small small-12 large-12">
                    <div class="col-inner text-left">
                        <div class="row list-tab-icon-title">
                            <div id="col-375462666" class="col medium-3 small-6 large-3">
                                <div class="col-inner">
                                    <div
                                            class="icon-box featured-box tab-title-icon icon-box-left text-left"
                                    >
                                        <div class="icon-box-img">
                                            <div class="icon">
                                                <div class="icon-inner">
                                                    <img src="assets/images/Website/baotri.jpg" alt=""/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="icon-box-text last-reset">
                                            <div class="ly-do-mua">
                                                Hệ thống máy móc hàng đầu VN
                                                <br/>
                                                Giảm tối thiểu sai số do lỗi thao tác
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="is-divider divider"></div>
            <div class="row" id="row-1942874916">
                <div id="col-1676309046" class="col medium-5 small-12 large-5">
                    <div class="col-inner">
                        <div class="icon-box featured-box icon-box-left text-left is-large">
                            <div class="icon-box-img">
                                <div class="icon">
                                    <div class="icon-inner">
                                        <i class="fa-solid fa-newspaper"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="icon-box-text last-reset">
                                <h5>Thông tin sản phẩm</h5>
                                <div id="text-880256298" class="text thong-tin">
                                    <p><strong>Thương hiệu: </strong>${requestScope.brand.name}</p>
                                    <p><strong>Mã sản phẩm: </strong>${requestScope.product.name}</p>
                                    <p><strong>Danh mục: </strong>${requestScope.category.name}</p>
                                    <p><strong>Mô tả: </strong> ${requestScope.product.description}</p>
                                    <p><strong>Kiểu dáng: </strong>${requestScope.shape.name}</p>
                                    <p><strong>Chất liệu: </strong>${requestScope.product.material}</p>
                                    <p><strong>Màu sắc: </strong>${requestScope.product.color}</p>
                                </div>
                            </div>
                        </div>
                        <div class="icon-box featured-box policy-icon icon-box-left text-left">
                            <div class="icon-box-img">
                                <div class="icon">
                                    <div class="icon-inner">
                                        <i class="fa-solid fa-rotate-left"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="icon-box-text last-reset">
                                <div class="accordion van-chuyen">
                                    <div class="accordion-item chinh_sach">
                                        <a>
                                            <span class="chinh-sach">Chính sách vận chuyển</span>
                                            <span><i class="fa-solid fa-chevron-down"></i></span>
                                        </a>

                                        <div class="accordion-inner hidden">
                                            <ul>
                                                <li>Giao hàng toàn quốc nhanh chóng.</li>
                                                <li>Giao siêu tốc trong vòng 2 giờ tại HCM.</li>
                                                <li>
                                                    Giao hàng ngoại thành: 2-3 ngày (có thể lên đến 7
                                                    ngày tùy khu vực)
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <p style="height: 30px"></p>

                        <div class="icon-box featured-box policy-icon icon-box-left text-left">
                            <div class="icon-box-img">
                                <div class="icon">
                                    <div class="icon-inner">
                                        <i class="fa-solid fa-truck"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="icon-box-text last-reset">
                                <div class="accordion van-chuyen">
                                    <div id="accordion-761411772" class="accordion-item chinh_sach">
                                        <a id="accordion-761411772-label">
                                            <span class="chinh-sach">Chính sách bảo hành</span>
                                            <span><i class="fa-solid fa-chevron-down"></i></span>
                                        </a>
                                        <div id="accordion-761411772-content" class="accordion-inner hidden">
                                            <ul>
                                                <li>Bảo hành tầm nhìn 6 tháng.</li>
                                                <li>
                                                    Gọng và tròng kính bảo hành 1 năm lỗi nhà sản
                                                    xuất.
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="col-871754910" class="col medium-7 small-12 large-7">
                    <div class="col-inner">
                        <div class="icon-box featured-box icon-box-left text-left is-large">
                            <div class="icon-box-img">
                                <div class="icon">
                                    <div class="icon-inner">
                                        <i class="fa-solid fa-layer-group"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="icon-box-text last-reset">
                                <h5>Chi tiết sản phẩm</h5>
                                <div class="product-page-section" style="background-color: rgb(247, 247, 247)">
                                    <div class="product-section">
                                        <div class="panel entry-content">
                                            <h2 style="text-align: center">
                                                <strong>Về </strong><b>${requestScope.brand.name} ${requestScope.product.name}</b>
                                            </h2>
                                            <ul>
                                                <li>
                                                    <span>Gọng kim loại làm từ thép không gỉ với độ bền, khả năng chống ăn mòn cao và an toàn cho da nhạy cảm</span>
                                                </li>
                                                <li>
                                                    <span>Kính dáng vuông giúp nổi bật các đường cong mềm mại của các kiểu khuôn mặt hình tròn, trái tim, oval.</span>
                                                </li>
                                                <li>
                                                    <span>Hộp vải nhung mang lại cảm giác sang trọng, mềm mại khi cầm tay.</span>
                                                </li>
                                                <li><span>Trọng lượng tương đối nhẹ.</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="is-divider divider"></div>

            <div id="text-899889134" class="text">
                <h4>có thể bạn sẽ thích</h4>
                <div class="row kinh">
                    <div class="col-lg-12">
                        <div id="productCarousel3" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <c:forEach var="product" items="${requestScope.brandList}" varStatus="status">
                                    <c:if test="${status.index % 3 == 0}">
                                        <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                        <div class="row">
                                    </c:if>
                                    <div class="item col-4">
                                        <div class="thumb">
                                            <div class="hover-content">
                                                <ul>
                                                    <li>
                                                        <a href="${context}/product-detail?id=${product.id}">
                                                            <i class="fa fa-eye"></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="rate-product">
                                                            <i class="fa fa-star"></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <form class="addCartForm">
                                                            <input type="hidden" name="id" value="${product.id}">
                                                            <button class="btn_gio_hang">
                                                                <i class="fa fa-shopping-cart"></i>
                                                            </button>
                                                        </form>
                                                    </li>
                                                </ul>
                                            </div>
                                            <img class="img-thumbnail border-0 rounded-4" src="${product.path_image}"
                                                 alt="${product.name}"/>
                                        </div>
                                        <div class="down-content">
                                            <h4>${product.name}</h4>
                                            <span><f:formatNumber value="${product.sellingPrice}"/>đ</span>
                                            <ul class="stars">
                                                <c:forEach begin="0" end="4">
                                                    <li><i class="fa fa-star"></i></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>

                                    <c:if test="${status.index % 3 == 2 || status.last}">
                                        </div> <!-- Kết thúc row -->
                                        </div> <!-- Kết thúc carousel-item -->
                                    </c:if>
                                </c:forEach>
                            </div>
                            <button class="carousel-control-prev position-absolute" style="width: fit-content"
                                    type="button" data-bs-target="#productCarousel3" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon bg-primary rounded" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next position-absolute" style="width: fit-content"
                                    type="button" data-bs-target="#productCarousel3" data-bs-slide="next">
                                <span class="carousel-control-next-icon bg-primary rounded" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="Footer.jsp"/>
</div>

<script src=assets/js/handle-buttom.js></script>
<script src="assets/js/plusminus.js"></script>
<script src="assets/js/slider.js"></script>
<c:import url="Script.jsp"/>

</body>
</html>