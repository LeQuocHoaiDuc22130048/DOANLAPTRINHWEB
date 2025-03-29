<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>EyeStyle - Giỏ hàng</title>
    <c:import url="link.jsp"/>
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
<jsp:include page="header.jsp"/>

<!-- ***** Header Area End ***** -->

<!-- ***** Giỏ hàng Start ***** -->
<main id="main" class="gio_hang">

    <c:choose>
        <%--        Khi đặt hàng thanh công--%>
        <c:when test="${sessionScope.orderSuccess != null && sessionScope.orderSuccess}">
            <div class="container no-list" id="nolist">
                <div class="non_product">
                    <i class="fa-solid fa-circle-check success-icon"></i>
                    <p class="text_complete">Đặt hàng thành công</p>
                    <p>Chúng tôi sẽ liên hệ trong thời gian gần nhất</p>
                    <p>
                        Để theo dõi đơn hàng và nhận thông tin cập nhật, hãy đăng ký tài
                        khoản ngay hôm nay!
                        <a href="dang_ki.jsp" class="link_return"><b>Đăng ký</b></a>
                    </p>
                    <a href="index" class="btn_continue">Tiếp tục mua hàng</a>
                </div>
            </div>
            <c:remove var="orderSuccess" scope="session"/>
        </c:when>
        <c:otherwise>
            <c:choose>
                <%--                Khi giỏ hàng trống--%>
                <c:when test="${sessionScope.cart.totalQuantity == 0}">
                    <div class="container no-list">
                        <div class="non_product">
                            <p>Chưa có sản phẩm nào trong giỏ hàng.</p>
                            <a href="index" class="btn_tel btn_return"
                            >Quay trở lại cửa hàng</a
                            >
                            <p>
                                Rất tiếc, phiên truy cập của bạn đã hết hạn.
                                <a href="index" class="link_return"
                                ><b>Quay trở lại cửa hàng.</b></a
                                >
                            </p>
                        </div>
                    </div>
                </c:when>
                <%--                Khi giỏ hàng có sản pham--%>
                <c:otherwise>
                    <div class="container list">
                        <div class="cart_checkout_page">
                            <div class="cart_wrapper">
                                <c:forEach var="cp" items="${sessionScope.cart.list}">
                                    <div class="cart_item">
                                        <div class="product_thumbnail">
                                            <a href="product-detail?id=${cp.id}"
                                            ><img
                                                    src="${cp.path_img}"
                                                    alt="${cp.name}"
                                                    width="150"
                                                    height="150"
                                            /></a>
                                        </div>
                                        <div class="product_info">
                                            <div class="product_name">
                                                <a href="product-detail?id=${cp.id}">
                                                        ${cp.name}</a
                                                >
                                            </div>
                                            <div class="product_price">
                                                <div class="don_gia">
                                                    Đơn giá: <span id="unit_price"><f:formatNumber
                                                        value="${cp.price}"/></span>đ
                                                </div>
                                                <form id="updateForm${cp.id}">
                                                    <input type="hidden" name="id" value="${cp.id}">
                                                    <input
                                                            type="number"
                                                            name="quantity"
                                                            id="product_quantity${cp.id}"
                                                            min="1"
                                                            max="100"
                                                            step="1"
                                                            value="${cp.quantity}"
                                                            style="width: 50px"
                                                            onchange="updateCart(${cp.id})"
                                                    />
                                                </form>

                                                <div class="so_tien">
                                                    Số tiền: <span id="total_price${cp.id}"><f:formatNumber
                                                        value="${cp.totalPrice}"/></span>đ
                                                </div>
                                            </div>
                                            <div class="product_remove">
                                                <i class="fa-solid fa-trash-can"></i>
                                                <a href="" onclick="confirmRemove(event,${cp.id})"><span>Xóa</span></a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="uu_dai" onclick="toggleDropdown()">
                                    <i class="fa-solid fa-tags"></i>
                                    <span>Phiếu ưu đãi</span>
                                    <span class="dropdown-icon">></span>
                                </div>
                                <div class="uu_dai-content" id="uu_dai-content">
                                    <table>
                                        <tr>
                                            <td>
                                                <input
                                                        type="text"
                                                        placeholder="Điền mã ưu đãi"
                                                        style="width: 100%"
                                                        id="discount-code-input"
                                                        value=""
                                                />
                                            </td>
                                            <td>
                                                <button class="apply-button">Áp dụng</button>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="coupon-wrapper">
                                    <div class="coupon">
                                        <div class="coupon-code">
                                                ${sessionScope.discount != null ? sessionScope.discount.code : "Không có ưu đãi"}
                                        </div>
                                        <div class="coupon-details">
                                                ${sessionScope.discount != null ? sessionScope.discount.description : "Không có chi tiết ưu đãi"}
                                        </div>
                                        <button class="copy-btn" onclick="copy_code()">📋</button>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout_wrapper">
                                <div class="total">
                                    <span>Khuyến mãi:</span>
                                    <span id="discount"><f:formatNumber value="${requestScope.discountAmount}"/>đ</span>
                                </div>
                                <div class="total total_top">
                                    <span class="label">Tổng:</span>
                                    <span class="price"
                                    ><span id="total_price_orders"><f:formatNumber
                                            value="${requestScope.totalAfterDiscount}"/>đ</span></span
                                    >
                                </div>
                                <div class="details">
                                    <div class="customer_details">
                                        <h5>Thông tin khách hàng</h5>
                                        <div class="row">
                                            <div class="col-lg-6 mb-3">
                                                <label>Họ và tên*</label>
                                                <input
                                                        type="text"
                                                        class="form-control"
                                                        id="customerName"
                                                        name="customerName"
                                                        placeholder="Họ tên của bạn"
                                                />
                                            </div>
                                            <div class="col-lg-6 mb-3">
                                                <label>Phone*</label>
                                                <input
                                                        type="tel"
                                                        class="form-control"
                                                        id="phoneNumber"
                                                        name="phoneNumber"
                                                        placeholder="Số điện thoại của bạn"
                                                />
                                            </div>
                                            <div class="col-lg-12 mb-3">
                                                <label>Email address (optional)</label>
                                                <input
                                                        type="email"
                                                        class="form-control"
                                                        id="email"
                                                        name="email"
                                                        placeholder="Nhập email của bạn"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="delivery_details">
                                        <h5>Thông tin nhận hàng</h5>
                                        <div class="row">
                                            <div class="col-lg-12 mb-3">
                                                <label>Địa chỉ*</label>
                                                <input
                                                        type="text"
                                                        class="form-control"
                                                        id="address"
                                                        name="address"
                                                        placeholder="Số nhà - Tên đường - Phường/Xã"
                                                />
                                            </div>
                                            <div class="col-lg-6 mb-3">
                                                <label>Tỉnh/Thành phố*</label>
                                                <input
                                                        type="text"
                                                        class="form-control"
                                                        id="city"
                                                        name="city"
                                                        placeholder="Tỉnh/Huyện/Thành phố"
                                                />
                                            </div>
                                            <div class="col-lg-6 mb-3">
                                                <label for="specialRequests" class="form-label"
                                                >Yêu cầu khác</label
                                                >
                                                <input
                                                        type="text"
                                                        class="form-control"
                                                        id="specialRequests"
                                                        name="specialRequests"
                                                        placeholder="Nhập yêu cầu (không bắt buộc)"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="payment_method">
                                        <h5>Phương thức thanh toán</h5>
                                        <ul>
                                            <li class="payment_method_bank">
                                                <input
                                                        type="radio"
                                                        id="bankPayment"
                                                        name="payment_method"
                                                        value="bank"
                                                        class="form-check-input"
                                                />
                                                <label for="bankPayment">Chuyển khoản ngân hàng</label>
                                                <div class="payment_box payment_box_bank">
                                                    <p>
                                                        Bước 1: Chọn sản phẩm và gọi tới số 0123 456 789 để đặt
                                                        hàng
                                                        <br/>
                                                        Bước 2: Trong vòng 2 phút, chúng tôi sẽ gọi điện xác
                                                        nhận đơn hàng để chắc chắn mẫu mắt kính bạn chọn vẫn còn
                                                        trong kho.
                                                        <br/>
                                                        Bước 3: Chuyển khoản tới 1 trong những TK bên dưới kèm
                                                        theo nội dung chuyển khoản: Tên Người Mua + Số Điện
                                                        Thoại Mua Hàng
                                                        <br/>
                                                        Bước 4: Nhắn người thân chuẩn bị có bất ngờ tới …
                                                    </p>
                                                </div>
                                            </li>
                                            <li class="payment_method_cod">
                                                <input
                                                        type="radio"
                                                        id="codPayment"
                                                        name="payment_method"
                                                        value="cod"
                                                        class="form-check-input"
                                                />
                                                <label for="codPayment">Trả tiền mặt khi nhận hàng</label>
                                                <div class="payment_box payment_box_cod">
                                                    <p>Thanh toán khi nhận hàng</p>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <button type="submit" value="Đặt hàng" class="button_order">
                                        Đặt hàng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

        </c:otherwise>
    </c:choose>
</main>
<!-- ***** Giỏ hàng End ***** -->

<!-- ***** Confirm dialog start ***** -->
<div id="customConfirm" class="confirm-dialog" style="display: none">
    <div class="confirm-content">
        <p>Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?</p>
        <div class="confirm-buttons">
            <button id="confirmYes" class="btn btn-danger">Có</button>
            <button id="confirmNo" class="btn btn-secondary">Không</button>
        </div>
    </div>
</div>
<!-- ***** Confirm dialog End ***** -->

<!-- ***** Footer Start ***** -->
<jsp:include page="footer.jsp"/>
<!-- ***** Footer End ***** -->

<script src="assets/js/dropdown.js"></script>
<c:import url="script.jsp"/>
<script src="assets/js/confirmRemove.js"></script>
<script src="assets/js/copy_code.js"></script>
<script src="assets/js/update_cart.js"></script>
<script src="assets/js/place_order.js"></script>

</body>
</html>
