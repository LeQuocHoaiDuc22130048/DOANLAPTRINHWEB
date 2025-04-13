package vn.edu.hcmuaf.fit.doanweb.Util;

public enum JSPPage {
    Index("/index") , Login("dang_nhap.jsp") ,
    Register("dang_ki.jsp") , Post("post.jsp") , Hotline("lien_he.jsp") ,
    ProductDetail("chi_tiet_san_pham.jsp"),Cart("gio_hang.jsp"),
    ForgotPassword("quen_mat_khau.jsp") , Category("product_category.jsp") , UpdateProfile("/user/UpdateProfile.jsp") ,
    WishList("/user/WishList.jsp")  , HistoryOrder("/user/HistoryOrder.jsp") ;
    private final String page ;
    JSPPage(String page) {
        this.page = page;
    }
    public String getPage() {
        return page;
    }
}
