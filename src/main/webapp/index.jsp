<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="shortcut icon" href="assets/images/logo.png" type="image/x-icon">
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

    <title>EyeStyle</title>

    <!-- Additional CSS Files -->
    <link
      rel="stylesheet"
      type="text/css"
      href="assets/css/bootstrap.min.css"
    />

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css" />
 <link rel="stylesheet" href="assets/css/sanpham.css" />
     <link rel="stylesheet" href="assets/css/eyestyle.css" />


    <link rel="stylesheet" href="assets/css/owl-carousel.css" />

    <link rel="stylesheet" href="assets/css/lightbox.css" />
  
  </head>

  <body>
    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
      <div class="jumper">
        <div></div>
        <div></div>
        <div></div>
      </div>
    </div>
    <!-- ***** Preloader End ***** -->

    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <nav class="main-nav">
              <!-- ***** Logo Start ***** -->
              <a href="index.html" class="logo">
                <img src="assets/images/logo.png" />
              </a>
              <!-- ***** Logo End ***** -->
              <!-- ***** Menu Start ***** -->
              <ul class="nav">
                <li class="scroll-to-section">
                  <a href="#top" class="active">Trang chủ</a>
                </li>
                <li class="scroll-to-section">
                  <a href="#kinh_mat">Kính mát</a>
                </li>
                <li class="scroll-to-section">
                  <a href="#gong_kinh">Gọng kính</a>
                </li>
                <li class="scroll-to-section">
                  <a href="#trong_kinh">Tròng kính</a>
                </li>
                <li class="scroll-to-section">
                  <a href="#kinh_ap_trong">Kính áp tròng</a>
                </li>
                <li class="submenu">
                  <a href="javascript:;">Trang phụ</a>
                  <ul>
                    <li><a href="gong_kinh.html">Sản phẩm</a></li>
                    <li>
                      <a href="chi_tiet_san_pham.html">Chi tiết sản phẩm</a>
                    </li>
                    <li class="scroll-to-section">
                      <a href="bai_viet.html">Bài viết</a>
                    </li>
                    <li><a href="lien_he.html">Liên hệ</a></li>
                  </ul>
                </li>
                <li class="username"> 
                  <a href="dang_nhap.jsp" id="login_link"><i class="fa-solid fa-user-large"></i></a>
                  <div class=username_login id="username-info" style="display: none;"><span id="username"></span></div>
                </li>
                <li class="gio_hang_shop">
                  <a href="./gio_hang.html">
                    <span>Giỏ hàng </span>
                    <i class="fa-solid fa-cart-shopping"></i>
                  </a>
                  <div class="count_div"><span class="cart-count">0</span> </div>
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

    <!-- ***** Main Banner Area Start ***** -->
    <div class="main-banner" id="top">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-6">
            <div class="left-content">
              <div class="thumb">
                <a href="chi_tiet_san_pham.html"
                  ><img src="assets/images/left_banner_img.png" alt=""
                /></a>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="right-content">
              <div class="row">
                <div class="col-lg-6">
                  <div class="right-first-image">
                    <div class="thumb">
                      <a href=""><img src="assets/images/img_type2.jpg" /></a>
                      <div class="inner-content">
                        <p>KÍNH MÁT</p>
                        <button
                          onclick="window.location.href='kinh_mat.html';"
                        >
                          Mua ngay
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="right-first-image">
                    <div class="thumb">
                      <img src="assets/images/img_type3.jpg" />
                      <div class="inner-content">
                        <p>GỌNG KÍNH</p>
                        <button
                          onclick="window.location.href='gong_kinh.html';"
                        >
                          Mua ngay
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="right-first-image bottom_img">
                    <div class="thumb">
                      <img src="assets/images/img_type4.jpg" />
                      <div class="inner-content">
                        <p>TRÒNG KÍNH</p>
                        <button
                          onclick="window.location.href='trong_kinh.html';"
                        >
                          Mua ngay
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="right-first-image bottom_img">
                    <div class="thumb">
                      <img src="assets/images/img_type5.jpg" />
                      <div class="inner-content">
                        <p>KÍNH ÁP TRÒNG</p>
                        <button
                          onclick="window.location.href='kinh_ap_trong.html';"
                        >
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

    <!-- ***** kinh_mat Starts ***** -->
    <section class="section" id="kinh_mat">
      <div class="container">
        <div class="row content_head">
          <div class="col-lg-6">
            <div class="section-heading">
              <h2>Kính mát</h2>
              <span
                >Kính Mát Thời Thượng - Bảo Vệ Đôi Mắt, Tôn Vẻ Đẳng Cấp</span
              >
            </div>
          </div>
          <div class="col-lg-6 text-end">
            <div class="radio_gioi_tinh">
              <button class="nu btn btn-primary" onclick="showProducts('nu')">
                Nữ
              </button>
              <button class="nam btn btn-primary" onclick="showProducts('nam')">
                Nam
              </button>
            </div>
          </div>
        </div>
      </div>
      <div class="container san_pham" id="nam">
        <div class="row">
          <div class="col-lg-12">
            <div class="men-item-carousel">
              <div class="owl-men-item owl-carousel">
                <div class="item">
                  <div class="thumb">
                    <div class="hover-content">
                      <ul>
                        <li>
                          <a href="chi_tiet_san_pham.html"
                            ><i class="fa fa-eye"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#" class="rate-product"
                            ><i class="fa fa-star"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#" id="add-to-cart" class="btn_gio_hang"
                            ><i class="fa fa-shopping-cart"></i
                          ></a>
                        </li>
                      </ul>
                    </div>
                    <img src="assets/images/kinh_mat_1.jpg" alt="" />
                  </div>
                  <div class="down-content">
                    <h4>Ancci AC23506</h4>
                    <span>120.000đ</span>
                    <ul class="stars" >
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                </div>
                <div class="item">
                  <div class="thumb">
                    <div class="hover-content">
                      <ul>
                        <li>
                          <a href="chi_tiet_san_pham.html"
                            ><i class="fa fa-eye"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#" class="rate-product"
                            ><i class="fa fa-star"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#" id="add-to-cart" class="btn_gio_hang"
                            ><i class="fa fa-shopping-cart"></i
                          ></a>
                        </li>
                      </ul>
                    </div>
                    <img src="assets/images/kinh_mat_2.jpg" alt="" />
                  </div>
                  <div class="down-content">
                    <h4>Bolon BH7017</h4>
                    <span>900.000đ</span>
                    <ul class="stars">
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                </div>
                <div class="item">
                  <div class="thumb">
                    <div class="hover-content">
                      <ul>
                        <li>
                          <a href="chi_tiet_san_pham.html"
                            ><i class="fa fa-eye"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#"  class="rate-product"
                            ><i class="fa fa-star"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#" class="btn_gio_hang"
                            ><i class="fa fa-shopping-cart"></i
                          ></a>
                        </li>
                      </ul>
                    </div>
                    <img src="assets/images/kinh_mat_3.jpg" alt="" />
                  </div>
                  <div class="down-content">
                    <h4>Bolon BH5012</h4>
                    <span>350.000đ</span>
                    <ul class="stars">
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                </div>
                <div class="item">
                  <div class="thumb">
                    <div class="hover-content">
                      <ul>
                        <li>
                          <a href="chi_tiet_san_pham.html"
                            ><i class="fa fa-eye"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#" class="rate-product"
                            ><i class="fa fa-star"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#" class="btn_gio_hang"
                            ><i class="fa fa-shopping-cart"></i
                          ></a>
                        </li>
                      </ul>
                    </div>
                    <img src="assets/images/kinh_mat_4.jpg" alt="" />
                  </div>
                  <div class="down-content">
                    <h4>Bolon BH6007</h4>
                    <span>540.000đ</span>
                    <ul class="stars">
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container san_pham active" id="nu">
        <div class="row">
          <div class="col-lg-12">
            <div class="men-item-carousel">
              <div class="owl-men-item owl-carousel">
                <div class="item">
                  <div class="thumb">
                    <div class="hover-content">
                      <ul>
                        <li>
                          <a href="chi_tiet_san_pham.html"
                            ><i class="fa fa-eye"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#"  class="rate-product"
                            ><i class="fa fa-star"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#" class="btn_gio_hang"
                            ><i class="fa fa-shopping-cart"></i
                          ></a>
                        </li>
                      </ul>
                    </div>
                    <img src="assets/images/kinh_nu_1.jpg" alt="" />
                  </div>
                  <div class="down-content">
                    <h4>Ancci AC23506</h4>
                    <span>120.000đ</span>
                    <ul class="stars">
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                </div>
                <div class="item">
                  <div class="thumb">
                    <div class="hover-content">
                      <ul>
                        <li>
                          <a href="chi_tiet_san_pham.html"
                            ><i class="fa fa-eye"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#" class="rate-product"
                            ><i class="fa fa-star"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#" class="btn_gio_hang"
                            ><i class="fa fa-shopping-cart"></i
                          ></a>
                        </li>
                      </ul>
                    </div>
                    <img src="assets/images/kinh_nu_2.jpg" alt="" />
                  </div>
                  <div class="down-content">
                    <h4>Bolon BH7017</h4>
                    <span>900.000đ</span>
                    <ul class="stars">
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                </div>
                <div class="item">
                  <div class="thumb">
                    <div class="hover-content">
                      <ul>
                        <li>
                          <a href="chi_tiet_san_pham.html"
                            ><i class="fa fa-eye"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#"  class="rate-product"
                            ><i class="fa fa-star"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#" class="btn_gio_hang"
                            ><i class="fa fa-shopping-cart"></i
                          ></a>
                        </li>
                      </ul>
                    </div>
                    <img src="assets/images/kinh_nu_3.jpg" alt="" />
                  </div>
                  <div class="down-content">
                    <h4>Bolon BH5012</h4>
                    <span>350.000đ</span>
                    <ul class="stars">
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                </div>
                <div class="item">
                  <div class="thumb">
                    <div class="hover-content">
                      <ul>
                        <li>
                          <a href="chi_tiet_san_pham.html"
                            ><i class="fa fa-eye"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#" class="rate-product"
                            ><i class="fa fa-star"></i
                          ></a>
                        </li>
                        <li>
                          <a href="#" class="btn_gio_hang"
                            ><i class="fa fa-shopping-cart"></i
                          ></a>
                        </li>
                      </ul>
                    </div>
                    <img src="assets/images/kinh_nu_4.jpg" alt="" />
                  </div>
                  <div class="down-content">
                    <h4>Bolon BH6007</h4>
                    <span>540.000đ</span>
                    <ul class="stars">
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ***** kinh_mat Ends ***** -->

    <!-- ***** gọng kính Area Starts ***** -->
    <section class="section" id="gong_kinh">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div class="section-heading">
              <h2>Gọng kính</h2>
              <span
                >Gọng Kính Thời Thượng – Phong Cách Đa Dạng, Phù Hợp Mọi Gương
                Mặt</span
              >
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="women-item-carousel">
              <div class="owl-women-item owl-carousel">
                <div class="item">
                  <div class="thumb">
                    <div class="hover-content">
                      <ul>
                        <li>
                          <a href="chi_tiet_san_pham.html"
                            ><i class="fa fa-eye"></i
                          ></a>
                        </li>
                        <li>
                          <a href="" class="rate-product"
                            ><i class="fa fa-star"></i
                          ></a>
                        </li>
                        <li>
                          <a href="" class="btn_gio_hang"
                            ><i class="fa fa-shopping-cart"></i
                          ></a>
                        </li>
                      </ul>
                    </div>
                    <img src="assets/images/gong_kinh_1.jpg" alt="" />
                  </div>
                  <div class="down-content">
                    <h4>Colandad23425</h4>
                    <span>500.000đ</span>
                    <ul class="stars">
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                </div>
                <div class="item">
                  <div class="thumb">
                    <div class="hover-content">
                      <ul>
                        <li>
                          <a href="chi_tiet_san_pham.html"
                            ><i class="fa fa-eye"></i
                          ></a>
                        </li>
                        <li>
                          <a href="" class="rate-product"
                            ><i class="fa fa-star"></i
                          ></a>
                        </li>
                        <li>
                          <a href="" class="btn_gio_hang"
                            ><i class="fa fa-shopping-cart"></i
                          ></a>
                        </li>
                      </ul>
                    </div>
                    <img src="assets/images/gong_kinh_2.jpg" alt="" />
                  </div>
                  <div class="down-content">
                    <h4>ThancoBaX234</h4>
                    <span>450.000đ</span>
                    <ul class="stars">
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                </div>
                <div class="item">
                  <div class="thumb">
                    <div class="hover-content">
                      <ul>
                        <li>
                          <a href="chi_tiet_san_pham.html"
                            ><i class="fa fa-eye"></i
                          ></a>
                        </li>
                        <li>
                          <a href="" class="rate-product"
                            ><i class="fa fa-star"></i
                          ></a>
                        </li>
                        <li>
                          <a href="" class="btn_gio_hang" 
                            ><i class="fa fa-shopping-cart"></i
                          ></a>
                        </li>
                      </ul>
                    </div>
                    <img src="assets/images/gong_kinh_3.jpg" alt="" />
                  </div>
                  <div class="down-content">
                    <h4>SpringBY1234</h4>
                    <span>330.000đ</span>
                    <ul class="stars">
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                </div>
                <div class="item">
                  <div class="thumb">
                    <div class="hover-content">
                      <ul>
                        <li>
                          <a href="chi_tiet_san_pham.html"
                            ><i class="fa fa-eye"></i
                          ></a>
                        </li>
                        <li>
                          <a href="" class="rate-product"
                            ><i class="fa fa-star"></i
                          ></a>
                        </li>
                        <li>
                          <a href="" class="btn_gio_hang"
                            ><i class="fa fa-shopping-cart"></i
                          ></a>
                        </li>
                      </ul>
                    </div>
                    <img src="assets/images/gong_kinh_4.jpg" alt="" />
                  </div>
                  <div class="down-content">
                    <h4>TutorialEyeG678</h4>
                    <span>340.000đ</span>
                    <ul class="stars">
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                </div>
              </div>
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
           <a href="./trong_kinh_don_trong.html"> <img src="./assets/images/trong_kinh_type_1.jpg" alt="" /></a>
          </div>
          <div class="col-lg-4 img_trong">
          <a href="./trong_kinh_hai_trong.html">  <img src="./assets/images/trong_kinh_type_2.jpg" alt="" /></a>
          </div>
          <div class="col-lg-4 img_trong">
           <a href="./trong_kinh_da_trong.html"> <img src="./assets/images/trong_kinh_type_3.jpg" alt="" /></a>
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
          <div class="col-lg-3 san_pham_kat">
            <div class="item">
              <div class="thumb">
                <div class="hover-content">
                  <ul>
                    <li>
                      <a href="chi_tiet_san_pham.html"
                        ><i class="fa fa-eye"></i
                      ></a>
                    </li>
                    <li>
                      <a href="gio_hang.html" class="btn_gio_hang"
                        ><i class="fa fa-shopping-cart"></i
                      ></a>
                    </li>
                  </ul>
                </div>
                <img src="./assets/images/kinh_ap_trong_1.jpg" alt="">
              </div>
              <div class="down-content">
                <h4>Kính áp tròng 1-Day Acuvue® Define® – Lens màu đẹp tự nhiên
                </h4>
                <span>1.000.000đ</span>
              </div>
            </div>
          </div>
          <div class="col-lg-3 san_pham_kat">
            <div class="item">
              <div class="thumb">
                <div class="hover-content">
                  <ul>
                    <li>
                      <a href="chi_tiet_san_pham.html"
                        ><i class="fa fa-eye"></i
                      ></a>
                    </li>
                    <li>
                      <a href="gio_hang.html" class="btn_gio_hang"
                        ><i class="fa fa-shopping-cart"></i
                      ></a>
                    </li>
                  </ul>
                </div>
                <img src="./assets/images/kinh_ap_trong_2.jpg" alt="">
              </div>
               <div class="down-content">
                <h4>Kính áp tròng Acuvue® Vita™ HÀNG THÁNG</h4>
                <span>500.000đ</span>
                </div>
            </div>
          </div>
          <div class="col-lg-3 san_pham_kat">
            <div class="item">
              <div class="thumb">
                <div class="hover-content">
                  <ul>
                    <li>
                      <a href="chi_tiet_san_pham.html"
                        ><i class="fa fa-eye"></i
                      ></a>
                    </li>
                    <li>
                      <a href="gio_hang.html" class="btn_gio_hang"
                        ><i class="fa fa-shopping-cart"></i
                      ></a>
                    </li>
                  </ul>
                </div>
                <img src="./assets/images/kinh_ap_trong_3.jpg" alt="">
              </div>
               <div class="down-content">
                <h4>Kính áp tròng 2 TUẦN Acuvue® Oasys® – Dành cho dân văn phòng</h4>
                <span>350.000đ</span>
               </div>
            </div>
          </div>
          <div class="col-lg-3 san_pham_kat">
            <div class="item">
              <div class="thumb">
                <div class="hover-content">
                  <ul>
                    <li>
                      <a href="chi_tiet_san_pham.html"
                        ><i class="fa fa-eye"></i
                      ></a>
                    </li>
                    <li>
                      <a href="gio_hang.html" class="btn_gio_hang"
                        ><i class="fa fa-shopping-cart"></i
                      ></a>
                    </li>
                  </ul>
                </div>
                <img src="./assets/images/kinh_ap_trong_4.jpg" alt="">
              </div>
              <div class="down-content">
                <h4>Kính áp tròng 1-Day Acuvue® Moist® – Dành cho mắt kích ứng</h4>
                <span>580.000đ</span>
              </div>
            </div>
          </div>
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
                Bộ sưu tập mắt kính mùa hè với các thiết kế đa dạng giúp bạn không chỉ thể hiện cá tính mà còn bảo vệ đôi mắt khỏi tác hại của tia UV. 
              </p>
              <p>
                Với màu sắc và kiểu dáng từ năng động đến thanh lịch, bộ sưu tập này chắc chắn sẽ là người bạn đồng hành hoàn hảo cho mỗi chuyến du lịch, dạo phố hay các buổi tiệc ngoài trời.
                a little via PayPal. Please also tell your friends about our
                great website. Thank you.
              </p>
              <div class="main-border-button">
                <a href="brand_rayban_avirator.html">Khám phá thêm</a>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="right-content">
              <div class="row">
                <div class="col-lg-6">
                  <div class="first-image">
                    <a href="brand_rayban_avirator.html"><img src="assets/images/bst_1.jpg" alt="" /></a>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="first-image">
                    <a href="brand_rayban_wayfarer.html"><img src="assets/images/bst_2.jpg" alt="" /></a>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="first-image">
                   <a href="brand_rayban_reverse.html"> <img src="assets/images/bst_3.jpg" alt="" /></a>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="first-image">
                    <a href="brand_rayBan_clubmaster.html"><img src="assets/images/bst_4.jpg" alt="" /></a>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="first-image">
                    <a href="brand_rayban_change.html"><img src="assets/images/bst_5.jpg" alt="" /></a>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="first-image">
                   <a href="brand_rayban_transition.html"> <img src="assets/images/bst_6.jpg" alt="" /></a>
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
              <span
                >Chọn Lựa Hoàn Hảo: Top Thương Hiệu Mắt Kính Sang Trọng Bạn Nên Sở Hữu.</span
              >
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row images">
          <div class="col-2 image_brand">
             <a href="gong_kinh_cartier.html"><img src="./assets/images/cartier1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_rayban.html"><img src="./assets/images/rayBan1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_gucci.html"><img src="./assets/images/gucci1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_dior.html"><img src="./assets/images/dior1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_montblanc.html"><img src="./assets/images/montblanc1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_molsion.html"><img src="./assets/images/molsion1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_bolon.html"><img src="./assets/images/bolon1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_furla.html"><img src="./assets/images/furla1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_prada.html"><img src="./assets/images/prada1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_oakley.html"><img src="./assets/images/bakley1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_parim.html"><img src="./assets/images/parim1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_burberry.html"><img src="./assets/images/burberry1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_chopard.html"><img src="./assets/images/chopard.webp" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_versace.html"><img src="./assets/images/versace1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_police.html"><img src="./assets/images/police1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_eyescloud.html"><img src="./assets/images/eyeclouds1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_daniel_wellington.html"><img src="./assets/images/daniel-wellington1.jpg" alt=""></a>
          </div>
          <div class="col-2 image_brand">
            <a href="gong_kinh_exfash.html"><img src="./assets/images/exfash1.jpg" alt=""></a>
          </div>
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
              <span
                >Cập nhật nhanh các sản phẩm mới nhất từ chúng tôi!</span
              >
            </div>
            <form id="subscribe" action="" method="get">
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
                      type="text"
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
                      class="main-dark-button"
                    >
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
                  <li>
                    Địa chỉ cửa hàng:<br /><span
                      >Nông Lâm, Thành phố Hồ Chí Minh</span
                    >
                  </li>
                  <li>Số điện thoại:<br /><span>0123 456 789</span></li>
                  <li>Địa chỉ văn phòng:<br /><span>Rạng Đông 306</span></li>
                </ul>
              </div>
              <div class="col-6">
                <ul>
                  <li>
                    Giờ làm việc:<br /><span>07:30 sáng - 9:30 tối Giờ hành chính</span>
                  </li>
                  <li>Email:<br /><span>nhom65@company.com</span></li>
                  <li>
                    Mạng xã hội:<br /><span
                      ><a href="#">Facebook</a>, <a href="#">Instagram</a>,
                      <a href="#">Behance</a>, <a href="#">Linkedin</a></span
                    >
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
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-3 inf_first">
            <div class="first-item">
              <div class="logo">
                <img
                  src="./assets/images/logo.png"
                  alt="eyestyle nhom 65"
                />
              </div>
              <ul>
                <li>
                  <a href="#"
                    >Đại học Nông Lâm TPHCM</a
                  >
                </li>
                <li><a href="#">nhom65@company.com</a></li>
                <li><a href="#">0123 456 789</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-3 inf">
            <h4>Mua sắm &amp; Danh mục</h4>
            <ul>
              <li><a href="kinh_mat.html">Kính mát</a></li>
              <li><a href="gong_kinh.html">Gọng kính</a></li>
              <li><a href="trong_kinh.html">Tròng kính</a></li>
              <li><a href="kinh_ap_trong.html">Kính áp tròng</a></li>
            </ul>
          </div>
          <div class="col-lg-3 inf">
            <h4>Trợ giúp &amp; Thông tin</h4>
            <ul>
              <li><a href="#">Sản phẩm cập nhật</a></li>
              <li><a href="./bai_viet.html">Đời sống</a></li>
              <li><a href="./gio_hang.html">Vận chuyển</a></li>
              <li><a href="./lien_he.html">Liên hệ hỗ trợ</a></li>
            </ul>
          </div>
          <div class="col-lg-3 inf">
            <h4>Điều hướng</h4>
            <ul>
              <li><a href="#">Trang chủ</a></li>
              <li><a href="gong_kinh.html">Sản phẩm</a></li>
              <li><a href="./lien_he.html">Liên hệ</a></li>
              <li><a href="./bai_viet.html">Bài viết</a></li>
            </ul>
          </div>
          <div class="col-lg-12">
            <div class="under-footer">
              <p>
                Group65 © 2022 HexaShop Co., Ltd. All Rights Reserved.

                <br />Design:
                <a
                  href="#"
                  >Group 65</a
                >
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
        <div class="close-icon" id="closeIcon" style="display: none;">
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
          <input type="text" placeholder="Tên của bạn" required>
          <input type="phone" placeholder="Phone" required>
          <textarea placeholder="Tin nhắn của bạn" rows="3" required style="resize: none;"></textarea>
          <div class="submit_container">
            <button type="submit" class="submit-btn">
                <i class="fa-solid fa-paper-plane"></i>
            </button>
          </div>
        </form>
      </div>
      <!-- chat box ở phần footer End-->

    </footer>
   <!-- ***** Footer End ***** -->

   <!-- confirm diolog Start-->
    <!-- <div id="confirmDialog" class="confirm-dialog">
     <div class="dialog-content">
      <p>Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?</p>
      <button id="confirmYes">Có</button>
      <button id="confirmNo">Không</button>
     </div>
    </div> -->
   <!-- confirm diolog End-->

    <!-- jQuery -->
    <script src="assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/phan-loai-gioi-tinh.js
    "></script>
    <script src="assets/js/accordions.js"></script>
    <script src="assets/js/datepicker.js"></script>
    <script src="assets/js/scrollreveal.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/add-to_cart.js"></script>
    <script src="assets/js/imgfix.min.js"></script>
    <script src="assets/js/slick.js"></script>
    <script src="assets/js/lightbox.js"></script>
    <script src="assets/js/isotope.js"></script>
    <script src="assets/js/back_to_top.js"></script>
    <script src="assets/js/toggle.js"></script>
    <script src="assets/js/chat_box.js"></script>
    <script src="assets/js/doi_mau_sao.js"></script>
    <script src="assets/js/gio_hang.js" defer></script>
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