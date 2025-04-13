package vn.edu.hcmuaf.fit.doanweb.Util;

public enum JSPPage {
    Index("/index") , Login("Login.jsp") ,
    Register("Register.jsp") , Post("post.jsp") , Hotline("HotLine.jsp") ,
    ProductDetail("ProductDetail.jsp"),Cart("ShoppingCart.jsp"),
    ForgotPassword("ForgotPassword.jsp") , Category("product_category.jsp") , UpdateProfile("/user/UpdateProfile.jsp") ,
    WishList("/user/WishList.jsp")  , HistoryOrder("/user/HistoryOrder.jsp") ;
    private final String page ;
    JSPPage(String page) {
        this.page = page;
    }
    public String getPage() {
        return page;
    }
}
