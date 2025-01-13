package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.FrameShapes;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductImage;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "AddProductController", value = "/admin/ProductAdd")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class AddProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String SAVE_DIR = "assets/images";

    AdminService adminService = new AdminService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("categories", adminService.getAllCategory());
        request.setAttribute("brands", adminService.getAllBrand());
        request.setAttribute("frameShapes", adminService.getAllFrameShape());
        request.getRequestDispatcher("/admin/ProductAdd.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            // Lấy và xác thực các tham số
            String name = getNonNullParam(request, "name");
            String description = getNonNullParam(request, "description");
            double costPrice = getDoubleParameter(request, "costPrice");
            double sellingPrice = getDoubleParameter(request, "sellingPrice");
            int quantity = getIntParameter(request, "quantity");
            int categoryId = getIntParameter(request, "categoryId");
            int brandId = getIntParameter(request, "brandId");
            int shapeId = getIntParameter(request, "shapeId");
            String material = getNonNullParam(request, "material");
            int gender = getIntParameter(request, "gender");
            String color = getNonNullParam(request, "color");

            // Tạo đối tượng ProductAddVM
            ProductAddVM productAddVM = new ProductAddVM();
            productAddVM.setName(name);
            productAddVM.setDescription(description);
            productAddVM.setCostPrice(costPrice);
            productAddVM.setSellingPrice(sellingPrice);
            productAddVM.setQuantity(quantity);
            productAddVM.setCategoryId(categoryId);
            productAddVM.setBrandId(brandId);
            productAddVM.setShapeId(shapeId);
            productAddVM.setMaterial(material);
            productAddVM.setGender(gender);
            productAddVM.setColor(color);
            productAddVM.setCreatedAt(LocalDateTime.now());
            productAddVM.setUpdatedAt(LocalDateTime.now());

            // Thêm sản phẩm mới
            boolean isProductAdded = adminService.addProduct(productAddVM);
            if (isProductAdded) {
                handleImageUpload(request, productAddVM);
                response.sendRedirect("/admin/ProductList");
            } else {
                showAlert(response, "Thêm sản phẩm thất bại.");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            showAlert(response, "Đã xảy ra lỗi: " + ex.getMessage());
        }
    }

    private void handleImageUpload(HttpServletRequest request, ProductAddVM productAddVM) throws IOException, ServletException {
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }

        List<ProductImage> images = new ArrayList<>();
        for (int i = 1; i <= 4; i++) {
            Part part = request.getPart("file" + i);
            if (part != null && part.getSize() > 0) {
                String fileName = extractFileName(part);
                if (fileName != null && !fileName.isEmpty()) {
                    int isMain = (i == 1) ? 1 : 0;
                    String filePath = savePath + File.separator + fileName;
                    part.write(filePath);

                    ProductImage productImage = new ProductImage();
                    productImage.setPath("/assets/images/" + fileName);
                    productImage.setIsMain(isMain);
                    productImage.setCreatedAt(LocalDateTime.now());
                    productImage.setUpdatedAt(LocalDateTime.now());
                    images.add(productImage);
                }
            }
        }

        productAddVM.setImages(images);
        adminService.updateImages(productAddVM);
    }

    private String getNonNullParam(HttpServletRequest request, String paramName) {
        String value = request.getParameter(paramName);
        if (value == null || value.trim().isEmpty()) {
            throw new IllegalArgumentException("Tham số " + paramName + " không được để trống.");
        }
        return value.trim();
    }

    private double getDoubleParameter(HttpServletRequest request, String paramName) {
        try {
            return Double.parseDouble(request.getParameter(paramName));
        } catch (NumberFormatException ex) {
            return 0.0;
        }
    }

    private int getIntParameter(HttpServletRequest request, String paramName) {
        try {
            return Integer.parseInt(request.getParameter(paramName));
        } catch (NumberFormatException ex) {
            return 0;
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String s : contentDisp.split(";")) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    private void showAlert(HttpServletResponse response, String message) throws IOException {
        response.getWriter().println("<script>alert('" + message + "');</script>");
    }
}