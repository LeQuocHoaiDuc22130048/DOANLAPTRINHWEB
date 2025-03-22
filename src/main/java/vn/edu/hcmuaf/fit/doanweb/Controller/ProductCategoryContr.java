package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Categories;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductCategoryDao;

import java.io.IOException;

@WebServlet("/product-category")
public class ProductCategoryContr extends HttpServlet {
    private ProductCategoryDao productCategoryDao;

    @Override
    public void init() throws ServletException {
        productCategoryDao = new ProductCategoryDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        String categoryIdParam = request.getParameter("categoryId");

        if (categoryIdParam == null || categoryIdParam.isEmpty()) {
            response.sendRedirect("error.jsp"); // Chuyển hướng nếu không có ID
            return;
        }

        int categoryId = Integer.parseInt(categoryIdParam);
        Categories category = productCategoryDao.getCategoryById(categoryId);

        if (category == null) {
            response.sendRedirect("error.jsp"); // Chuyển hướng nếu không có danh mục
            return;
        }

        request.setAttribute("category", category);
        request.setAttribute("subCategories", category.getItems());
        request.getRequestDispatcher("product_category.jsp").forward(request, response);
    }


}
