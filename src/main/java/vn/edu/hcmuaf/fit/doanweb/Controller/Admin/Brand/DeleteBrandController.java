package vn.edu.hcmuaf.fit.doanweb.Controller.Admin.Brand;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "DeleteBrandController", value = "/admin/DeleteBrand")
public class DeleteBrandController extends HttpServlet {

    private AdminService adminService = new AdminService();
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.trim().isEmpty()) {
                response.getWriter().write("{\"status\":\"error\",\"message\":\"ID không được để trống\"}");
                return;
            }

            int brandId = Integer.parseInt(idParam);
            boolean isDeleted = adminService.deleteBrand(brandId);

            if (isDeleted) {
                response.getWriter().write("{\"status\":\"success\",\"message\":\"Xóa thương hiệu thành công\"}");
            } else {
                response.getWriter().write("{\"status\":\"error\",\"message\":\"Xóa thương hiệu thất bại\"}");
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("{\"status\":\"error\",\"message\":\"ID không hợp lệ\"}");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"status\":\"error\",\"message\":\"" + e.getMessage() + "\"}");
        }
    }
}