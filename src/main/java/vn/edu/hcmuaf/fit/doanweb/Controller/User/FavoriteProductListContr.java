package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductIndex;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoInterface;
import vn.edu.hcmuaf.fit.doanweb.Enum.JSPPage;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SanPhamDaThich", value = "/user/wishList")
public class FavoriteProductListContr extends HttpServlet {
    private final ProductDaoInterface dao = new ProductDaoImp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        List<ProductIndex> favoriteProductList = dao.getFavoriteByUserId(userId);
        request.setAttribute("favoriteProductList", favoriteProductList);
        request.getRequestDispatcher(JSPPage.WishList.getPage()).forward(request, response);
    }

}

