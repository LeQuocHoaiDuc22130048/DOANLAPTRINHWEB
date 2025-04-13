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
    <c:import url="Link.jsp"/>
    <title>Blog</title>
</head>

<body>


<!-- ***** Header Area Start ***** -->
<c:import url="Header.jsp"/>
<!-- ***** Header Area End ***** -->

<!--Blog-->
<div class="blog d-flex justify-content-center align-items-center my-4">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 mb-3">
                <div class="absolute_center flex-column text-center">
                    <h2 class="text-center mt-100">Chào mừng bạn đến với blog của chúng tôi</h2>
                    <p>Đôi mắt là tài sản quý giá, và kính mắt là phương tiện vừa bảo vệ vừa
                        tô điểm cho vẻ đẹp của bạn. Blog của chúng tôi là nơi bạn có thể khám phá mọi điều về kính mắt –
                        từ cách chọn lựa, bảo quản, đến cập nhật những xu hướng thời trang mới nhất. Hãy cùng chúng tôi
                        khám phá!</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="d-flex justify-content-start align-items-center flex-column h-50">
                <img src="assets/images/blog_images/newBlog.png" class="border-0 img-thumbnail w-100 object-fit-cover"
                     style="height: 500px" alt="">
                <div class="blog-content">
                    <div class="date">27/10/2024</div>
                    <h3>Top 99+ món quà sinh nhật cho nam ý nghĩa, thiết thực nhất</h3>
                    <a href="https://kinhmatanna.com/top-99-mon-qua-sinh-nhat-cho-nam-y-nghia-thiet-thuc-nhat"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>
        </div>

        <!-- Blog Items -->
        <div class="row mt-4 position-relative">
            <c:forEach var="item" items="${requestScope.posts}">
                <div class="col-md-4 ">
                    <div class="blog-item border border-1">
                        <div class="absolute_center flex-column">
                            <img src="${item.thumbnail}" class="border border-0 img-thumbnail object-fit-cover mb-3 "
                                 style="height: 400px ; width: 400px" alt="Blog Image 1">
                            <div class="date"></div>
                            <h3 class="fw-bold text-center fs-5 text-wrap w-75  ">${item.title}</h3>
                            <p class="w-100 px-3 my-4 collapse">${item.content}</p>
                            <div class="w-100 p-2"><a href="${item.url}" class="btn btn-primary float-end">Đọc thêm</a></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <!--pagination-->
            <div class="pagination-left-right position-absolute d-flex justify-content-between align-items-center top-50">
                <a href="#" class="page-link left-button " aria-label="Previous">
                    <span aria-hidden="true" class="btn btn-primary fs-4 px-4 rounded-circle">&lsaquo;</span>
                </a>
                <a href="#" class="page-link right-button" aria-label="Next">
                    <span aria-hidden="true" class="btn btn-primary fs-4 px-4 rounded-circle">&rsaquo;</span>
                </a>
            </div>
            <!--end pagination-->
        </div>
    </div>
</div>
<!--end blog-->
<c:import url="Footer.jsp"/>
<c:import url="Script.jsp"/>
<script src="assets/js/pagination.js"></script>
</body>
</html>