package vn.edu.hcmuaf.fit.doanweb.Controller.ProductList;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.ProductVM;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductListGKNam", value = "/ProductListGKNam")
public class ProductListGKNam extends HttpServlet {

        private static final int PRODUCTS_PER_PAGE = 9;
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            AdminService service = new AdminService();
            List<ProductVM> products = service.getAllProduct();

            int page = 1;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            int totalProducts = products.size();
            int totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);

            int start = (page - 1) * PRODUCTS_PER_PAGE;
            int end = Math.min(start + PRODUCTS_PER_PAGE, totalProducts);
            List<ProductVM> productsForPage = products.subList(start, end);

            request.setAttribute("products", productsForPage);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);

            request.getRequestDispatcher("gong_kinh_nam.jsp").forward(request, response);

        }


        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
