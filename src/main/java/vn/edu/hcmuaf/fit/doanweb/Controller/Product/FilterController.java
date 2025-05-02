package vn.edu.hcmuaf.fit.doanweb.Controller.Product;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.Controller.DTO.ProductByCondition;
import vn.edu.hcmuaf.fit.doanweb.Services.ProductService;
import vn.edu.hcmuaf.fit.doanweb.Util.JSPPage;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "FilterController", value = "/filter")
public class FilterController extends HttpServlet {

    private static final int PRODUCTS_PER_PAGE = 9;
    private final ProductService proService = new ProductService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String value = request.getParameter("value");
        List<ProductByCondition> list = proService.getProduct(type, value);
        System.out.println(list.size());
        request.setAttribute("product_list", list);
        request.getRequestDispatcher(JSPPage.Category.getPage()).forward(request, response);
    }

}
