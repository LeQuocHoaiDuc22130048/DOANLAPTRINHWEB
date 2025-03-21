<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <form action="filter" class="product-ordering" method="POST">
                            <div class="productfilter_filter_wrapper productfilter_columns_3">
                                <div class="product-filter-inner">
                                    <div class="prodctfilter_filter productfilter_pa_thuong-hieu">
                                        <label>
                                            <input class="d-none" checked type="text" name="type" value="brand_id"/>
                                        </label>
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
                                            <img src="${product.path}" alt="${product.name}" class="product-image w-100">
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
<c:import url="script.jsp"/>
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
