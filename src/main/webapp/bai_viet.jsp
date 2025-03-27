<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <c:import url="link.jsp"/>
    <title>Blog</title>
</head>

<body>


<!-- ***** Header Area Start ***** -->
<c:import url="header.jsp"/>
<!-- ***** Header Area End ***** -->
<!-- ****** Login Start ***** -->
<div id="login"></div>
<!-- ****** Login End ***** -->

<!--Blog-->
<div class="blog d-flex justify-content-center align-items-center mt-20">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="titlepage text-center">
                    <h2>Chào mừng bạn đến với blog của chúng tôi</h2>
                    <p>Đôi mắt là tài sản quý giá, và kính mắt là phương tiện vừa bảo vệ vừa
                        tô điểm cho vẻ đẹp của bạn. Blog của chúng tôi là nơi bạn có thể khám phá mọi điều về kính mắt –
                        từ cách chọn lựa, bảo quản, đến cập nhật những xu hướng thời trang mới nhất. Hãy cùng chúng tôi
                        khám phá!</p>
                </div>
            </div>
        </div>

        <div class="newBlog">
            <img src="assets/images/blog_images/newBlog.png" alt="">
            <div class="blog-content">
                <div class="date">27/10/2024</div>
                <h3>Top 99+ món quà sinh nhật cho nam ý nghĩa, thiết thực nhất</h3>
                <a href="https://kinhmatanna.com/top-99-mon-qua-sinh-nhat-cho-nam-y-nghia-thiet-thuc-nhat"
                   class="btn btn-read-more">Đọc thêm</a>
            </div>
        </div>

        <!-- Blog Items -->
        <div class="row mt-4">
            <c:forEach var="item" items="${requestScope.posts}">
                <div class="col-md-4">
                    <div class="blog-item">
                        <img src="${item.thumbnail}" alt="Blog Image 1">
                        <div class="date"></div>
                        <h3>${item.title}</h3>
                        <p>${item.content}</p>
                        <a href="${item.url}"
                           class="btn btn-read-more">Đọc thêm</a>
                    </div>
                </div>
            </c:forEach>
            <!--pagination-->
            <div class="pagination-left-right">
                <a href="#" class="page-link left-button" aria-label="Previous">
                    <span aria-hidden="true">&lsaquo;</span>
                </a>
                <a href="#" class="page-link right-button" aria-label="Next">
                    <span aria-hidden="true">&rsaquo;</span>
                </a>
            </div>
            <!--end pagination-->
        </div>
    </div>
</div>
<!--end blog-->


<!--chat box-->
<div class="chat-box" id="chat-box">
    <div class="chat-header">
        <span>Chat!</span>
        <button id="close-chat">X</button>
    </div>
    <div class="chat-body" id="chat-body">
        <div class="messages" id="messages"></div>

        <!-- Phần nhập tin nhắn và nút gửi -->
        <div class="input-wrapper">
            <input type="text" id="message-input" placeholder="Nhập tin nhắn..."/>
            <button id="send-message">Gửi</button>
        </div>
    </div>
</div>
<c:import url="footer.jsp"/>
<c:import url="script.jsp"/>
<script src="assets/js/pagination.js"></script>
</body>
</html>