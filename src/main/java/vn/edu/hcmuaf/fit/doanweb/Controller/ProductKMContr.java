package vn.edu.hcmuaf.fit.doanweb.Controller;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductIndex;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductKMContr", value = "/index")
public class ProductKMContr extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ProductDaoImp productDAO = new ProductDaoImp();
        List<ProductIndex> productListNam = productDAO.getProductsByGender(1);
        List<ProductIndex> productListNu = productDAO.getProductsByGender(2);

        // Gửi danh sách sản phẩm sang JSP
        request.setAttribute("productListNam", productListNam);
        request.setAttribute("productListNu", productListNu);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}