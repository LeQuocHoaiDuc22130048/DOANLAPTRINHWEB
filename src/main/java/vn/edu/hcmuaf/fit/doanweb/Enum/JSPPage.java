package vn.edu.hcmuaf.fit.doanweb.Enum;

import lombok.Getter;

@Getter
public enum JSPPage {
    Index("/index") , Login("Login.jsp") ,
    Register("/Register.jsp") , Post("/post.jsp") , Hotline("/HotLine.jsp") ,
    ProductDetail("/ProductDetail.jsp"),Cart("/ShoppingCart.jsp"),
    ForgotPassword("/ForgotPassword.jsp") , Category("/Product_Category.jsp") , Search("/Search.jsp"),
    UpdateProfile("/user/UpdateProfile.jsp") ,
    WishList("/user/WishList.jsp")  , HistoryOrder("/user/HistoryOrder.jsp")  , AdminDashBoard("/admin/Dashboard");
    private final String page ;
    JSPPage(String page) {
        this.page = page;
    }
}
