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

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String genderParam = request.getParameter("gender");
        int gender = 1;

        // Kiểm tra tham số gender có hợp lệ hay không
        if (genderParam != null && !genderParam.isEmpty()) {
            try {
                gender = Integer.parseInt(genderParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        ProductDaoImp productDAO = new ProductDaoImp();
        List<ProductIndex> productList = productDAO.getProductsByGender(gender);

        request.setAttribute("productList", productList);
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}