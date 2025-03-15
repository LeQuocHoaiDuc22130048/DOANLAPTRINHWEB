<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <link
            href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
            rel="stylesheet"
    />
    <title>Chi Tiết Sản Phẩm</title>

    <!-- link file css -->
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="./assets/css/font-awesome.css"/>
    <link rel="stylesheet" href="./assets/css/style-for-products.css"/>
    <link rel="stylesheet" href="./assets/css/owl-carousel.css"/>
    <link rel="stylesheet" href="./assets/css/lightbox.css"/>
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
    <jsp:include page="header.jsp"/>

    <!-- ***** Header Area End ***** -->

    <div
            class="shop-page-title category-page-title featured-title page-title"
    >
        <div
                class="page-title-inner flex-row container medium-flex-wrap flex-has-center"
        >
            <div class="flex-col flex-center text-center">
                <div class="is-large">
                    <nav class="woocommerce-breadcrumb breadcrumbs">
                        <a href="index">Trang Chủ</a>
                        <span class="divider">/</span>
                        Gọng kính cận
                        <span class="divider">/</span>
                        Gucci
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
                                        src="${product.path_image}"
                                        alt=""
                                        width="510px"
                                        height="510px"
                                />
                                <img
                                        src="${images[1].path}"
                                        alt=""
                                        width="510px"
                                        height="510px"
                                />
                                <img
                                        src="${images[2].path}"
                                        alt=""
                                        width="510px"
                                        height="510px"
                                />
                                <img
                                        src="${images[0].path}"
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
                        <div class="full-screen">
                            <a href="" id="product_icon"
                            ><i
                                    class="fa-solid fa-up-right-and-down-left-from-center"
                            ></i
                            ></a>
                        </div>
                    </div>
                    <div class="more-images">
                        <div class="col-4-images">
                            <img src="${product.path_image}" alt=""/>
                        </div>
                        <div class="col-4-images">
                            <img src="${images[1].path}" alt=""/>
                        </div>
                        <div class="col-4-images">
                            <img src="${images[2].path}" alt=""/>
                        </div>
                        <div class="col-4-images">
                            <img src="${images[0].path}" alt=""/>
                        </div>
                    </div>
                </div>

                <div
                        id="col-right"
                        class="col product-page medium-6 small-12 large-6"
                >
                    <div class="col-inner">
                        <div class="thuong-hieu brand">
                            <a href="#" class="brand-ref"
                            ><img src="assets/images/gucci_brand.jpg" alt=""
                            /></a>
                        </div>
                        <div class="product-title-container">
                            <h1 class="product-title product_title entry-title">
                                <%--                    Gucci Unisex – Gọng kính Thép không gỉ – Mã GG1144O_54_002--%>
                                ${product.name}
                                ${product.description}
                            </h1>
                        </div>
                        <div class="product-price-container is-xxlarge">
                            <div class="price-wrapper">
                                <p class="price product-page-price">
                      <span class="woocommerce-Price-amount amount">
                        <f:formatNumber value="${product.sellingPrice}"/>
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
                                <input type="hidden" name="id" value="${product.id}"/> <!-- ID sản phẩm -->
                                <button id="add-to-cart" class="single_add_to_cart_button button alt">
                                    Thêm vào giỏ hàng
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="is-divider divider"></div>
            <%--          <div--%>
            <%--            class="row align-middle-align-center tab-button"--%>
            <%--            id="row-1581544597"--%>
            <%--          >--%>
            <%--            <div--%>
            <%--              id="col-918240496"--%>
            <%--              class="col hide-for-small small-12 large-12"--%>
            <%--            >--%>
            <%--              <div class="col-inner text-left">--%>
            <%--                <div class="row list-tab-icon-title" id="row-1146947431">--%>
            <%--                  <div id="col-375462666" class="col medium-3 small-6 large-3">--%>
            <%--                    <div class="col-inner">--%>
            <%--                      <div--%>
            <%--                        class="icon-box featured-box tab-title-icon icon-box-left text-left"--%>
            <%--                      >--%>
            <%--                        <div class="icon-box-img">--%>
            <%--                          <div class="icon">--%>
            <%--                            <div class="icon-inner">--%>
            <%--                              <img src="assets/images/doiTra.jpg" alt="" />--%>
            <%--                            </div>--%>
            <%--                          </div>--%>
            <%--                        </div>--%>

            <%--                        <div class="icon-box-text last-reset">--%>
            <%--                          <div class="ly-do-mua">--%>
            <%--                            Bảo hành 6 tháng--%>
            <%--                            <br />--%>
            <%--                            Duy nhất tại Việt Nam--%>
            <%--                          </div>--%>
            <%--                        </div>--%>
            <%--                      </div>--%>
            <%--                    </div>--%>
            <%--                  </div>--%>
            <%--                </div>--%>
            <%--              </div>--%>
            <%--            </div>--%>

            <%--            <div--%>
            <%--              id="col-918240496"--%>
            <%--              class="col hide-for-small small-12 large-12"--%>
            <%--            >--%>
            <%--              <div class="col-inner text-left">--%>
            <%--                <div class="row list-tab-icon-title" id="row-1146947431">--%>
            <%--                  <div id="col-375462666" class="col medium-3 small-6 large-3">--%>
            <%--                    <div class="col-inner">--%>
            <%--                      <div--%>
            <%--                        class="icon-box featured-box tab-title-icon icon-box-left text-left"--%>
            <%--                      >--%>
            <%--                        <div class="icon-box-img">--%>
            <%--                          <div class="icon">--%>
            <%--                            <div class="icon-inner">--%>
            <%--                              <img src="assets/images/camket.jpg" alt="" />--%>
            <%--                            </div>--%>
            <%--                          </div>--%>
            <%--                        </div>--%>

            <%--                        <div class="icon-box-text last-reset">--%>
            <%--                          <div class="ly-do-mua">--%>
            <%--                            Cam kết sản phẩm chính hãng--%>
            <%--                            <br />--%>
            <%--                            Đền gấp 10 lần--%>
            <%--                          </div>--%>
            <%--                        </div>--%>
            <%--                      </div>--%>
            <%--                    </div>--%>
            <%--                  </div>--%>
            <%--                </div>--%>
            <%--              </div>--%>
            <%--            </div>--%>

            <%--            <div--%>
            <%--              id="col-918240496"--%>
            <%--              class="col hide-for-small small-12 large-12"--%>
            <%--            >--%>
            <%--              <div class="col-inner text-left">--%>
            <%--                <div class="row list-tab-icon-title" id="row-1146947431">--%>
            <%--                  <div id="col-375462666" class="col medium-3 small-6 large-3">--%>
            <%--                    <div class="col-inner">--%>
            <%--                      <div--%>
            <%--                        class="icon-box featured-box tab-title-icon icon-box-left text-left"--%>
            <%--                      >--%>
            <%--                        <div class="icon-box-img">--%>
            <%--                          <div class="icon">--%>
            <%--                            <div class="icon-inner">--%>
            <%--                              <img src="assets/images/quytrinh.jpg" alt="" />--%>
            <%--                            </div>--%>
            <%--                          </div>--%>
            <%--                        </div>--%>

            <%--                        <div class="icon-box-text last-reset">--%>
            <%--                          <div class="ly-do-mua">--%>
            <%--                            Quy trình đo mắt chuẩn Quốc Tế--%>
            <%--                            <br />--%>
            <%--                            Thời gian đo tối thiểu 20 phút--%>
            <%--                          </div>--%>
            <%--                        </div>--%>
            <%--                      </div>--%>
            <%--                    </div>--%>
            <%--                  </div>--%>
            <%--                </div>--%>
            <%--              </div>--%>
            <%--            </div>--%>

            <%--            <div--%>
            <%--              id="col-918240496"--%>
            <%--              class="col hide-for-small small-12 large-12"--%>
            <%--            >--%>
            <%--              <div class="col-inner text-left">--%>
            <%--                <div class="row list-tab-icon-title" id="row-1146947431">--%>
            <%--                  <div id="col-375462666" class="col medium-3 small-6 large-3">--%>
            <%--                    <div class="col-inner">--%>
            <%--                      <div--%>
            <%--                        class="icon-box featured-box tab-title-icon icon-box-left text-left"--%>
            <%--                      >--%>
            <%--                        <div class="icon-box-img">--%>
            <%--                          <div class="icon">--%>
            <%--                            <div class="icon-inner">--%>
            <%--                              <img src="assets/images/baotri.jpg" alt="" />--%>
            <%--                            </div>--%>
            <%--                          </div>--%>
            <%--                        </div>--%>

            <%--                        <div class="icon-box-text last-reset">--%>
            <%--                          <div class="ly-do-mua">--%>
            <%--                            Hệ thống máy móc hàng đầu VN--%>
            <%--                            <br />--%>
            <%--                            Giảm tối thiểu sai số do lỗi thao tác--%>
            <%--                          </div>--%>
            <%--                        </div>--%>
            <%--                      </div>--%>
            <%--                    </div>--%>
            <%--                  </div>--%>
            <%--                </div>--%>
            <%--              </div>--%>
            <%--            </div>--%>
            <%--          </div>--%>
            <div class="is-divider divider"></div>
            <div class="row" id="row-1942874916">
                <div id="col-1676309046" class="col medium-5 small-12 large-5">
                    <div class="col-inner">
                        <div
                                class="icon-box featured-box icon-box-left text-left is-large"
                        >
                            <div class="icon-box-img">
                                <div class="icon">
                                    <div class="icon-inner">
                                        <i class="fa-solid fa-newspaper"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="icon-box-text last-reset">
                                <h5 class="uppercase">Thông tin sản phẩm</h5>
                                <div id="text-880256298" class="text thong-tin">
                                    <p><strong>Thương hiệu:</strong> Gucci</p>
                                    <p><strong>Mã sản phẩm:</strong> GG1144O_54_002</p>
                                    <p><strong>Xuất xứ:</strong> Ý</p>
                                    <p><strong>Bảo hành:</strong> 1 năm</p>
                                    <p><strong>Giới tính:</strong> Unisex</p>
                                    <p><strong>Phong cách vành gọng:</strong> Nguyên khung</p>
                                    <p><strong>Kiểu dáng:</strong> Vuông</p>
                                    <p><strong>Chất liệu gọng:</strong> Thép không gỉ</p>
                                    <p><strong>Màu sắc:</strong> Bạc – Xanh</p>
                                    <p><strong>Kích thước tròng:</strong> 54mm</p>
                                    <p><strong>Độ dài gọng:</strong> 140mm</p>
                                    <p><strong>Độ dài cầu kính:</strong> 17mm</p>
                                </div>
                            </div>
                        </div>
                        <div
                                class="icon-box featured-box policy-icon icon-box-left text-left"
                        >
                            <div class="icon-box-img">
                                <div class="icon">
                                    <div class="icon-inner">
                                        <i class="fa-solid fa-rotate-left"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="icon-box-text last-reset">
                                <%--                    <div class="accordion van-chuyen">--%>
                                <%--                      <div--%>
                                <%--                        id="accordion-761411772"--%>
                                <%--                        class="accordion-item chinh_sach"--%>
                                <%--                      >--%>
                                <%--                        <a id="accordion-761411772-label">--%>
                                <%--                          <span class="chinh-sach">Chính sách vận chuyển</span>--%>
                                <%--                          <span><i class="fa-solid fa-chevron-down"></i></span>--%>
                                <%--                        </a>--%>

                                <%--                        <div--%>
                                <%--                          id="accordion-761411772-content"--%>
                                <%--                          class="accordion-inner hidden"--%>
                                <%--                        >--%>
                                <%--                          <ul>--%>
                                <%--                            <li>Giao hàng toàn quốc nhanh chóng.</li>--%>
                                <%--                            <li>Giao siêu tốc trong vòng 2 giờ tại HCM.</li>--%>
                                <%--                            <li>--%>
                                <%--                              Giao hàng ngoại thành: 2-3 ngày (có thể lên đến 7--%>
                                <%--                              ngày tùy khu vực)--%>
                                <%--                            </li>--%>
                                <%--                          </ul>--%>
                                <%--                        </div>--%>
                                <%--                      </div>--%>
                                <%--                    </div>--%>
                            </div>
                        </div>

                        <p style="height: 30px"></p>

                        <div
                                class="icon-box featured-box policy-icon icon-box-left text-left"
                        >
                            <div class="icon-box-img">
                                <div class="icon">
                                    <div class="icon-inner">
                                        <i class="fa-solid fa-truck"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="icon-box-text last-reset">
                                <div class="accordion van-chuyen">
                                    <div
                                            id="accordion-761411772"
                                            class="accordion-item chinh_sach"
                                    >
                                        <a id="accordion-761411772-label">
                                            <span class="chinh-sach">Chính sách bảo hành</span>
                                            <span><i class="fa-solid fa-chevron-down"></i></span>
                                        </a>

                                        <div
                                                id="accordion-761411772-content"
                                                class="accordion-inner hidden"
                                        >
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
                        <div
                                class="icon-box featured-box icon-box-left text-left is-large"
                        >
                            <div class="icon-box-img">
                                <div class="icon">
                                    <div class="icon-inner">
                                        <i class="fa-solid fa-layer-group"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="icon-box-text last-reset">
                                <h5>Chi tiết sản phẩm</h5>
                                <div
                                        class="product-page-section"
                                        style="background-color: rgb(247, 247, 247)"
                                >
                                    <div class="product-section">
                                        <div class="panel entry-content">
                                            <h2 style="text-align: center">
                                                <strong>Về </strong><b>GUCCI GG1144O_54_002 </b>
                                            </h2>
                                            <ul>
                                                <li>
                              <span
                              >Gọng kim loại làm từ thép không gỉ với độ bền,
                                khả năng chống ăn mòn cao và an toàn cho da nhạy
                                cảm</span
                              >
                                                </li>
                                                <li>
                              <span
                              >Kính dáng vuông giúp nổi bật các đường cong mềm
                                mại của các kiểu khuôn mặt hình tròn, trái tim,
                                oval.</span
                              >
                                                </li>
                                                <li>
                              <span
                              >Hộp vải nhung mang lại cảm giác sang trọng, mềm
                                mại khi cầm tay.</span
                              >
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

                <div class="row-container">
                    <div class="row slider row-slider">
                        <div class="col-lg-4 col-lg-4-slider">
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content"></div>
                                    <img
                                            src="assets/images/product1.jpg"
                                            alt=""
                                            style="width: 100%"
                                    />
                                    <div class="down-content">
                                        <h5>Oakley Unisex Mã 0OX8096</h5>
                                        <span>5.090.000đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-lg-4-slider">
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content"></div>
                                    <img
                                            src="assets/images/product2.jpg"
                                            alt=""
                                            style="width: 100%"
                                    />
                                    <div class="down-content">
                                        <h5>Oakley Unisex Mã 0OX8096</h5>
                                        <span>5.090.000đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-lg-4-slider">
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content"></div>
                                    <img
                                            src="assets/images/product3.jpg"
                                            alt=""
                                            style="width: 100%"
                                    />
                                    <div class="down-content">
                                        <h5>Oakley Unisex Mã 0OX8096</h5>
                                        <span>5.090.000đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-lg-4-slider">
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content"></div>
                                    <img
                                            src="assets/images/product4.jpg"
                                            alt=""
                                            style="width: 100%"
                                    />
                                    <div class="down-content">
                                        <h5>Oakley Unisex Mã 0OX8096</h5>
                                        <span>5.090.000đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-lg-4-slider">
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content"></div>
                                    <img
                                            src="assets/images/product5.jpg"
                                            alt=""
                                            style="width: 100%"
                                    />
                                    <div class="down-content">
                                        <h5>Oakley Unisex Mã 0OX8096</h5>
                                        <span>5.090.000đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-lg-4-slider">
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content"></div>
                                    <img
                                            src="assets/images/product6.jpg"
                                            alt=""
                                            style="width: 100%"
                                    />
                                    <div class="down-content">
                                        <h5>Oakley Unisex Mã 0OX8096</h5>
                                        <span>5.090.000đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-lg-4-slider">
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content"></div>
                                    <img
                                            src="assets/images/product7.jpg"
                                            alt=""
                                            style="width: 100%"
                                    />
                                    <div class="down-content">
                                        <h5>Oakley Unisex Mã 0OX8096</h5>
                                        <span>5.090.000đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-lg-4-slider">
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content"></div>
                                    <img
                                            src="assets/images/product8.jpg"
                                            alt=""
                                            style="width: 100%"
                                    />
                                    <div class="down-content">
                                        <h5>Oakley Unisex Mã 0OX8096</h5>
                                        <span>5.090.000đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="arrow-angle">
                        <div class="arrow-left">
                            <i class="fa-solid fa-angle-left"></i>
                        </div>
                        <div class="arrow-right">
                            <i class="fa-solid fa-angle-right"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp"/>
</div>

<!-- jQuery -->
<script src="assets/js/jquery-2.1.0.min.js"></script>
<!-- Bootstrap -->
<script src="assets/js/popper.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Plugins -->
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/accordions.js"></script>
<script src="assets/js/datepicker.js"></script>
<script src="assets/js/scrollreveal.min.js"></script>
<script src="assets/js/waypoints.min.js"></script>
<script src="assets/js/jquery.counterup.min.js"></script>
<script src="assets/js/imgfix.min.js"></script>
<script src="assets/js/slick.js"></script>
<script src="assets/js/lightbox.js"></script>
<script src="assets/js/isotope.js"></script>
<script src="assets/js/dropdown.js"></script>
<script src="assets/js/back_to_top.js"></script>
<script src="assets/js/chat_box.js"></script>
<script src="assets/js/custom.js"></script>
<%--    <script src="assets/js/cart.js"></script>--%>
<script src="assets/js/handle-buttom.js"></script>
<script src="assets/js/plusminus.js"></script>
<%--    <script src="assets/js/add-to_cart.js"></script>--%>
<script src="assets/js/slider.js"></script>
<script src="assets/js/jquery-2.1.0.min.js"></script>
<script src="assets/js/hien_thi_ten_dangnhap.js"></script>
<script src="assets/js/add_cart.js"></script>

<!-- Global Init -->
<script src="assets/js/custom.js"></script>

<script>
    $(function () {
        var selectedClass = "";
        $("p").click(function () {
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
            $("#portfolio div")
                .not("." + selectedClass)
                .fadeOut();
            setTimeout(function () {
                $("." + selectedClass).fadeIn();
                $("#portfolio").fadeTo(50, 1);
            }, 500);
        });
    });
</script>
</body>
</html>
