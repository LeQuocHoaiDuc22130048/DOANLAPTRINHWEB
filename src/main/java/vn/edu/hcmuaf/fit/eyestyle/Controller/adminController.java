package vn.edu.hcmuaf.fit.eyestyle.Controller;

import java.io.*;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.eyestyle.DAO.Model.BrandsModel;
import vn.edu.hcmuaf.fit.eyestyle.Services.BrandServices;

@WebServlet(name = "adminController", value = "/admin")
public class adminController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        BrandServices services = new BrandServices();
        List<BrandsModel> all  = services.getAllBrands();
        request.setAttribute("data", all);
        request.getRequestDispatcher("admin.jsp").forward(request, response);

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}