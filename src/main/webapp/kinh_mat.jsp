<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link
            rel="shortcut icon"
            href="assets/images/logo.png"
            type="image/x-icon"
    />
    <title>Kính mát</title>

    <!-- link file css -->
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="./assets/css/font-awesome.css"/>
    <link rel="stylesheet" href="./assets/css/style-for-products.css"/>
    <link rel="stylesheet" href="./assets/css/owl-carousel.css"/>
    <link rel="stylesheet" href="./assets/css/lightbox.css"/>
    <style>

        /* Container chứa tất cả các sản phẩm */
        .product-list-container {
            width: 100%;
            padding: 20px;

        }

        /* Chia các sản phẩm thành các hàng (row) và cột (col) */
        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        /* Định dạng cho mỗi ảnh sản phẩm */
        .row img {
            width: 103%;
            margin-bottom: 20px;
            object-fit: cover; /* Cắt bớt ảnh nếu cần để đảm bảo ảnh đúng kích thước */
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* Thêm bóng cho hình ảnh */
        }

        /* Định dạng khi không có hình ảnh */
        .row p {
            text-align: center;
            width: 100%;
            font-size: 18px;
            color: #888;
            margin-top: 20px;
        }

        .product-price {
            font-size: 20px;
            text-align: center;
            margin-bottom: 20px;
            color: #9f9c9c;
        }

        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }

        .page-number {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .page-number a {
            display: inline-block;
            font-weight: bold;
            font-size: 20px;
            padding: 8px 12px;
            text-decoration: none;
            transition: background-color 0.3s ease, color 0.3s ease;
        }


        .product-item .thumb {
            position: relative;
            overflow: hidden;
        }

        .product-item .thumb .hover-content {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 15px;
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.3s, visibility 0.3s;
        }

        .product-item .thumb:hover .hover-content {
            opacity: 1;
            visibility: visible;
        }

        .product-item .thumb .hover-content ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            gap: 10px;
        }

        .product-item .thumb .hover-content ul li {
            display: inline-block;
        }

        .product-item .thumb .hover-content ul li a {
            display: inline-block;
            background-color: #fff;
            border-radius: 0%;
            width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #000;
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s, transform 0.3s;
        }

        .product-item .thumb .hover-content ul li a:hover {
            background-color: #000;
            color: #fff;
            transform: scale(1.1);
        }


        .product-item .product-info .stars {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            gap: 5px;
            justify-content: flex-end;
            align-items: center;
            position: relative;
            top: -25px;
            right: 0;
        }

        .product-item .product-info .stars li {
            display: inline-block;
            font-size: 15px;
            color: #000;
        }

        .product-item .product-info .stars li i {
            transition: color 0.3s;
        }

    </style>
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
                        kính mát
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
                    Kính mát hiệu thời trang, chính hãng 100%, mẫu mới 2024
                  </span>
                        </strong>
                    </h1>
                    <p>
                        <img
                                src="assets/images/kinh-mat-thoi-trang-chinh-hang-100.jpg"
                                alt=""
                        />
                    </p>
                    <div class="text hide-for-small">
                        <p class="caption-top">
                            <em>
                                Qua nhiều thập kỷ, kính mát vẫn là phụ kiện thời trang được
                                ưa chuộng. Sự chung sức của các thương hiệu xa xỉ hàng đầu
                                như RayBan, Gucci, Dior,…đã góp phần làm đầy thị trường kính
                                râm bằng vô vàn kiểu dáng hot trend, xịn, ngầu và có nhiều
                                tính năng vượt trội, chinh phục thành công không ít các tín
                                đồ. Tất cả đã mở ra thế giới sắc màu cho kính mắt hàng hiệu,
                                không chỉ nâng tầm phong cách mà còn mang đến khả năng bảo
                                vệ mắt tối ưu.
                            </em>
                        </p>
                    </div>
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
                            <td style="width: 33.3%; height: 95px; text-align: center">
                                <a title="Gọng mát nữ" href="kinh_mat_nu.html">
                                    <img
                                            src="assets/images/bst-kinh-mat-nu-thoi-trang.jpg"
                                            alt=""
                                            width="340"
                                            height="210"
                                            class="alignnone wp-image-19677 size-full"
                                    />
                                </a>
                            </td>

                            <td style="width: 33.3%; height: 95px; text-align: center">
                                <a title="Gọng mát nam" href="kinh_mat_nam.html">
                                    <img
                                            src="assets/images/bst-kinh-mat-nam-thoi-trang.jpg"
                                            alt=""
                                            width="340"
                                            height="210"
                                            class="alignnone wp-image-19677 size-full"
                                    />
                                </a>
                            </td>

                            <td style="width: 33.3%; height: 95px; text-align: center">
                                <a title="Gọng mát trẻ em" href="kinh_mat_tre_em.html">
                                    <img
                                            src="assets/images/bst-kinh-mat-tre-em-thoi-trang.jpg"
                                            alt=""
                                            width="340"
                                            height="210"
                                            class="alignnone wp-image-19677 size-full"
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
                    <div class="productfilter-wc productfilter-woocommerce">
                        <form action="filter" class="product-ordering" method="POST">
                            <div class="productfilter_filter_wrapper productfilter_columns_3">
                                <div class="product-filter-inner">
                                    <div class="prodctfilter_filter productfilter_pa_thuong-hieu">
                                        <input class="d-none" checked type="text" name="type" value="brand_id"/>

                                        <span class="product_regular-title" data-dropdown="dropdown-thuongHieu">Thương hiệu
                          <i class="fa-solid fa-angle-down"></i>

                          <div class="productfilter-down">
                            <div
                                    class="product-checkbox"
                                    id="dropdown-thuongHieu"
                            >
                              <label class="product-ft-parim">
                                <input type="checkbox" name="value" value="parim"/>
                                <span>Parim</span>
                              </label>

                              <label class="product-ft-exfash">
                                  <span>exfash </span>
                                <input type="checkbox" name="brand" value="exfash"/>

                              </label>

                              <label class="product-ft-burberry">
                                <input type="checkbox" name="value" value="7"/>
                                <span>burberry</span>
                              </label>

                              <label class="product-ft-gucci">
                                <input type="checkbox" name="brand" value="gucci"/>
                                <span>gucci</span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" name="brand" value="rodenstock"/>
                                <span>RodenStock</span>
                              </label>

                              <label class="product-ft-versace">
                                <input type="checkbox" name="brand" value="versace"/>
                                <span>versace</span>
                              </label>

                              <label class="product-ft-chopard">
                                <input type="checkbox" name="brand" value="chopard"/>
                                <span>chopard</span>
                              </label>

                              <label class="product-ft-rayban">
                                <input type="checkbox" name="brand" value="rayban"/>
                                <span>rayban</span>
                              </label>

                              <label class="product-ft-furla">
                                <input type="checkbox" name="brand" value="furla"/>
                                <span>furla</span>
                              </label>
                              <label class="product-ft-dior">
                                <input type="checkbox" name="brand" value="dior"/>
                                <span>dior</span>
                              </label>
                              <label class="product-ft-police">
                                <input type="checkbox" name="brand" value="police"/>
                                <span>police</span>
                              </label>
                              <label class="product-ft-oakley">
                                <input type="checkbox" brand="brand" value="oakley"/>
                                <span>oakley</span>
                              </label>
                              <label class="product-ft-cartier">
                                <input type="checkbox" name="brand" value="cartier"/>
                                <span>cartier</span>
                              </label>
                              <label class="product-ft-bolon">
                                <input type="checkbox" name="brand" value="bolon"/>
                                <span>bolon</span>
                              </label>
                              <label class="product-ft-chrome-hearts">
                                <input type="checkbox" name="brand" value="chorme hearts"/>
                                <span>chorme hearts</span>
                              </label>
                              <label class="product-ft-montblanc">
                                <input type="checkbox" name="brand" value="monblanc"/>
                                <span>monblanc</span>
                              </label>
                              <label class="product-ft-molsion">
                                <input type="checkbox" name="brand" value="molsion"/>
                                <span>molsion</span>
                              </label>
                              <label class="product-ft-eyescloud">
                                <input type="checkbox" name="brand" value="eyescloud"/>
                                <span>eyescloud</span>
                              </label>

                                <label class="product-ft-eyescloud">
                                <input type="checkbox" name="brand" value="zeiss"/>
                                <span>Zeiss</span>
                              </label>

                                <label class="product-ft-eyescloud">
                                <input type="checkbox" name="brand" value="levanlens"/>
                                <span>Levanlens</span>
                              </label>
                                <label class="product-ft-eyescloud">
                                <input type="checkbox" name="brand" value="essilor"/>
                                <span>Essilor</span>
                              </label>

                            </div>
                            <div class="filter-footer">
                                <button TYPE="submit" class="apply-filter">Xem kết quả</button>
                            </div>
                          </div>
                        </span>
                                    </div>

                                    <div class="prodctfilter_filter productfilter_pa_thuong-hieu">
                                        <input type="hidden" name="pa-thuong-hieu"/>
                                        <span class="product_regular-title">
                          Giới tính
                          <i class="fa-solid fa-angle-down"></i>

                          <div class="productfilter-down">
                            <div
                                    class="product-checkbox"
                                    id="dropdown-thuongHieu"
                            >
                              <label class="product-ft-parim">
                                <input type="checkbox" name="gender" value="nam"/>
                                <span
                                ><img
                                        src="assets/images/icon-nam .jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-exfash">
                                <input type="checkbox" name="gender" value="nu"/>
                                <span
                                ><img src="assets/images/icon-nu .jpg" alt=""
                                /></span>
                              </label>

                              <label class="product-ft-exfash">
                                <input type="checkbox" name="gender" value="unisex"/>
                                <span
                                ><img
                                        src="assets/images/icon-unisex .jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-exfash">
                                <input type="checkbox" name="gender" value="tre em"/>
                                <span
                                ><img
                                        src="assets/images/icon-tre-em.jpg"
                                        alt=""
                                /></span>
                              </label>
                            </div>
                            <div class="filter-footer">
                              <button type="submit" class="apply-filter">Xem kết quả</button>>
                            </div>
                          </div>
                        </span>
                                    </div>

                                    <div
                                            class="prodctfilter_filter productfilter_pa_thuong-hieu"
                                    >
                                        <input type="hidden" name="pa-thuong-hieu"/>
                                        <span class="product_regular-title">
                          Kiểu dáng
                          <i class="fa-solid fa-angle-down"></i>

                          <div class="productfilter-down">
                            <div
                                    class="product-checkbox"
                                    id="dropdown-thuongHieu"
                            >
                              <label class="product-ft-parim">
                                <input type="checkbox" name="shape" value="hinh thang"/>
                                <span
                                ><img
                                        src="assets/images/icon-kieu-gong-hinh-thang.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" name="shape" value="chu nhat"/>
                                <span
                                ><img
                                        src="assets/images/icon-kieu-gong-chu-nhat.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" name="shape" value="tron"/>
                                <span
                                ><img
                                        src="assets/images/icon-kieu-gong-tron.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" name="shape" value="meo"/>
                                <span
                                ><img
                                        src="assets/images/icon-kieu-gong-mat-meo.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" name="sahpe" value="da giac"/>
                                <span
                                ><img
                                        src="assets/images/icon-kieu-gong-da-giac.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" name="shape" value="buom"/>
                                <span
                                ><img
                                        src="assets/images/icon-kieu-gong-canh-buom.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" name="shape" value="khong quy tac"/>
                                <span
                                ><img
                                        src="assets/images/icon-kieu-gong-khong-quy-tac.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" name="shape" value="vuong"/>
                                <span
                                ><img
                                        src="assets/images/icon-kieu-gong-vuong.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" name="shape" value="bau duc"/>
                                <span
                                ><img
                                        src="assets/images/icon-kieu-gong-bau-duc.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" name="shape" value="phi cong"/>
                                <span
                                ><img
                                        src="assets/images/icon-kieu-gong-phi-cong.jpg"
                                        alt=""
                                /></span>
                              </label>
                            </div>
                            <div class="filter-footer">
                              <button type="submit" class="apply-filter">Xem kết quả</button>
                            </div>
                          </div>
                        </span>
                                    </div>

                                    <div
                                            class="prodctfilter_filter productfilter_pa_thuong-hieu"
                                    >
                                        <input type="hidden" name="pa-thuong-hieu"/>
                                        <span class="product_regular-title">
                          Chất liệu
                          <i class="fa-solid fa-angle-down"></i>

                          <div class="productfilter-down">
                            <div
                                    class="product-checkbox"
                                    id="dropdown-thuongHieu"
                            >
                              <label class="product-ft-parim">
                                <input type="checkbox" value="nhua" name="material"/>
                                <span
                                ><img
                                        src="assets/images/icon_chatlieu/icon-chat-lieu-gong-nhua.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="kim loai" name="material"/>
                                <span
                                ><img
                                        src="assets/images/icon-kim-loai.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="titanium" name="material"/>
                                <span
                                ><img
                                        src="assets/images/icon_chatlieu/icon-chat-lieu-gong-titanium.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="xi/mavang" name="material"/>
                                <span
                                ><img
                                        src="assets/images/icon_chatlieu/icon-chat-lieu-gong-xi-ma-vang.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="nhua deo" name="material"/>
                                <span
                                ><img
                                        src="assets/images/icon_chatlieu/icon-chat-lieu-gong-nhua-deo-tr90.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="nhua acetate" name="material"/>
                                <span
                                ><img
                                        src="assets/images/icon_chatlieu/icon-chat-lieu-gong-nhua-acetate.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="vang nguyen khoi" name="material"/>
                                <span
                                ><img
                                        src="assets/images/icon_chatlieu/icon-chat-lieu-gong-vang-nguyen-khoi.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="nhua ultem" name="material"/>
                                <span
                                ><img
                                        src="assets/images/icon_chatlieu/icon-chat-lieu-gong-nhua-ultem.jpg"
                                        alt=""
                                /></span>
                              </label>
                            </div>
                            <div class="filter-footer">
                              <button type="submit" class="apply-filter" id="applyFilter">Xem kết quả</button>
                            </div>
                          </div>
                        </span>
                                    </div>

                                    <div
                                            class="prodctfilter_filter productfilter_pa_thuong-hieu"
                                    >
                                        <input type="hidden" name="pa-thuong-hieu"/>
                                        <span class="product_regular-title">
                          Màu sắc
                          <i class="fa-solid fa-angle-down"></i>

                          <div class="productfilter-down">
                            <div
                                    class="product-checkbox"
                                    id="dropdown-thuongHieu"
                            >
                              <label class="product-ft-parim">
                                <input type="checkbox" name="color" value="den"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-den.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="vang" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-vang.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="bac" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-bac.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="hong" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-vang-hong.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="trong suot" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-trong-suot.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="xam" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-xam.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="doi mau" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-doi-moi.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="trang" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-trang.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="ho phach" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-ho-phach.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="xanh_duong" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mat-kinh-mau-xanh-duong.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="do" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-do.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="nau" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-nau.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="tim" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-tim.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="hong" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-hong.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="cam" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-cam.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="xanh_la" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-xanh-la.jpg"
                                        alt=""
                                /></span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="mau khac" name="color"/>
                                <span
                                ><img
                                        src="assets/images/icon-mau-gong-mau-khac.jpg"
                                        alt=""
                                /></span>
                              </label>
                            </div>
                            <div class="filter-footer">
                              <button type="submit" class="apply-filter">Xem kết quả</button>
                            </div>
                          </div>
                        </span>
                                    </div>

                                    <div
                                            class="prodctfilter_filter productfilter_pa_thuong-hieu"
                                    >
                                        <input type="hidden" name="pa-thuong-hieu"/>
                                        <span class="product_regular-title">
                          Lọc theo giá
                          <i class="fa-solid fa-angle-down"></i>

                          <div class="productfilter-down">
                            <div
                                    class="product-checkbox"
                                    id="dropdown-thuongHieu"
                            >
                              <label class="product-ft-parim">
                                <input type="checkbox" value="0-1" name="price"/>
                                <span>0 - 1tr</span>
                              </label>

                              <label class="product-ft-exfash">
                                <input type="checkbox" value="1-2" name="price"/>
                                <span>1tr - 2tr </span>
                              </label>

                              <label class="product-ft-burberry">
                                <input type="checkbox" value="2-4" name="price"/>
                                <span>2tr - 4tr</span>
                              </label>

                              <label class="product-ft-gucci">
                                <input type="checkbox" value="4-10" name="price"/>
                                <span>4tr - 10tr</span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="10-20" name="price"/>
                                <span>10tr - 20tr</span>
                              </label>

                              <label class="product-ft-versace">
                                <input type="checkbox" value="tren 20" name="price"/>
                                <span>trên 20tr</span>
                              </label>
                            </div>
                            <div class="filter-footer">
                              <button type="submit" class="apply-filter">Xem kết quả</button>
                            </div>
                          </div>
                        </span>
                                    </div>


                                    <div
                                            class="prodctfilter_filter productfilter_pa_thuong-hieu"
                                    >
                                        <input type="hidden" name="pa-thuong-hieu"/>
                                        <span class="product_regular-title">
                          Danh mục
                          <i class="fa-solid fa-angle-down"></i>

                          <div class="productfilter-down">
                            <div
                                    class="product-checkbox"
                                    id="dropdown-thuongHieu"
                            >
                              <label class="product-ft-parim">
                                <input type="checkbox" value="kinh can nam" name="category"/>
                                <span>Mắt kính cận nam</span>
                              </label>

                              <label class="product-ft-exfash">
                                <input type="checkbox" value="kinh can nu" name="category"/>
                                <span>Mắt kính cận nữ </span>
                              </label>

                              <label class="product-ft-burberry">
                                <input type="checkbox" value="kinh can tre em" name="category"/>
                                <span>Mắt kính cận trẻ em</span>
                              </label>

                              <label class="product-ft-gucci">
                                <input type="checkbox" value="kinh ram" name="category"/>
                                <span>Kính râm</span>
                              </label>

                              <label class="product-ft-parim">
                                <input type="checkbox" value="kinh can" name="category"/>
                                <span>Kính cận</span>
                              </label>

                              <label class="product-ft-versace">
                                <input type="checkbox" value="khong do" name="category"/>
                                <span>Kính không độ</span>
                              </label>

                                <label class="product-ft-versace">
                                <input type="checkbox" value="ap trong" name="category"/>
                                <span>Kính áp tròng</span>
                              </label>

                                <label class="product-ft-versace">
                                <input type="checkbox" value="cao cap" name="category"/>
                                <span>Kính thời trang cao cấp</span>
                              </label>

                                <label class="product-ft-versace">
                                <input type="checkbox" value="phu kien" name="category"/>
                                <span>Phụ kiện kính</span>
                              </label>

                                <label class="product-ft-versace">
                                <input type="checkbox" value="kinh unisex" name="category"/>
                                <span>Mắt kính unisex</span>
                              </label>

                                <label class="product-ft-versace">
                                <input type="checkbox" value="don trong" name="category"/>
                                <span>Đơn tròng</span>
                              </label>
                                <label class="product-ft-versace">
                                <input type="checkbox" value="hai trong" name="category"/>
                                <span>Hai tròng</span>
                              </label>
                                <label class="product-ft-versace">
                                <input type="checkbox" value="da trong" name="category"/>
                                <span>Da trong</span>
                              </label>

                            </div>
                            <div class="filter-footer">
                              <button type="submit" class="apply-filter">Xem kết quả</button>
                            </div>
                          </div>
                        </span>
                                    </div>

                                </div>
                            </div>
                        </form>
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
    <jsp:include page="header.jsp"/>
    <!-- ***** Footer End ***** -->
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
<script src="assets/js/doi_mau_sao_new.js"></script>
<script src="assets/js/custom.js"></script>
<script src="assets/js/handle-buttom.js"></script>
<script src="assets/js/jquery-2.1.0.min.js"></script>
<script src="assets/js/hien_thi_ten_dangnhap.js"></script>

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
