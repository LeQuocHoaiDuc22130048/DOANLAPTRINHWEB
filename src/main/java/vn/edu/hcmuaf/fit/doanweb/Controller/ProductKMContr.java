package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductIndex;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductKMContr", value = "/index")
public class ProductKMContr extends HttpServlet {
    ProductDaoImp productDAO = new ProductDaoImp();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<ProductIndex> productListNam = productDAO.getProductsByGender(1);
        List<ProductIndex> productListNu = productDAO.getProductsByGender(2);

        List<ProductIndex> productListKAT= productDAO.getProductsByCategory(7);

        // Gửi danh sách sản phẩm sang JSP
        request.setAttribute("productListNam", productListNam);
        request.setAttribute("productListNu", productListNu);
        request.setAttribute("productListKAT", productListKAT);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}