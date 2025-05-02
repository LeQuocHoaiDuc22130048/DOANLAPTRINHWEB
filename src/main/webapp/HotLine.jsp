<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>EyeStyle - Liên hệ</title>
    <c:import url="Link.jsp"/>
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
    <jsp:include page="Header.jsp"/>
    <!-- ***** Header Area End ***** -->

    <!-- ***** Main Banner Area Start ***** -->
    <!-- page-heading  about-page-heading-->
    <div class="page-contact" id="top"></div>
    <!-- ***** Main Banner Area End ***** -->

    <!-- ***** Contact Area Starts ***** -->
    <div class="contact-us">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div id="map">
              <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.2145255159307!2d106.7891867737763!3d10.871281657439477!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRQLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1730726996001!5m2!1svi!2s"
                width="100%"
                height="400px"
                frameborder="0"
                style="border: 0"
                allowfullscreen
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"
              ></iframe>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="section-heading">
              <h2>Địa chỉ cửa hàng</h2>
              <span
                >Hãy ghé thăm và trải nghiệm dịch vụ tuyệt vời ngay hôm
                nay!</span
              >
              <p class="first_add last_add">
                <b
                  >Rạng Đông 306, Trường Đại học Nông Lâm Thành phố Hồ Chí
                  Minh</b
                >
              </p>
              <p class="last_add">
                <b>Thương hiệu gọng: </b>Prada, Cartier, Dior, Gucci, Montblanc,
                Molsion, RayBan, Chopard, Versace, Chrome Hearts, Daniel
                Wellington, Burberry, Bolon, Parim, Oakley, Exfash, Furla,…
              </p>
              <p class="last_add">
                <b>Thương hiệu tròng: </b>Rodenstock, Essilor, Zeiss, TOG,
                Levalens
              </p>
              <p class="img_add">
                <img
                  src="assets/images/Website/icn-tel.webp"
                  alt="tel"
                  width="20px"
                  height="20px"
                /><span>0123 456 789</span>
                <br />
                <img
                  src="assets/images/Website/icn-email-us.webp"
                  alt="hộp thư"
                  width="20px"
                  height="20px"
                /><span>nhom65@company.com</span>
              </p>
              <a href="tel:0123 456 789" class="btn_tel"><b>Gọi ngay</b></a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- ***** Contact Area Ends ***** -->

    <!-- ***** Subscribe Area Starts ***** -->
    <div class="subscribe">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="section-heading">
              <h2>Nhận tin mới nhất về sản phẩm bằng cách đăng ký bản tin!</h2>
              <span>Cập nhật nhanh các sản phẩm mới nhất từ chúng tôi!</span>
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
                    Giờ làm việc:<br /><span
                      >07:30 sáng - 9:30 tối Giờ hành chính</span
                    >
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
    <jsp:include page="Footer.jsp"/>
    <!-- ***** Footer End ***** -->

     <c:import url="Script.jsp"/>
    <script src="assets/js/newsletter_subscribe.js"></script>
  </body>
</html>
