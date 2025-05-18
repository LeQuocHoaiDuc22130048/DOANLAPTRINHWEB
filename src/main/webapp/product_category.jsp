<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="availableData" class="vn.edu.hcmuaf.fit.doanweb.Util.AvailableData" scope="page"/>
<c:set var="brands" value="${availableData.getBrands('BRANDS')}"/>
<c:set var="shapes" value="${availableData.getShapes('SHAPES')}"/>
<c:set var="materials" value="${availableData.getMaterials('MATERIALS')}"/>
<c:set var="colors" value="${availableData.getColors('COLORS')}"/>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${requestScope.category.name}</title>
    <c:import url="Link.jsp"/>
</head>
<body>
<div class="wrapper">
    <!-- preloader start -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <!-- preloader end -->

    <!-- ***** Header Area Start ***** -->
    <jsp:include page="Header.jsp"/>
    <!-- ***** Header Area End ***** -->

    <div class="shop-page-title category-page-title featured-title page-title">
        <div class="page-title-inner flex-row container medium-flex-wrap flex-has-center">
            <div class="flex-col flex-center text-center">
                <div class="is-large">
                    <nav class="woocommerce-breadcrumb breadcrumbs">
                        <a href="/index">Trang Chủ</a>
                        <span class="divider">/</span>
                        ${requestScope.selectedItem.name}
                    </nav>
                </div>
            </div>
        </div>
    </div>

    <!-- ***** Main Banner Area Start ***** -->
    <main id="main">
        <div class="shop-container container">
            <div class="archive-product-wrap">
                <div class="absolute_center flex-column">
                    <h1  class="mt-4 mb-2 fs-3 text-center">${requestScope.selectedItem.title}</h1>
                    <p>
                        <img class="img-fluid border-0"
                                src="${requestScope.selectedItem.img}"
                                alt="Hình ${requestScope.selectedItem.name}"
                        />
                    </p>
                    <div class="text hide-for-small absolute_center">
                        <p class="caption-top w-auto mx-3 my-2">
                            <em>
                                ${requestScope.selectedItem.description}
                            </em>
                        </p>
                    </div>

                    <c:if test="${requestScope.isCategory && requestScope.selectedItem.items.size()>0}">
                        <div class="shop-container section-title-container">
                            <h3 class="section-title section-title-center">
                                <b></b>
                                <span class="section-title-main">Đối tượng</span>
                                <b></b>
                            </h3>
                        </div>

                      <div class="container">
                          <div class="row row-cols-3">
                              <c:forEach var="sub" items="${requestScope.selectedItem.items}" varStatus="status">
                                  <div class="col mb-2">
                                      <a title="${sub.name}" href="product-category?categoryId=${sub.id}">
                                          <img alt="banner" class="img-thumbnail border-0" src="${sub.img}"/>
                                      </a>
                                  </div>
                              </c:forEach>
                          </div>
                      </div>
                    </c:if>

                    <p class="tag-in-category mb-3 w-100">
                        <strong>Tìm kiếm nhiều:</strong>
                        <br/>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Mắt kính chính hãng">Gọng kính chính hãng</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính cận thể thao">Gọng thể thao</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính giá rẻ">Gọng giá rẻ</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính cận màu đen">Gọng màu đen</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính cận màu trắng">Gọng màu trắng</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính cận màu nâu">Gọng màu nâu</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính cận màu hồng">Gọng màu hồng</a>
                        <a  class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính cận màu vàng">Gọng màu vàng</a>
                    </p>

                    <p class="tag-in-category mb-3">
                        <strong>Có thể bạn thích:</strong>
                        <br/>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính Cartier">Cartier</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính Montblanc">Montblanc</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính Bolon">Bolon</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính Chopard">Chopard</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính Furla">Furla</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính Exfash">Exfash</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính Parim">Parim</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính EyesCloud">EyesCloud</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính Molsion">Molsion</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính Gucci">Gọng Gucci</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính Burberry">Gọng Burberry</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính Versace">Gọng Versace</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính RayBan">Gọng RayBan</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính Oakley">Gọng Oakley</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính Dior">Gọng Dior</a>
                        <a class="btn bg-transparent border-1 border mb-1" href="" title="Gọng kính Police">Gọng Police</a>
                    </p>
                   <div class="d-flex tag-in-category align-items-center gap-4 mt-5">
                       <h4 class="text-center">Lọc sản phẩm : </h4>
                       <div class="dropup-center dropup absolute_center">
                           <button class="bg-transparent py-2 px-2 rounded m-2 dropdown-toggle dropdown_btn"
                                   type="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                               Thương hiệu
                           </button>
                           <div class="dropdown-menu container-fluid shadow ms-2" style="width: 800px">
                               <div class="row row-cols-5 w-auto mx-2">
                                   <c:forEach var="brand" items="${brands}">
                                       <div class="col">
                                           <a class="dropdown_item_link px-2 py-2 m-2 text-center text-nowrap"
                                              onclick="fetchData(1, 'brand_id', ${brand.id})">
                                                   ${brand.name}
                                           </a>
                                       </div>
                                   </c:forEach>

                               </div>
                           </div>
                       </div>
                       <div class="dropup-center dropup absolute_center">
                           <label><input class="d-none" checked type="text" name="type" value="brand_id"/></label>
                           <button class="bg-transparent py-2 px-2 rounded m-2 dropdown-toggle dropdown_btn"
                                   type="button" data-bs-toggle="dropdown" aria-expanded="false">Giới tính
                           </button>
                           <div class="dropdown-menu container-fluid shadow " style="width: 500px">
                               <div class="row row-cols-4 w-auto ms-2">
                                   <div class="col">
                                       <a class="dropdown_item_link px-2 py-2 text-center text-nowrap" onclick="fetchData(1, 'gender',1)">
                                           <img class="img-thumbnail" src="assets/images/icon_gender/icon-nam .jpg" alt=""/>
                                       </a>
                                   </div>
                                   <div class="col">
                                       <a class="dropdown_item_link px-2 py-2 text-center text-nowrap" onclick="fetchData(1, 'gender',2)">
                                           <img class="img-thumbnail" src="assets/images/icon_gender/icon-nu .jpg" alt=""/>
                                       </a>
                                   </div>
                                   <div class="col">
                                       <a class="dropdown_item_link px-2 py-2 text-center text-nowrap" onclick="fetchData(1, 'gender',3)">
                                           <img class="img-thumbnail" src="assets/images/icon_gender/icon-tre-em.jpg" alt=""/>
                                       </a>
                                   </div>
                                   <div class="col">
                                       <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                          onclick="fetchData(1, 'gender',4)"><img class="img-thumbnail"
                                                                                 src="assets/images/icon_gender/icon-unisex .jpg"
                                                                                 alt=""/> </a>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="dropup-center dropup absolute_center">
                           <label><input class="d-none" checked type="text" name="type"
                                         value="brand_id"/></label>
                           <button class="bg-transparent py-2 px-2 rounded m-2 dropdown-toggle dropdown_btn"
                                   type="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                               Kiểu dáng
                           </button>
                           <div class="dropdown-menu container-fluid shadow " style="width: 500px">
                               <div class="row row-cols-4 w-auto ms-2">
                                   <c:forEach var="shape" items="${shapes}">
                                       <div class="col">
                                           <a class="dropdown_item_link px-2 py-2 m-2 text-center text-nowrap"
                                              onclick="fetchData(1, 'shape_id', ${shape.id})">
                                                       <img class="img-thumbnail" src="${shape.imgPath}" alt=""/>
                                           </a>
                                       </div>
                                   </c:forEach>
                               </div>
                           </div>
                       </div>
                       <div class="dropup-center dropup absolute_center">
                           <label><input class="d-none" checked type="text" name="type"
                                         value="brand_id"/></label>
                           <button class="bg-transparent py-2 px-2 rounded m-2 dropdown-toggle dropdown_btn"
                                   type="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                               Chất liệu
                           </button>
                           <div class="dropdown-menu container-fluid shadow " style="width: 500px">
                               <div class="row row-cols-4 w-auto ms-2">
                                   <c:forEach var="material" items="${materials}">
                                       <div class="col">
                                           <a class="dropdown_item_link px-2 py-2 m-2 text-center text-nowrap"
                                              onclick="fetchData(1, 'material', `${material.name}`)">
                                               <img class="img-thumbnail" src="${material.path}" alt=""/>
                                           </a>

                                       </div>
                                   </c:forEach>
                               </div>
                           </div>
                       </div>
                       <div class="dropup-center dropup absolute_center">
                           <label><input class="d-none" checked type="text" name="type"
                                         value="brand_id"/></label>
                           <button class="bg-transparent py-2 px-2 rounded m-2 dropdown-toggle dropdown_btn"
                                   type="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                               Color
                           </button>
                           <div class="dropdown-menu container-fluid shadow " style="width: 500px">
                               <div class="row row-cols-5 w-auto ms-2">
                                   <c:forEach var="color" items="${colors}">
                                       <div class="col">
                                           <a class="dropdown_item_link px-2 py-2 m-2 text-center text-nowrap"
                                              onclick="fetchData(1, 'color', `${color.name}`)">
                                               <img class="img-thumbnail" src="${color.path}" alt=""/>
                                           </a>
                                       </div>
                                   </c:forEach>
                               </div>
                           </div>
                       </div>
                       <div class="dropup-center dropup absolute_center">
                           <label><input class="d-none" checked type="text" name="type"
                                         value="brand_id"/></label>
                           <button class="bg-transparent py-2 px-2 rounded m-2 dropdown-toggle dropdown_btn"
                                   type="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                               Mức giá
                           </button>
                           <div class="dropdown-menu container-fluid shadow" style="width: 500px">
                               <div class="row row-cols-5 w-auto mx-2">
                                   <div class="col p-1">
                                       <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                          href="${pageContext.request.contextPath}/filter?min=0&max=1000"> 0 -
                                           1Tr
                                       </a>
                                   </div>
                                   <div class="col p-1"><a
                                           class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                           href="${pageContext.request.contextPath}/filter?min=1000&max=2000">
                                       1 - 2Tr
                                   </a></div>
                                   <div class="col p-1">
                                       <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                          href="${pageContext.request.contextPath}/filter?min=2000&max=4000"> 2
                                           - 4Tr
                                       </a>
                                   </div>
                                   <div class="col p-1">
                                       <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                          href="${pageContext.request.contextPath}/filter?min=4000&max=10000">
                                           4 - 10Tr
                                       </a>
                                   </div>
                                   <div class="col p-1">
                                       <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                          href="${pageContext.request.contextPath}/filter?min=10000&max=20000">
                                           10 - 20Tr
                                       </a>
                                   </div>
                                   <div class="col p-1">
                                       <a class="dropdown_item_link px-2 py-2 text-center text-nowrap"
                                          href="${pageContext.request.contextPath}/filter?min=20000&max=999999">
                                           trên 20Tr
                                       </a>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
                    <h1>Danh sách sản phẩm</h1>
                        <div id="data-container ">
                            <div id="product-list" class="parent">

                            </div>
                        </div>
                        <div id="pagination-container" class="text-center">
                    </div>
                    <!-- Phân trang -->
                </div>
            </div>
        </div>
    </main>
    <!-- ***** Main Banner Area End ***** -->

    <!-- ***** Product Area Starts ***** -->

    <!-- ***** Product Area Ends ***** -->

    <!-- ***** Footer Start ***** -->
    <jsp:include page="Footer.jsp"/>
    <!-- ***** Footer End ***** -->
</div>
<c:import url="Script.jsp"/>
<script src="${context}/assets/js/ProductFilter.js"></script>
</body>
</html>
