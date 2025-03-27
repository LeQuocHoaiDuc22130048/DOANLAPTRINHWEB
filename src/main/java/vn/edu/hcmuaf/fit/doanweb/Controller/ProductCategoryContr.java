package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Brands;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Categories;
//import vn.edu.hcmuaf.fit.doanweb.DAO.ProductBrandDao;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Util.JSPPage;
//import vn.edu.hcmuaf.fit.doanweb.DAO.ProductCategoryDao;

import java.io.IOException;

@WebServlet("/product-category")
public class ProductCategoryContr extends HttpServlet {
    private ProductDaoImp dao;

    @Override
    public void init() throws ServletException {
        dao = new ProductDaoImp();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        String categoryIdParam = request.getParameter("categoryId");
        String brandIdParam = request.getParameter("brandId");
        Object selectedItem = null;

        if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
            selectedItem = dao.getCategoryById(Integer.parseInt(categoryIdParam));
        }
        if (brandIdParam != null && !brandIdParam.isEmpty()) {
            selectedItem = dao.getBrandById(Integer.parseInt(brandIdParam));
        }

        if (selectedItem == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        request.setAttribute("isCategory", selectedItem instanceof Categories);
        request.setAttribute("selectedItem", selectedItem);
        request.getRequestDispatcher(JSPPage.Category.getPage()).forward(request, response);
    }


}
