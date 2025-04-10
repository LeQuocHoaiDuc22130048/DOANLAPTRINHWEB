package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;
import java.nio.file.Path;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.text.StringEscapeUtils;
import org.jsoup.Jsoup;
import org.jsoup.safety.Safelist;

import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.BrandVM;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.CategoriesVM;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.CategoryVM;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "AddProductController", value = "/admin/ProductAdd")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class AddProductController extends HttpServlet {

    AdminService adminService = new AdminService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<BrandVM> brandList = adminService.getAllBrand();
        request.setAttribute("brandList", brandList);

        List<FrameShapes> frameShapesList = adminService.getAllFrameShape();
        request.setAttribute("frameShapesList", frameShapesList);

        List<CategoryVM> categoryList = adminService.getAllCategory();
        request.setAttribute("categoryList", categoryList);

        RequestDispatcher rd = request.getRequestDispatcher("ProductAdd.jsp");
        rd.forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try{
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            int brand = Integer.parseInt(request.getParameter("brand"));
            int fShape  = Integer.parseInt(request.getParameter("fShape"));
            int gender = Integer.parseInt(request.getParameter("gender"));
            String material = request.getParameter("material");
            String color = request.getParameter("color");
            int category = Integer.parseInt(request.getParameter("category"));
            double costPrice = Double.parseDouble(request.getParameter("costPrice"));
            double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
            Part filePartMain = request.getPart("mainImg");
            // process upload file
            String realPath = request.getServletContext().getRealPath("/assets/images");
        }catch (Exception e){

        }

    }

}