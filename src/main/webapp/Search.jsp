<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Tìm kiếm sản phẩm</title>
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
<jsp:include page="Header.jsp"/>

<main id="primary" class="site-main">
    <div class="wpf-search-container">
        <section class="banner-main">
            <div class="container">
                <div class="banner-main-wrapper">
                    <h1 class="banner-main-title">TÌM KIẾM SẢN PHẨM</h1>
                </div>
            </div>
        </section>

        <section class="search-result">
            <div class="container">
                <p class="search-result-text">
                    Tìm kiếm cho: <span id="keyword-display">${param.keyword}</span>
                </p>
                
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                        ${error}
                    </div>
                </c:if>
                
                <div class="row img_type card-list" id="searchResults">
                    <c:choose>
                        <c:when test="${empty param.keyword}">
                            <div class="col-12 no-results">
                                <p>Vui lòng nhập từ khóa để tìm kiếm sản phẩm.</p>
                            </div>
                        </c:when>
                        <c:when test="${empty products}">
                            <div class="col-12 no-results">
                                <p>Không tìm thấy sản phẩm phù hợp với từ khóa "<strong>${param.keyword}</strong>".</p>
                                <p>Vui lòng thử lại với từ khóa khác.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="product" items="${products}" varStatus="loop">
                                <c:if test="${loop.index % 3 == 0}">
                                    <div class="row mb-4">
                                </c:if>
                                <div class="col-md-4 mb-4">
                                    <div class="item" data-product-id="${product.id}">
                                        <div class="thumb">
                                            <div class="hover-content">
                                                <ul>
                                                    <li><a href="${context}/product-detail?id=${product.id}"><i
                                                            class="fa fa-eye"></i></a></li>
                                                    <li><a href="#" role="button" class="rate-product"><i
                                                            class="fa fa-star"></i></a></li>
                                                    <li>
                                                        <form class="addCartForm">
                                                            <input type="hidden" name="id" value="${product.id}">
                                                            <button type="submit" class="btn_gio_hang">
                                                                <i class="fa fa-shopping-cart"></i>
                                                            </button>
                                                        </form>
                                                    </li>
                                                </ul>
                                            </div>
                                            <img class="img-fluid w-100 rounded-4" src="${product.path_image}"
                                                 alt="${product.name}"/>
                                        </div>
                                        <div class="down-content">
                                            <h4>${product.name}</h4>
                                            <span><fmt:formatNumber value="${product.sellingPrice}" type="number"
                                                                    pattern="#,###"/>đ</span>
                                            <ul class="stars">
                                                <c:forEach begin="1" end="5">
                                                    <li>
                                                        <i class="fa fa-star ${favoriteIds.contains(product.id) ? 'active' : ''}"></i>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${loop.index % 3 == 2 || loop.last}">
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>

                <c:if test="${not empty totalPages && totalPages > 1}">
                    <nav class="woocommerce-pagination">
                        <ul class="pagination" id="paginationControls">
                            <c:if test="${hasPrevious}">
                                <li class="page-item">
                                    <a class="page-link" onclick="goToPage(${previousPage}); return false;">
                                        <i class="fa fa-angle-left"></i>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" onclick="goToPage(${i}); return false;">${i}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${hasNext}">
                                <li class="page-item">
                                    <a class="page-link" onclick="goToPage(${nextPage}); return false;">
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </c:if>
            </div>
        </section>
    </div>
</main>
<jsp:include page="Footer.jsp"/>
<c:import url="Script.jsp"/>
<script>
    function goToPage(page) {
        const keyword = '${param.keyword}';
        const url = '${context}/search?keyword=' + encodeURIComponent(keyword) + '&page=' + page;
        window.location.href = url;
    }
</script>
</body>
</html>
