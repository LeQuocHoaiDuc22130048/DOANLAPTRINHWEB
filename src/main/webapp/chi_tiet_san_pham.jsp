<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./assets/css/font-awesome.css" />
    <link rel="stylesheet" href="./assets/css/style-for-products.css" />
    <link rel="stylesheet" href="./assets/css/owl-carousel.css" />
    <link rel="stylesheet" href="./assets/css/lightbox.css" />
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
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="index" class="logo">
                            <img src="assets/images/logo.png" />
                        </a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li class="scroll-to-section">
                                <a href="index">Trang chủ</a>
                            </li>
                            <li class="scroll-to-section">
                                <a href="kinh_mat.html">Kính mát</a>
                                <%--                    <div class="sub-menu nav-dropdown">--%>
                                <%--                      <div id="col-142015409" class="col medium-6 large-6">--%>
                                <%--                        <div class="col-inner">--%>
                                <%--                          <div id="text-2480338525" class="text">--%>
                                <%--                            <h3>--%>
                                <%--                              <span>--%>
                                <%--                                <strong>thương hiệu</strong>--%>
                                <%--                              </span>--%>
                                <%--                            </h3>--%>
                                <%--                          </div>--%>
                                <%--                          <div class="row" id="row-1905057003">--%>
                                <%--                            <div--%>
                                <%--                              id="col-884114443"--%>
                                <%--                              class="col medium-3 small-12 large-3"--%>
                                <%--                            >--%>
                                <%--                              <div class="col-inner">--%>
                                <%--                                <div--%>
                                <%--                                  class="img has-hover x md-x lg-x y md-y lg-y"--%>
                                <%--                                  id="image_578401213"--%>
                                <%--                                >--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_dior.html">--%>
                                <%--                                    <img src="assets/images/dior.jpg" alt="" />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_cartier.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/cartier.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_versace.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/versace-1.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_gucci.html">--%>
                                <%--                                    <img src="assets/images/gucci.jpg" alt="" />--%>
                                <%--                                  </a>--%>
                                <%--                                </div>--%>
                                <%--                              </div>--%>
                                <%--                            </div>--%>

                                <%--                            <div--%>
                                <%--                              id="col-884114443"--%>
                                <%--                              class="col medium-3 small-12 large-3"--%>
                                <%--                            >--%>
                                <%--                              <div class="col-inner">--%>
                                <%--                                <div--%>
                                <%--                                  class="img has-hover x md-x lg-x y md-y lg-y"--%>
                                <%--                                  id="image_578401213"--%>
                                <%--                                >--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_montblanc.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/montblanc.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_rayban.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/rayban.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_burberry.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/burberry-1.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_prada.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/logo-prada.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                </div>--%>
                                <%--                              </div>--%>
                                <%--                            </div>--%>

                                <%--                            <div--%>
                                <%--                              id="col-884114443"--%>
                                <%--                              class="col medium-3 small-12 large-3"--%>
                                <%--                            >--%>
                                <%--                              <div class="col-inner">--%>
                                <%--                                <div--%>
                                <%--                                  class="img has-hover x md-x lg-x y md-y lg-y"--%>
                                <%--                                  id="image_578401213"--%>
                                <%--                                >--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_police.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/police.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_chopard.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/Chopard.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_daniel_wellington.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/daniel-wellington.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_parim.html">--%>
                                <%--                                    <img src="assets/images/parim.jpg" alt="" />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_oakley.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/oakley.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                </div>--%>
                                <%--                              </div>--%>
                                <%--                            </div>--%>

                                <%--                            <div--%>
                                <%--                              id="col-884114443"--%>
                                <%--                              class="col medium-3 small-12 large-3"--%>
                                <%--                            >--%>
                                <%--                              <div class="col-inner">--%>
                                <%--                                <div--%>
                                <%--                                  class="img has-hover x md-x lg-x y md-y lg-y"--%>
                                <%--                                  id="image_578401213"--%>
                                <%--                                >--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_molsion.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/molsion.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_exfash.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/exfash.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_furla.html">--%>
                                <%--                                    <img src="assets/images/furla.jpg" alt="" />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_bolon.html">--%>
                                <%--                                    <img src="assets/images/bolon.jpg" alt="" />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_eyescloud.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/eyescloud.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                </div>--%>
                                <%--                              </div>--%>
                                <%--                            </div>--%>
                                <%--                          </div>--%>
                                <%--                        </div>--%>
                                <%--                      </div>--%>
                                <%--                    </div>--%>
                            </li>
                            <li class="scroll-to-section">
                                <a href="#">Gọng kính</a>
                                <%--                    <div class="sub-menu nav-dropdown">--%>
                                <%--                      <div id="col-142015409" class="col medium-6 large-6">--%>
                                <%--                        <div class="col-inner">--%>
                                <%--                          <div id="text-2480338525" class="text">--%>
                                <%--                            <h3>--%>
                                <%--                              <span>--%>
                                <%--                                <strong>thương hiệu</strong>--%>
                                <%--                              </span>--%>
                                <%--                            </h3>--%>
                                <%--                          </div>--%>
                                <%--                          <div class="row" id="row-1905057003">--%>
                                <%--                            <div--%>
                                <%--                              id="col-884114443"--%>
                                <%--                              class="col medium-3 small-12 large-3"--%>
                                <%--                            >--%>
                                <%--                              <div class="col-inner">--%>
                                <%--                                <div--%>
                                <%--                                  class="img has-hover x md-x lg-x y md-y lg-y"--%>
                                <%--                                  id="image_578401213"--%>
                                <%--                                >--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_dior.html">--%>
                                <%--                                    <img src="assets/images/dior.jpg" alt="" />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_cartier.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/cartier.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_versace.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/versace-1.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_gucci.html">--%>
                                <%--                                    <img src="assets/images/gucci.jpg" alt="" />--%>
                                <%--                                  </a>--%>
                                <%--                                </div>--%>
                                <%--                              </div>--%>
                                <%--                            </div>--%>

                                <%--                            <div--%>
                                <%--                              id="col-884114443"--%>
                                <%--                              class="col medium-3 small-12 large-3"--%>
                                <%--                            >--%>
                                <%--                              <div class="col-inner">--%>
                                <%--                                <div--%>
                                <%--                                  class="img has-hover x md-x lg-x y md-y lg-y"--%>
                                <%--                                  id="image_578401213"--%>
                                <%--                                >--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_montblanc.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/montblanc.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_rayban.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/rayban.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_burberry.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/burberry-1.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_prada.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/logo-prada.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                </div>--%>
                                <%--                              </div>--%>
                                <%--                            </div>--%>

                                <%--                            <div--%>
                                <%--                              id="col-884114443"--%>
                                <%--                              class="col medium-3 small-12 large-3"--%>
                                <%--                            >--%>
                                <%--                              <div class="col-inner">--%>
                                <%--                                <div--%>
                                <%--                                  class="img has-hover x md-x lg-x y md-y lg-y"--%>
                                <%--                                  id="image_578401213"--%>
                                <%--                                >--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_police.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/police.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_chopard.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/Chopard.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_daniel_wellington.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/daniel-wellington.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_parim.html">--%>
                                <%--                                    <img src="assets/images/parim.jpg" alt="" />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_oakley.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/oakley.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                </div>--%>
                                <%--                              </div>--%>
                                <%--                            </div>--%>

                                <%--                            <div--%>
                                <%--                              id="col-884114443"--%>
                                <%--                              class="col medium-3 small-12 large-3"--%>
                                <%--                            >--%>
                                <%--                              <div class="col-inner">--%>
                                <%--                                <div--%>
                                <%--                                  class="img has-hover x md-x lg-x y md-y lg-y"--%>
                                <%--                                  id="image_578401213"--%>
                                <%--                                >--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_molsion.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/molsion.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_exfash.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/exfash.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_furla.html">--%>
                                <%--                                    <img src="assets/images/furla.jpg" alt="" />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_bolon.html">--%>
                                <%--                                    <img src="assets/images/bolon.jpg" alt="" />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="gong_kinh_eyescloud.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/eyescloud.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                </div>--%>
                                <%--                              </div>--%>
                                <%--                            </div>--%>
                                <%--                          </div>--%>
                                <%--                        </div>--%>
                                <%--                      </div>--%>
                                <%--                    </div>--%>
                            </li>
                            <li class="scroll-to-section">
                                <a href="trong_kinh.html">Tròng kính</a>
                                <%--                    <div class="sub-menu nav-dropdown">--%>
                                <%--                      <div id="col-142015409" class="col medium-6 large-6">--%>
                                <%--                        <div class="col-inner">--%>
                                <%--                          <div id="text-2480338525" class="text">--%>
                                <%--                            <h3>--%>
                                <%--                              <span>--%>
                                <%--                                <strong>thương hiệu</strong>--%>
                                <%--                              </span>--%>
                                <%--                            </h3>--%>
                                <%--                          </div>--%>
                                <%--                          <div class="row trong_kinh" id="row-1905057003">--%>
                                <%--                            <div--%>
                                <%--                              id="col-884114443"--%>
                                <%--                              class="col medium-3 small-12 large-3"--%>
                                <%--                            >--%>
                                <%--                              <div class="col-inner">--%>
                                <%--                                <div--%>
                                <%--                                  class="img has-hover x md-x lg-x y md-y lg-y"--%>
                                <%--                                  id="image_578401213"--%>
                                <%--                                >--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="trong_kinh_tog.html">--%>
                                <%--                                    <img src="assets/images/TOG.jpg" alt="" />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="trong_kinh_essilor.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/logo-essilor.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                </div>--%>
                                <%--                              </div>--%>
                                <%--                            </div>--%>

                                <%--                            <div--%>
                                <%--                              id="col-193198903"--%>
                                <%--                              class="col medium-3 small-12 large-3"--%>
                                <%--                            >--%>
                                <%--                              <div class="col-inner">--%>
                                <%--                                <div--%>
                                <%--                                  class="img has-hover x md-x lg-x y md-y lg-y"--%>
                                <%--                                  id="image_578401213"--%>
                                <%--                                >--%>
                                <%--                                  <a--%>
                                <%--                                    class="img-inner image-zoom-fade dark"--%>
                                <%--                                    style="height: 50px"--%>
                                <%--                                    href="trong_kinh_rodenstock.html"--%>
                                <%--                                  >--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/icon-rodenstock.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                      style="height: 50px"--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                  <a--%>
                                <%--                                    class="img-inner image-zoom-fade dark"--%>
                                <%--                                    style="height: 50px"--%>
                                <%--                                    href="trong_kinh_zeiss.html"--%>
                                <%--                                  >--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/zeiss-logo-rgb_2023.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                      style="height: 50px"--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                </div>--%>
                                <%--                              </div>--%>
                                <%--                            </div>--%>

                                <%--                            <div--%>
                                <%--                              id="col-884114443"--%>
                                <%--                              class="col medium-3 small-12 large-3"--%>
                                <%--                            >--%>
                                <%--                              <div class="col-inner">--%>
                                <%--                                <div--%>
                                <%--                                  class="img has-hover x md-x lg-x y md-y lg-y"--%>
                                <%--                                  id="image_578401213"--%>
                                <%--                                >--%>
                                <%--                                  <a class="img-inner image-zoom-fade dark" href="trong_kinh_Levalens.html">--%>
                                <%--                                    <img--%>
                                <%--                                      src="assets/images/Levalens.jpg"--%>
                                <%--                                      alt=""--%>
                                <%--                                    />--%>
                                <%--                                  </a>--%>
                                <%--                                </div>--%>
                                <%--                              </div>--%>
                                <%--                            </div>--%>
                                <%--                          </div>--%>
                                <%--                        </div>--%>
                                <%--                      </div>--%>
                                <%--                    </div>--%>
                            </li>
                            <li class="scroll-to-section">
                                <a href="kinh_ap_trong.html">Kính áp tròng</a>
                            </li>
                            <li class="submenu">
                                <a href="javascript:;">Trang phụ</a>
                                <ul>
                                    <li><a href="gong_kinh.html">Sản phẩm</a></li>
                                    <li>
                                        <a href="chi_tiet_san_pham.jsp">Chi tiết sản phẩm</a>
                                    </li>
                                    <li class="scroll-to-section">
                                        <a href="bai_viet.html">Bài viết</a>
                                    </li>
                                    <li><a href="lien_he.jsp">Liên hệ</a></li>
                                </ul>
                            </li>
                            <li class="username">
                                <a href="dang_nhap.html" id="login_link"
                                ><i class="fa-solid fa-user-large"></i
                                ></a>
                                <div
                                        class="username_login"
                                        id="username-info"
                                        style="display: none"
                                >
                                    <span id="username"></span>
                                </div>
                            </li>
                            <li class="gio_hang_shop">
                                <a href="gio_hang.jsp">
                                    <span>Giỏ hàng </span>
                                    <i class="fa-solid fa-cart-shopping"></i>
                                </a>
                                <div class="count_div">
                                    <span class="cart-count">0</span>
                                </div>
                            </li>
                        </ul>
                        <a class="menu-trigger">
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>

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
                            <img src="${product.path_image}" alt="" />
                        </div>
                        <div class="col-4-images">
                            <img src="${images[1].path}" alt="" />
                        </div>
                        <div class="col-4-images">
                            <img src="${images[2].path}" alt="" />
                        </div>
                        <div class="col-4-images">
                            <img src="${images[0].path}" alt="" />
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

                        <div class="quantity button-added">
                            <input type="button" value="-" class="minus" />
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
                            <input type="button" value="+" class="plus" />
                        </div>
                        <div class="add-to-cart-container form-normal is-large">
                            <form action="add-cart" method="post">
                                <input type="hidden" name="id" value="${product.id}" /> <!-- ID sản phẩm -->
                                <button type="submit" id="add-to-cart" class="single_add_to_cart_button button alt">
                                    Thêm vào giỏ hàng
                                </button>
                            </form>
                        </div>
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

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 inf_first">
                    <div class="first-item">
                        <div class="logo">
                            <img src="./assets/images/logo.png" alt="eyestyle nhom 65" />
                        </div>
                        <ul>
                            <li>
                                <a href="#">Đại học Nông Lâm TPHCM</a>
                            </li>
                            <li><a href="#">nhom65@company.com</a></li>
                            <li><a href="#">0123 456 789</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 inf">
                    <h4>Mua sắm &amp; Danh mục</h4>
                    <ul>
                        <li><a href="./chi_tiet_san_pham.html">Kính mát</a></li>
                        <li><a href="./chi_tiet_san_pham.html">Gọng kính</a></li>
                        <li><a href="./chi_tiet_san_pham.html">Tròng kính</a></li>
                        <li><a href="./chi_tiet_san_pham.html">Kính áp tròng</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 inf">
                    <h4>Trợ giúp &amp; Thông tin</h4>
                    <ul>
                        <li><a href="#">Sản phẩm cập nhật</a></li>
                        <li><a href="./bai_viet.html">Đời sống</a></li>
                        <li><a href="gio_hang.jsp">Vận chuyển</a></li>
                        <li><a href="lien_he.jsp">Liên hệ hỗ trợ</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 inf">
                    <h4>Điều hướng</h4>
                    <ul>
                        <li><a href="#">Trang chủ</a></li>
                        <li><a href="./san_pham.html">Sản phẩm</a></li>
                        <li><a href="lien_he.jsp">Liên hệ</a></li>
                        <li><a href="./bai_viet.html">Bài viết</a></li>
                    </ul>
                </div>
                <div class="col-lg-12">
                    <div class="under-footer">
                        <p>
                            Group65 © 2022 HexaShop Co., Ltd. All Rights Reserved.

                            <br />Design:
                            <a href="#">Group 65</a>
                        </p>
                        <ul>
                            <li>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-behance"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--nút di chuyển lên đầu trang-->
        <a href="#top" class="btn_di_chuyen" id="backToTop">
            <i class="fa-solid fa-angle-up"></i>
        </a>

        <!-- chat box ở phần footer Start-->
        <div id="chatButton">
            <div class="hamburger" id="hamburgerIcon">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <div class="close-icon" id="closeIcon" style="display: none">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>

        <!-- Chat Box -->
        <div id="chatBox">
            <h2>Chuyên viên tư vấn</h2>
            <div class="status">Online</div>
            <p>Hỏi chúng tôi bất cứ điều gì. Chúng tôi sẽ trả lời ngay lập tức</p>
            <form>
                <input type="text" placeholder="Tên của bạn" required />
                <input type="tel" placeholder="Số điện thoại" required />
                <textarea
                        placeholder="Tin nhắn của bạn"
                        rows="3"
                        required
                        style="resize: none"
                ></textarea>
                <div class="submit_container">
                    <button type="submit" class="submit-btn">
                        <i class="fa-solid fa-paper-plane"></i>
                    </button>
                </div>
            </form>
        </div>
        <!-- chat box ở phần footer End-->
    </footer>
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
