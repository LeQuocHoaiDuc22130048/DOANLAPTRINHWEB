<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Sản phẩm yêu thích</title>
    <c:import url="../Link.jsp"/>
</head>

<body>
<%--<!-- ***** Preloader Start ***** -->--%>
<div id="preloader">
    <div class="jumper">
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>
<%--<!-- ***** Preloader End ***** -->--%>

<!-- ***** Header Area Start ***** -->
<jsp:include page="../Header.jsp"/>
<!-- ***** Header Area End ***** -->

<section class="section kinh" id="kinh_mat_nam">
    <div class="container" style="margin-top: 50px; text-align: center">
        <div class="row content_head">
            <div class="col-lg-6">
                <div class="section-heading">
                    <h2>Sản phẩm yêu thích của bạn</h2>
                </div>
            </div>
        </div>
    </div>
    <div class="container san_pham_" style="visibility: visible">
        <div class="row">
            <div class="col-lg-12">
                <c:choose>
                    <c:when test="${empty requestScope.favoriteProductList}">
                        <div class="text-center my-5">
                            <h4>Bạn chưa có sản phẩm yêu thích nào.</h4>
                            <a href="${context}/index" class="btn btn-primary mt-3">Quay về trang chủ</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <c:forEach var="product" items="${requestScope.favoriteProductList}" varStatus="status">
                                    <c:if test="${status.index % 3 == 0}">
                                        <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                        <div class="row">
                                    </c:if>
                                    <div class="item col-4" data-product-id="${product.id}">
                                        <div class="thumb">
                                            <div class="hover-content">
                                                <ul>
                                                    <li>
                                                        <a href="${context}/product-detail?id=${product.id}">
                                                            <i class="fa fa-eye"></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="rate-product">
                                                            <i class="fa fa-star"></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <form class="addCartForm">
                                                            <input type="hidden" name="id" value="${product.id}">
                                                            <button class="btn_gio_hang">
                                                                <i class="fa fa-shopping-cart"></i>
                                                            </button>
                                                        </form>
                                                    </li>
                                                </ul>
                                            </div>
                                            <img class="img-thumbnail border-0 rounded-4" src="../${product.path_image}"
                                                 alt="${product.name}"/>
                                        </div>
                                        <div class="down-content">
                                            <h4>${product.name}</h4>
                                            <span><f:formatNumber value="${product.sellingPrice}"/>đ</span>
                                            <ul class="stars">
                                                <c:forEach begin="0" end="5" step="1">
                                                    <li>
                                                        <i class="fa fa-star active"></i>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>

                                    <c:if test="${status.index % 3 == 2 || status.last}">
                                        </div> <!-- Kết thúc row -->
                                        </div> <!-- Kết thúc carousel-item -->
                                    </c:if>
                                </c:forEach>

                            </div>
                            <button class="carousel-control-prev position-absolute top-50 start-0 translate-middle"
                                    style="width: fit-content" type="button" data-bs-target="#productCarousel"
                                    data-bs-slide="prev">
                                <span class="carousel-control-prev-icon bg-primary rounded" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next position-absolute top-50 start-100 translate-middle"
                                    style="width: fit-content" type="button" data-bs-target="#productCarousel"
                                    data-bs-slide="next">
                                <span class="carousel-control-next-icon bg-primary rounded" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</section>

<!-- ***** Footer Start ***** -->
<jsp:include page="../Footer.jsp"/>
<!-- ***** Footer End ***** -->

<c:import url="../Script.jsp"/>
</body>
</html>

