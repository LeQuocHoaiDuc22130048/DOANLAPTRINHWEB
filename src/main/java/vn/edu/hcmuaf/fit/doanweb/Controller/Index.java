package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Brands;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductIndex;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoInterface;
import vn.edu.hcmuaf.fit.doanweb.Util.JSPPage;
import vn.edu.hcmuaf.fit.doanweb.Util.LogSystem;
import vn.edu.hcmuaf.fit.doanweb.Util.Roles;

import java.io.IOException;
import java.util.List;
@WebServlet(name = "index", value = "/")
public class Index extends HttpServlet {
    ProductDaoImp dao = new ProductDaoImp();
    private String name = Index.class.getSimpleName();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        session.setAttribute("id" , 17);
        session.setAttribute("role" , Roles.GUEST.getRole());
        List<ProductIndex> productListNam = dao.getProductsByCategory(1);
        List<ProductIndex> productListNu = dao.getProductsByCategory(2);
        List<ProductIndex> productListGK= dao.getProductsByCategory(9);
        List<ProductIndex> productListKAT= dao.getProductsByCategory(7);
        List<Brands> brandList= dao.getTop18Brands();
        // Gửi danh sách sản phẩm sang JSP
        request.setAttribute("productListNam", productListNam);
        request.setAttribute("productListNu", productListNu);
        request.setAttribute("productListKAT", productListKAT);
        request.setAttribute("productListGK", productListGK);
        request.setAttribute("brandList", brandList);

        request.getRequestDispatcher("/index.jsp").forward(request, response);

    }

}