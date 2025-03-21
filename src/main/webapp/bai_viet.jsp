<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="shortcut icon" href="assets/images/logo.png" type="image/x-icon">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
          rel="stylesheet"/>

    <title>Blog</title>

    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css"/>
    <link rel="stylesheet" href="assets/css/owl-carousel.css"/>
    <link rel="stylesheet" href="assets/css/lightbox.css"/>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/blog.css"/>


</head>

<body>


<!-- ***** Header Area Start ***** -->
<jsp:include page="header.jsp"/>
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
            <!-- Blog Item 1 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog1.png" alt="Blog Image 1">
                    <div class="date">22/8/2024</div>
                    <h3>Cách chọn kính phù hợp với dáng mặt</h3>
                    <p>Khi tìm kiếm gọng kính lý tưởng, có ba tiêu chí quan trọng bạn cần xem xét: độ tương phản, tỷ lệ,
                        và màu sắc của gọng.</p>
                    <a href="https://matviet.vn/blogs/tu-van-chon-kinh/bi-quyet-chon-kinh-phu-hop-voi-khuon-mat"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>

            <!-- Blog Item 2 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog3.png" alt="Blog Image 2">
                    <div class="date">15/8/2024</div>
                    <h3>Cách bảo vệ mắt trước ánh sáng xanh. Bạn đã biết?</h3>
                    <p>Thời đại công nghệ phát triển, mọi người tiếp xúc rất nhiều với các thiết bị điện tử dẫn đến tình
                        trạng suy giảm thị lực.</p>
                    <a href="https://matviet.vn/blogs/kien-thuc/anh-sang-xanh-la-gi-cach-bao-ve-mat-tranh-khoi-anh-sang-xanh"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>

            <!-- Blog Item 3 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog4.png" alt="Blog Image 3">
                    <div class="date">9/8/2024</div>
                    <h3>Giải đáp: Nhỏ thuốc nhỏ mắt nhiều liệu có tốt?</h3>
                    <p>Thuốc nhỏ mắt là một giải pháp phổ biến để giải quyết các vấn đề liên quan đến mắt như khô mắt,
                        nhức mỏi.</p>
                    <a href="https://kinhmatanna.com/giai-dap-nho-thuoc-nho-mat-nhieu-co-tot-khong"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>

            <!-- Blog Item 4 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog5.png" alt="Blog Image 4">
                    <div class="date">1/8/2024</div>
                    <h3>Top 5 xu hướng kính mát dành cho mùa hè</h3>
                    <p>Khám phá những mẫu kính mát nổi bật trong mùa hè năm nay để bảo vệ mắt và thêm phần phong
                        cách.</p>
                    <a href="https://www.elle.vn/fashion/kinh-mat-mua-he-hop-moi-khuon-mat" class="btn btn-read-more">Đọc
                        thêm</a>
                </div>
            </div>

            <!-- Blog Item 5 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog6.png" alt="Blog Image 5">
                    <div class="date">25/7/2024</div>
                    <h3>Những điều cần biết về kính chống tia UV</h3>
                    <p>Bảo vệ đôi mắt trước tia cực tím với kính chống tia UV và cách lựa chọn kính phù hợp.</p>
                    <a href="https://kinhmatbichngoc.vn/nhung-dieu-can-biet-ve-kinh-mat-chong-tia-uv.htm"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>

            <!-- Blog Item 6 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog7.png" alt="Blog Image 6">
                    <div class="date">18/7/2024</div>
                    <h3>Phân biệt các loại kính cận phổ biến</h3>
                    <p>Các loại kính cận và cách lựa chọn kính phù hợp với nhu cầu sử dụng hàng ngày. Bạn đã biết
                        chưa?</p>
                    <a href="https://matviet.vn/blogs/tu-van-chon-kinh/cac-loai-kinh-can-pho-bien-hien-nay"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>

            <!-- Blog Item 7 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog8.png" alt="Blog Image 7">
                    <div class="date">10/7/2024</div>
                    <h3>Hướng dẫn vệ sinh và bảo quản kính mắt</h3>
                    <p>Cách giữ cho kính mắt luôn sạch sẽ và bền lâu theo thời gian.</p>
                    <a href="https://www.kinhmatdangquang.vn/tin-tuc/85/3-buoc-tong-ve-sinh-kinh-mat-dung-cach.html"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>

            <!-- Blog Item 8 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog9.png" alt="Blog Image 8">
                    <div class="date">2/7/2024</div>
                    <h3>Kính thời trang và cách phối hợp trang phục</h3>
                    <p>Tạo điểm nhấn thời trang với kính mắt và cách phối hợp cùng trang phục.</p>
                    <a href="https://mytour.vn/vi/blog/bai-viet/cach-ket-hop-trang-phuc-phu-hop-voi-tung-loai-kinh-giup-ban-tu-tin.html"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>

            <!-- Blog Item 9 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog10.png" alt="Blog Image 9">
                    <div class="date">24/6/2024</div>
                    <h3>Các loại mắt kính cho người đi xe máy</h3>
                    <p>Bảo vệ đôi mắt khi đi xe máy với các loại kính chuyên dụng chống bụi và tia UV.</p>
                    <a href="https://chuyenxe.com/tho-va-xe/phu-kien/kinh-chong-bui-di-xe-may/"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>

            <!-- Blog Item 10 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog11.png" alt="Blog Image 10">
                    <div class="date">15/6/2024</div>
                    <h3>Kính mát phân cực là gì và cách phân biệt</h3>
                    <p>Tìm hiểu về kính mát phân cực và những lợi ích khi sử dụng kính phân cực.</p>
                    <a href="https://kinhhaitrieu.com/kinh-phan-cuc-la-gi-tac-dung-gi-cach-phan-biet"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>

            <!-- Blog Item 11 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog12.png" alt="Blog Image 11">
                    <div class="date">8/6/2024</div>
                    <h3>Kính hai tròng và những lưu ý khi sử dụng</h3>
                    <p>Cách sử dụng kính hai tròng và những lưu ý quan trọng cho người mới.</p>
                    <a href="https://nhathuoclongchau.com.vn/bai-viet/nhung-thong-tin-can-biet-ve-kinh-2-trong.html"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>

            <!-- Blog Item 12 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog13.png" alt="Blog Image 12">
                    <div class="date">1/6/2024</div>
                    <h3>Hướng dẫn chọn tròng kính cận tốt nhất cho mắt</h3>
                    <p>Tròng kính phù hợp với mắt giúp bạn thoải mái hơn trong cuộc sống hằng ngày.</p>
                    <a href="https://matkinhhoangha.com/huong-dan-chon-trong-kinh-can-tot-nhat-cho-mat-cua-ban/"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>

            <!-- Blog Item 13 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog14.png" alt="Blog Image 13">
                    <div class="date">25/5/2024</div>
                    <h3>Giới thiệu về kính đổi màu thông minh</h3>
                    <p>Kính đổi màu giúp bảo vệ mắt tối đa trong mọi điều kiện ánh sáng.</p>
                    <a href="https://buiphat.vn/kinh-xay-dung/kinh-dien-thong-minh.html" class="btn btn-read-more">Đọc
                        thêm</a>
                </div>
            </div>

            <!-- Blog Item 14 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog15.png" alt="Blog Image 14">
                    <div class="date">18/5/2024</div>
                    <h3>Tròng kính mỏng nhẹ: Lợi ích và ứng dụng</h3>
                    <p>Tròng kính mỏng nhẹ không chỉ giúp mắt dễ chịu mà còn nâng cao tính thẩm mỹ.</p>
                    <a href="https://ankhangphat.com.vn/tin-tuc/mot-so-loi-ich-cua-trong-kinh-sieu-mong-ma-ban-nen-biet/"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>

            <!-- Blog Item 15 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog16.png" alt="Blog Image 15">
                    <div class="date">10/5/2024</div>
                    <h3>Tip bảo vệ mắt cho dân văn phòng? Bạn đã biết Chưa?</h3>
                    <p>Tròng kính giúp dân văn phòng giảm thiểu mỏi mắt khi làm việc trước máy tính.</p>
                    <a href="https://hellobacsi.com/nhan-khoa/cham-soc-mat/bo-tui-10-cach-chong-moi-mat-danh-cho-dan-van-phong"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>
            <!-- Blog Item 16 -->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog17.png" alt="Blog Image 16">
                    <div class="date">4/5/2024</div>
                    <h3>Gọng kính hình bướm - Phong cách độc đáo</h3>
                    <p>Gọng kính hình bướm là một chiếc gọng có kiểu dáng mang phong cách độc đáo, được nhiều tín đồ
                        thời trang săn lùng.</p>
                    <a href="https://kinhmatanna.com/gong-kinh-hinh-buom-phong-cach-gong-kinh-doc-dao"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>
            <!-- Blog Item 17-->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog18.png" alt="Blog Image 7">
                    <div class="date">25/4/2024</div>
                    <h3>Top gọng kính phù hợp nhất với mặt oval</h3>
                    <p>Nếu như bạn đang có thắc mắc rằng mặt oval có hợp đeo kính không thì câu trả lời là có thậm chí
                        là còn rất thoải mái.</p>
                    <a href="https://kinhmatanna.com/mat-oval-deo-kinh-gi-top-gong-kinh-phu-hop-nhat-voi-mat-oval"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>
            <!-- Blog Item 18-->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog19.png" alt="Blog Image 18">
                    <div class="date">19/4/2024</div>
                    <h3>99+ mẫu lens xám khói đẹp, hot nhất hiện nay</h3>
                    <p>Lens mắt màu xám khói là màu lens vô cùng đặc biệt, mang lại sự tinh tế và lịch lãm cho người
                        đeo.</p>
                    <a href="https://kinhmatanna.com/99-mau-lens-xam-khoi-dep-hot-nhat-hien-nay"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>

            <!-- Blog Item 19-->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog20.png" alt="Blog Image 19">
                    <div class="date">2/4/2024</div>
                    <h3>Hướng dẫn chọn mua gọng nhựa mix kim loại đẹp nhất</h3>
                    <p>Trong thế giới thời trang kính mắt, gọng kính nhựa mix kim loại đang trở thành một xu hướng rất
                        phổ biến.</p>
                    <a href="https://kinhmatanna.com/huong-dan-chon-mua-gong-nhua-mix-kim-loai-dep-nhat"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>
            <!-- Blog Item 20-->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog21.png" alt="Blog Image 20">
                    <div class="date">30/3/2024</div>
                    <h3>Khám phá những dáng gọng kính đa giác đẹp nhất</h3>
                    <p>Mẫu gọng kính đa giác với các góc cạnh sắc sảo sẽ giúp cho khuôn mặt trở nên thon gọn và hài hòa
                        hơn.</p>
                    <a href="https://kinhmatanna.com/kham-pha-nhung-dang-gong-kinh-da-giac-dep-nhat"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>
            <!-- Blog Item 21-->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog22.png" alt="Blog Image 21">
                    <div class="date">18/3/2024</div>
                    <h3>Top 9 loại trái cây tốt cho mắt nhất</h3>
                    <p>Trái cây tốt cho mắt sẽ giúp bạn cải thiện thị lực và giảm nguy cơ mắc các bệnh liên quan đến
                        mắt.</p>
                    <a href="https://kinhmatanna.com/nhung-loai-trai-cay-nao-tot-cho-mat-top-9-loai-trai-cay-tot-cho-mat-nhat"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>
            <!-- Blog Item 22-->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog23.png" alt="Blog Image 22">
                    <div class="date">5/3/2024</div>
                    <h3>Top 6 app chọn kính phù hợp với khuôn mặt chuẩn nhất</h3>
                    <p>Ứng dụng Glassify – TryOn Virtual Glass mang đến trải nghiệm độc đáo cho người dùng khi chọn lựa
                        kính mắt phù hợp với khuôn mặt</p>
                    <a href="https://kinhmatanna.com/top-6-app-chon-kinh-phu-hop-voi-khuon-mat-chuan-nhat"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>
            <!-- Blog Item 23-->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog24.png" alt="Blog Image 23">
                    <div class="date">27/2/2024</div>
                    <h3>Tròng kính tráng gương là gì? Lý do nên sử dụng?</h3>
                    <p>Ngày nay, tròng kính tráng gương trở thành một trong những phụ kiện thời trang được nhiều người
                        chú ý không chỉ bởi thiết kế thời thượng mà còn với nhiều tính năng ưu việt.</p>
                    <a href="https://kinhmatanna.com/trong-kinh-trang-guong-la-gi-ly-do-nen-su-dung"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>
            <!-- Blog Item 24-->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog25.png" alt="Blog Image 24">
                    <div class="date">12/2/2024</div>
                    <h3>Mắt kính tròng kính Polaroid là gì? Có nên mua không?</h3>
                    <p>Tròng kính Polaroid là loại tròng kính được thiết kế để loại bỏ hoặc giảm cường độ ánh sáng phản
                        xạ và phân cực.</p>
                    <a href="https://kinhmatanna.com/mat-kinh-trong-kinh-polaroid-la-gi-co-nen-mua-khong"
                       class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>

            <!--Blog Item 25-->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog26.png" alt="Blog Image 25">
                    <div class="date">29/1/2024</div>
                    <h3>[Giải đáp]: Đeo kính không độ có hại mắt không?</h3>
                    <p>Những chiếc kính với đủ kiểu dáng khác nhau với phong cách Hàn Quốc,
                        đã và đang được các tín đồ thời trang “săn lùng” và sở hữu</p>
                    <a href="https://kinhmatanna.com/deo-kinh-khong-do-co-hai-mat-khong" class="btn btn-read-more">Đọc
                        thêm</a>
                </div>
            </div>

            <!--Blog Item 26-->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog27.png" alt="Blog Image 26">
                    <div class="date">16/1/2024</div>
                    <h3>Top 10+ mẫu gọng kính lục giác được nhiều người ưa chuộng nhất</h3>
                    <p>Gọng kính lục giác là sản phẩm đang dần trở thành xu hướng bởi kiểu dáng năng động,
                        phù hợp với nhiều khuôn mặt.</p>
                    <a href="https://kinhmatanna.com/gong-kinh-luc-giac" class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>

            <!--Blog Item 27-->
            <div class="col-md-4">
                <div class="blog-item">
                    <img src="assets/images/blog_images/blog28.png" alt="Blog Image 27">
                    <div class="date">1/1/2024</div>
                    <h3>Loại vitamin nào tốt cho mắt? Top 9 thực phẩm chứa vitamin tốt cho mắt</h3>
                    <p>Mắt giúp con người có thể nhìn thấy mọi sự vật, sự việc và tận hưởng những khoảnh khắc đẹp trong
                        cuộc sống.</p>
                    <a href="https://kinhmatanna.com/vitamin-tot-cho-mat" class="btn btn-read-more">Đọc thêm</a>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<!--end blog-->

<!--pagination-->
<div class="pagination-container">
    <div class="pagination-left-right">
        <a href="#" class="page-link left-button" aria-label="Previous">
            <span aria-hidden="true">&lsaquo;</span>
        </a>

        <a href="#" class="page-link right-button" aria-label="Next">
            <span aria-hidden="true">&rsaquo;</span>
        </a>
    </div>
</div>
<!--end pagination-->


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

<!-- ***** Footer Start ***** -->
<jsp:include page="footer.jsp"/>

<!-- jQuery -->
<script src="assets/js/jquery-2.1.0.min.js"></script>

<!-- Bootstrap -->
<script src="assets/js/popper.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<!-- Plugins -->
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/phan-loai-gioi-tinh.js
      "></script>
<script src="assets/js/accordions.js"></script>
<script src="assets/js/datepicker.js"></script>
<script src="assets/js/scrollreveal.min.js"></script>
<script src="assets/js/waypoints.min.js"></script>
<script src="assets/js/jquery.counterup.min.js"></script>
<script src="assets/js/imgfix.min.js"></script>
<script src="assets/js/slick.js"></script>
<script src="assets/js/lightbox.js"></script>
<script src="assets/js/isotope.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="assets/js/gio_hang.js" defer></script>
<script src="assets/js/hien_thi_ten_dangnhap.js"></script>
<!--xử lý phần chat cho chat box-->
<script src="assets/js/chatbox.js"></script>


<!--xử lý nút phân trang-->
<script>
    $(document).ready(function () {
        var itemsPerPage = 3;
        var currentPage = 0;
        var totalItems = $(".blog-item").length;
        var totalPages = Math.ceil(totalItems / itemsPerPage);

        $(".blog-item").hide();

        function showPage(page) {
            var start = page * itemsPerPage;
            var end = start + itemsPerPage;
            $(".blog-item").hide();


            $(".blog-item").slice(start, end).show();
        }


        showPage(currentPage);

        $(".right-button").click(function (e) {
            e.preventDefault();
            if (currentPage < totalPages - 1) {
                currentPage++;
                showPage(currentPage);
            }
        });
        $(".left-button").click(function (e) {
            e.preventDefault();
            if (currentPage > 0) {
                currentPage--;
                showPage(currentPage);
            }
        });
    });
</script>


</body>
</html>