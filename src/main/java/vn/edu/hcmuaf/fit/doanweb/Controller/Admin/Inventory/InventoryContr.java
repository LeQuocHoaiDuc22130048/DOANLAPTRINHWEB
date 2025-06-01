package vn.edu.hcmuaf.fit.doanweb.Controller.Admin.Inventory;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.ProductVM;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

import jakarta.servlet.*;
import vn.edu.hcmuaf.fit.doanweb.config.AppConfig;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "InventoryContr", value = "/admin/InventoryList")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10,  // 10 MB
        maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class InventoryContr extends HttpServlet {
    private AdminService adminService;
    private String uploadDirectory;

    @Override
    public void init() throws ServletException {
        System.out.println("Vào đây r nè");
        adminService = new AdminService();
        // Lấy đường dẫn tuyệt đối đến thư mục lưu trữ
        String relativePath = AppConfig.getUploadDirectory(); // upload/upload_stock_in
        uploadDirectory = getServletContext().getRealPath("") + relativePath.replace("/", File.separator);
        System.out.println("thư mục: "+uploadDirectory);
        File uploadDir = new File(uploadDirectory);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductVM> products = adminService.getAllProduct();
        Map<Integer, Integer> stockMap = adminService.getRealStockQuantityMap();

        for (ProductVM product : products) {
            Integer realQuantity = stockMap.get(product.getId());
            if (realQuantity != null) {
                product.setQuantity(realQuantity);
            }
        }
        request.setAttribute("products", products);
        request.getRequestDispatcher("/admin/InventoryList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("import".equals(action)) {
            System.out.println("Start import");
            handleImport(request, response);
        }
    }

    private void handleImport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("excelFile");
        String fileName = new File(filePart.getSubmittedFileName()).getName();
        System.out.println("Tên file excel: "+fileName);
        String filePath = uploadDirectory + File.separator + fileName;
        System.out.println("Path lưu excel: "+filePath);
        filePart.write(filePath);

        try {
            // Import the data
            adminService.importFromExcel(filePath);
            request.setAttribute("message", "Nhập kho thành công!");
        } catch (Exception e) {
            request.setAttribute("error", "Lỗi khi nhập kho: " + e.getMessage());
        }

        // Redirect back to inventory list
        response.sendRedirect(request.getContextPath() + "/admin/InventoryList");
    }
}