package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Discounts;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.Cart;
import vn.edu.hcmuaf.fit.doanweb.Util.JSPPage;

import java.io.IOException;

@WebServlet(name = "DisplayActDiscountContr", value = "/gio_hang")
public class DisplayActDiscountContr extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        ProductDaoImp productDao = new ProductDaoImp();
        Discounts discount = productDao.getActiveDiscounts();

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        double discountAmount = 0.0;
        if(cart==null) cart=new Cart();

        if (discount != null) {
            session.setAttribute("discount", discount);
            discountAmount = cart.getDiscountAmount(discount);
        }

        // Đưa discountAmount vào request để truyền sang JSP
        request.setAttribute("discountAmount", discountAmount);

        // Tổng giá trị sau khi áp dụng giảm giá
        double totalAfterDiscount = cart.getTotalPrices() - discountAmount;
        request.setAttribute("totalAfterDiscount", totalAfterDiscount);


        // Chuyển tiếp đến trang gio_hang.jsp
        request.getRequestDispatcher(JSPPage.Cart.getPage()).forward(request, response);
    }
}