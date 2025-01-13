package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;
import java.time.LocalDateTime;
import java.util.List;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.BrandVM;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.CategoryVM;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.ProductVM;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.Suggestion;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.FrameShapes;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "AddProductController", value = "/admin/ProductAdd")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class AddProductController extends HttpServlet {
    AdminService adminService = new AdminService();
    private static final long serialVersionUID = 1L;
    private static final String SAVE_DIR = "uploadFiles";
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       CategoryVM categoryVM = new CategoryVM();
       BrandVM brandVM = new BrandVM();
       FrameShapes frameShapes = new FrameShapes();

       request.setAttribute("categories", categoryVM);
       request.setAttribute("brands", brandVM);
       request.setAttribute("frameShapes", frameShapes);

       request.getRequestDispatcher("/admin/ProductAdd.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double costPrice = Double.parseDouble(request.getParameter("costPrice"));
        double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
        int quantity  = Integer.parseInt(request.getParameter("quantity"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int brandId = Integer.parseInt(request.getParameter("brandId"));
        int shapeId = Integer.parseInt(request.getParameter("shapeId"));
        String material = request.getParameter("material");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String color = request.getParameter("color");

        int status = 1;
        byte hot = 0;

        LocalDateTime createAt = LocalDateTime.now();
        LocalDateTime updateAt = null;

        Product product = new Product(0,categoryId,brandId,shapeId,material,name,description, status,hot,costPrice,sellingPrice,quantity,gender,color,createAt,updateAt);
        boolean success = adminService.addProduct(product);

        if(success) response.sendRedirect("ProductList.jsp");
        else response.sendRedirect("ProductAdd.jsp?error=1");
    }
}