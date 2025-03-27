<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>EyeStyle</title>
    <c:import url="link.jsp"/>
</head>

<body>
<!-- ***** Preloader Start ***** -->
<%--<div id="preloader">--%>
<%--    <div class="jumper">--%>
<%--        <div></div>--%>
<%--        <div></div>--%>
<%--        <div></div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- ***** Preloader End ***** -->

<!-- ***** Header Area Start ***** -->
<jsp:include page="header.jsp"/>
<!-- ***** Header Area End ***** -->

<!-- ***** Main Banner Area Start ***** -->
<div class="main-banner container" id="top">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6">
                <div class="left-content">
                    <a href="index"><img class="img-thumbnail border-0" src="assets/images/left_banner_img.png" alt=""/></a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="right-content">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="right-first-image">
                                <div class="thumb border-0  ">
                                    <img alt="thumb" src="assets/images/img_type2.jpg"/>
                                    <div class="inner-content">
                                        <p>KÍNH MÁT</p>
                                        <button onclick="window.location.href='product-category?categoryId=3'">
                                            Mua ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-first-image">
                                <div class="thumb">
                                    <img src="assets/images/img_type3.jpg"/>
                                    <div class="inner-content">
                                        <p>GỌNG KÍNH</p>
                                        <button onclick="window.location.href='product-category?categoryId=9'">
                                            Mua ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-first-image bottom_img">
                                <div class="thumb">
                                    <img src="assets/images/img_type4.jpg"/>
                                    <div class="inner-content">
                                        <p>TRÒNG KÍNH</p>
                                        <button onclick="window.location.href='product-category?categoryId=5'">
                                            Mua ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-first-image bottom_img">
                                <div class="thumb">
                                    <img src="assets/images/img_type5.jpg" alt="img-type5"/>
                                    <div class="inner-content">
                                        <p>KÍNH ÁP TRÒNG</p>
                                        <button onclick="window.location.href='product-category?categoryId=7'">
                                            Mua ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="main-banner banner_child">
    <div class="container">
        <div class="row content_bc">
            <div class="col_4 col">
                <p>CAM KẾT CHÍNH HÃNG</p>
                <p>100% Authentic</p>
                <p>Cam kết chính hãng từ Châu Âu sang Châu Mỹ</p>
            </div>
            <div class="col_4 col">
                <p>GIAO HÀNG HỎA TỐC</p>
                <p>Express delivery</p>
                <p>SHIP hỏa tốc 1h nhận hàng trong nội thành HCM</p>
            </div>
            <div class="col_4 col">
                <p>HỖ TRỢ 24/24</p>
                <p>Supporting 24/24</p>
                <p>Gọi ngay</p>
            </div>
        </div>
    </div>
</div>
<!-- ***** Main Banner Area End ***** -->

<!-- ***** kinh_mat nam Starts ***** -->
<section class="section kinh" id="kinh_mat_nam">
    <div class="container">
        <div class="row content_head">
            <div class="col-lg-6">
                <div class="section-heading">
                    <h2>Kính mát nam</h2>
                    <span>Kính Mát Thời Thượng - Bảo Vệ Đôi Mắt, Tôn Vẻ Đẳng Cấp cho nam giới</span>
                </div>
            </div>
        </div>
    </div>
    <div class="container san_pham_" style="visibility: visible">
        <div class="row">
            <div class="col-lg-12">
                <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <c:forEach var="product" items="${requestScope.productListNam}" varStatus="status">
                            <c:if test="${status.index % 3 == 0}">
                                <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                <div class="row">
                            </c:if>
                            <div class="item" style="width: 33%">
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
                                    <img class="img-thumbnail border-0 rounded-4" src="${product.path_image}" alt="${product.name}"/>
                                </div>
                                <div class="down-content">
                                    <h4>${product.name}</h4>
                                    <span><f:formatNumber value="${product.sellingPrice}"/>đ</span>
                                    <ul class="stars">
                                        <c:forEach begin="0" end="5" step="1">
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
                    <button class="carousel-control-prev " type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon text-primary" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>

            </div>

        </div>
    </div>
</section>
<!-- ***** kinh_mat nam Ends ***** -->
<!-- ***** kinh_mat nữ Starts ***** -->
<section class="section kinh" id="kinh_mat_nu">
    <div class="container">
        <div class="row content_head">
            <div class="col-lg-6">
                <div class="section-heading">
                    <h2>Kính mát nữ</h2>
                    <span>Kính Mát Thời Thượng - Bảo Vệ Đôi Mắt, Tôn Vẻ Đẳng Cấp cho phái nữ</span>
                </div>
            </div>
        </div>
    </div>

    <div class="container san_pham_" style="visibility: visible">
        <div class="row">
            <div class="col-lg-12">
                <div id="productCarousel2" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <c:forEach var="product" items="${requestScope.productListNu}" varStatus="status">
                            <c:if test="${status.index % 3 == 0}">
                                <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                <div class="row">
                            </c:if>
                            <div class="item" style="width: 33%">
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
                                    <img class="img-thumbnail border-0 rounded-4" src="${product.path_image}" alt="${product.name}"/>
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
                    <button class="carousel-control-prev " type="button" data-bs-target="#productCarousel2" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon text-primary" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#productCarousel2" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>

            </div>

        </div>
    </div>
</section>
<!-- ***** kinh_mat nữ Ends ***** -->
<!-- ***** gọng kính Area Starts ***** -->
<section class="section kinh" id="gong_kinh">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="section-heading">
                    <h2>Gọng kính</h2>
                    <span>Gọng Kính Thời Thượng – Phong Cách Đa Dạng, Phù Hợp Mọi GươngMặt</span>
                </div>
            </div>
        </div>
    </div>
    <div class="container san_pham_" style="visibility: visible">
        <div class="row">
            <div class="col-lg-12">
                <div id="productCarousel3" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <c:forEach var="product" items="${requestScope.productListGK}" varStatus="status">
                            <c:if test="${status.index % 3 == 0}">
                                <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                <div class="row">
                            </c:if>
                            <div class="item" style="width: 33%">
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
                                    <img class="img-thumbnail border-0 rounded-4" src="${product.path_image}" alt="${product.name}"/>
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
                    <button class="carousel-control-prev " type="button" data-bs-target="#productCarousel3" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon text-primary" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#productCarousel3" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>

            </div>

        </div>
    </div>
</section>
<!-- ***** gong-kinh Area Ends ***** -->
<!-- ***** trong_kinh Area Starts ***** -->
<section class="section" id="trong_kinh">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="section-heading">
                    <h2>Tròng kính</h2>
                    <span
                    >Tròng Kính Cao Cấp – Bảo Vệ Đôi Mắt, Nâng Tầm Thị Giác</span
                    >
                    <br></br>
                    <div class="type_trong">
                        <div></div>
                        <div></div>
                        <p class="text_type_trong">Loại tròng</p>
                        <div></div>
                        <div></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-4 img_trong">
                <a href="product-category?categoryId=6"> <img src="assets/images/trong_kinh_type_1.jpg" alt=""/></a>
            </div>
            <div class="col-lg-4 img_trong">
                <a href="product-category?categoryId=16"> <img src="assets/images/trong_kinh_type_2.jpg" alt=""/></a>
            </div>
            <div class="col-lg-4 img_trong">
                <a href="product-category?categoryId=8"> <img src="assets/images/trong_kinh_type_3.jpg" alt=""/></a>
            </div>
        </div>
    </div>
</section>
<!-- ***** trong_kinh Ends ***** -->
<!-- ***** Kinh_ap_trong Starts ***** -->
<section class="section" id="kinh_ap_trong">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="section-heading">
                    <h2>Kính áp tròng</h2>
                    <span
                    >Kính Áp Tròng: Giải Pháp Hoàn Hảo Cho Thị Giác và Phong Cách</span
                    >
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row img_type">
            <c:forEach var="product" items="${requestScope.productListKAT}">
                <div class="col-lg-3 san_pham_kat">
                    <div class="item">
                        <div class="thumb">
                            <div class="hover-content">
                                <ul>
                                    <li>
                                        <a href="${context}/product-detail?id=${product.id}">
                                            <i class="fa fa-eye"></i>
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
                            <img src="${product.path_image}" alt="${product.name}"/>
                        </div>
                        <div class="down-content">
                            <h4>${product.name}
                            </h4>
                            <span><f:formatNumber value="${product.sellingPrice}"/>đ</span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- ***** kinh_ap_trong Ends ***** -->
<!-- ***** bo_suu_tap Starts ***** -->
<section class="section" id="bo_suu_tap">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="left-content">
                    <h2>Bộ sưu tập mắt kính</h2>
                    <span
                    >Bộ sưu tập mắt kính cao cấp mang đến trải nghiệm thị giác rõ nét và phong cách đẳng cấp. Với chất liệu nhẹ và bền, mỗi chiếc kính không chỉ đẹp mà còn mang đến sự thoải mái khi sử dụng. Hãy tìm cho mình một chiếc kính phù hợp, tôn vinh nét đẹp tự nhiên và gu thẩm mỹ tinh tế của bạn.</span
                    >
                    <div class="quote">
                        <i class="fa fa-quote-left"></i>
                        <p>
                            Dẫn lối phong cách, bảo vệ tầm nhìn – đó là sứ mệnh của từng chiếc mắt kính.
                        </p>
                    </div>
                    <p>
                        Bộ sưu tập mắt kính mùa hè với các thiết kế đa dạng giúp bạn không chỉ thể hiện cá tính mà còn
                        bảo vệ đôi mắt khỏi tác hại của tia UV.
                    </p>
                    <p>
                        Với màu sắc và kiểu dáng từ năng động đến thanh lịch, bộ sưu tập này chắc chắn sẽ là người bạn
                        đồng hành hoàn hảo cho mỗi chuyến du lịch, dạo phố hay các buổi tiệc ngoài trời.
                        a little via PayPal. Please also tell your friends about our
                        great website. Thank you.
                    </p>
                    <div class="main-border-button">
                        <a href="product-category?brandId=19">Khám phá thêm</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="right-content">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="first-image">
                                <a href="product-category?brandId=19"><img src="assets/images/bst_1.jpg" alt=""/></a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="first-image">
                                <a href="product-category?brandId=23"><img src="assets/images/bst_2.jpg" alt=""/></a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="first-image">
                                <a href="product-category?brandId=21"> <img src="assets/images/bst_3.jpg" alt=""/></a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="first-image">
                                <a href="product-category?brandId=20"><img src="assets/images/bst_4.jpg" alt=""/></a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="first-image">
                                <a href="product-category?brandId=22"><img src="assets/images/bst_5.jpg" alt=""/></a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="first-image">
                                <a href="product-category?brandId=24"> <img src="assets/images/bst_6.jpg" alt=""/></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ***** bo_suu_tap Ends ***** -->
<!-- ***** thuong_hieu Starts ***** -->
<section class="section" id="thuong_hieu">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-heading">
                    <h2>Thương hiệu mắt kính nổi tiếng</h2>
                    <span>Chọn Lựa Hoàn Hảo: Top Thương Hiệu Mắt Kính Sang Trọng Bạn Nên Sở Hữu.</span>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row images">
            <c:forEach var="brand" items="${requestScope.brandList}">
                <div class="col-2 image_brand">
                    <a href="product-category?brandId=${brand.id}"><img src="${brand.icon}" alt="${brand.name}"></a>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- ***** thuong_hieu Ends ***** -->
<!-- đăng kí nhận thông báo và ưu đãi -->
<div class="subscribe">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="section-heading">
                    <h2>Nhận tin mới nhất về sản phẩm bằng cách đăng ký bản tin!</h2>
                    <span>Cập nhật nhanh các sản phẩm mới nhất từ chúng tôi!</span>
                </div>
                <form id="subscribe">
                    <div class="row">
                        <div class="col-lg-5">
                            <fieldset>
                                <input
                                        name="name"
                                        type="text"
                                        id="name"
                                        placeholder="Họ và Tên"
                                        required=""
                                />
                            </fieldset>
                        </div>
                        <div class="col-lg-5">
                            <fieldset>
                                <input
                                        name="email"
                                        type="email"
                                        id="email"
                                        pattern="[^ @]*@[^ @]*"
                                        placeholder="Email"
                                        required=""
                                />
                            </fieldset>
                        </div>
                        <div class="col-lg-2">
                            <fieldset>
                                <button
                                        type="submit"
                                        id="form-submit"
                                        class="main-dark-button">
                                    <i class="fa fa-paper-plane"></i>
                                </button>
                            </fieldset>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-4">
                <div class="row">
                    <div class="col-6">
                        <ul>
                            <li>Địa chỉ cửa hàng:<br/><span>Nông Lâm, Thành phố Hồ Chí Minh</span>
                            </li>
                            <li>Số điện thoại:<br/><span>0123 456 789</span></li>
                            <li>Địa chỉ văn phòng:<br/><span>Rạng Đông 306</span></li>
                        </ul>
                    </div>
                    <div class="col-6">
                        <ul>
                            <li>Giờ làm việc:<br/><span>07:30 sáng - 9:30 tối Giờ hành chính</span></li>
                            <li>Email:<br/><span>nhom65@company.com</span></li>
                            <li> Mạng xã hội:<br/>
                                <span><a href="#">Facebook</a>,
                                <a href="#">Instagram</a>,
                                <a href="#">Behance</a>
                                , <a href="#">Linkedin</a></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ***** Subscribe Area Ends ***** -->
<!-- ***** Footer Start ***** -->
<jsp:include page="footer.jsp"/>
<!-- ***** Footer End ***** -->

<c:import url="script.jsp"/>
<script src="assets/js/newsletter_subscribe.js"></script>
</body>
</html>

