<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                            <a href="index" class="active">Trang chủ</a>
                        </li>
                        <li class="scroll-to-section">
                            <a href="index#kinh_mat">Kính mát</a>
                        </li>
                        <li class="scroll-to-section">
                            <a href="index#gong_kinh">Gọng kính</a>
                        </li>
                        <li class="scroll-to-section">
                            <a href="index#trong_kinh">Tròng kính</a>
                        </li>
                        <li class="scroll-to-section">
                            <a href="index#kinh_ap_trong">Kính áp tròng</a>
                        </li>
                        <li class="submenu">
                            <a href="javascript:;">Trang phụ</a>
                            <ul>
                                <li><a href="gong_kinh.jsp">Sản phẩm</a></li>
                                <li>
                                    <a href="chi_tiet_san_pham.jsp">Chi tiết sản phẩm</a>
                                </li>
                                <li class="scroll-to-section">
                                    <a href="bai_viet.jsp">Bài viết</a>
                                </li>
                                <li><a href="lien_he.jsp">Liên hệ</a></li>
                            </ul>
                        </li>
                        <li class="username">
                            <a href="dang_nhap.jsp" id="login_link"><i class="fa-solid fa-user-large"></i></a>
                            <div class=username_login id="username-info" style="display: none;"><span id="username"></span></div>
                        </li>
                        <li class="gio_hang_shop">
                            <a href="./gio_hang.jsp">
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
