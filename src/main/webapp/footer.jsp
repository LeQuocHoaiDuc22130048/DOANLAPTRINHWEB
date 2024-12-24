<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 inf_first">
                <div class="first-item">
                    <div class="logo">
                        <img
                                src="assets/images/logo.png"
                                alt="eyestyle nhom 65"
                        />
                    </div>
                    <ul>
                        <li>
                            <a href="index.jsp"
                            >Đại học Nông Lâm TPHCM</a
                            >
                        </li>
                        <li><a href="index.jsp">nhom65@company.com</a></li>
                        <li><a href="index.jsp">0123 456 789</a></li>
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
                    <li><a href="index.jsp">Sản phẩm cập nhật</a></li>
                    <li><a href="bai_viet.html">Đời sống</a></li>
                    <li><a href="gio_hang.jsp">Vận chuyển</a></li>
                    <li><a href="lien_he.html">Liên hệ hỗ trợ</a></li>
                </ul>
            </div>
            <div class="col-lg-3 inf">
                <h4>Điều hướng</h4>
                <ul>
                    <li><a href="index.jsp">Trang chủ</a></li>
                    <li><a href="gong_kinh.html">Sản phẩm</a></li>
                    <li><a href="lien_he.html">Liên hệ</a></li>
                    <li><a href="bai_viet.html">Bài viết</a></li>
                </ul>
            </div>
            <div class="col-lg-12">
                <div class="under-footer">
                    <p>
                        Group65 © 2022 HexaShop Co., Ltd. All Rights Reserved.

                        <br />Design:
                        <a
                                href="index.jsp"
                        >Group 65</a
                        >
                    </p>
                    <ul>
                        <li>
                            <a href="index.jsp"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="index.jsp"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="index.jsp"><i class="fa fa-linkedin"></i></a>
                        </li>
                        <li>
                            <a href="index.jsp"><i class="fa fa-behance"></i></a>
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
            <input type="tel" placeholder="Phone" required>
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
