package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.ProductVM;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;
import vn.edu.hcmuaf.fit.doanweb.Services.ProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FilterController", value = "/filter")
public class FilterController extends HttpServlet {

        private static final int PRODUCTS_PER_PAGE = 9;
        private final AdminService service = new AdminService();
        private final ProductService proService = new ProductService();

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String type = request.getParameter("type");
            String value = request.getParameter(type);


        }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
