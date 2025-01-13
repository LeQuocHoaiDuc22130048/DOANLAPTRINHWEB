<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 1/10/2025
  Time: 7:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="asset/css/style.css">
</head>
<body>
<div class="admin-content-top">
    <div class="admin-content-top-left">
        <ul class="flex-box">
            <li>
                <input type="text" placeholder="Tìm kiếm sản phẩm" class="find-products"
                       style="width: 50vw;padding: 10px;border-radius: 10px;border: none;outline: none;">
                <button class="btn-find"
                        style="background: #2e404f; color: white; padding: 10px; border-radius: 10px; cursor: pointer; border: none; outline: none">
                    <i class="ri-search-line" style="margin: 0;"></i></button>
            </li>
        </ul>
    </div>
    <div class="admin-content-top-right">
        <ul class="flex-box">
            <li></li>
            <li>

            </li>
            <li class="flex-box"><img style="width: 50px;" src="asset/imgs/logo.png" alt="">
                <div class="admin-menu"><p>Nhóm 65<i class="ri-arrow-down-s-fill"></i></p></div>
                <div class="sub-menu-admin-container hidden">
                    <div class="traingle"></div>
                    <ul class="sub-menu-admin" style="z-index: 1">
                        <li>

                            <div class="logout">
                                <a href="../dang_nhap.html">Đăng xuất</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </li>

        </ul>
    </div>
</div>
</body>
</html>
