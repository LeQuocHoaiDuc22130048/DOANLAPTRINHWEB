    package vn.edu.hcmuaf.fit.doanweb.Controller.Admin.Brand;

    import java.io.*;

    import jakarta.servlet.*;
    import jakarta.servlet.http.*;
    import jakarta.servlet.annotation.*;
    import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.BrandVM;
    import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

    @WebServlet(name = "EditBrandController", value = "/admin/EditBrand")
    public class EditBrandController extends HttpServlet {
        private AdminService adminService = new AdminService();
        @Override
        public void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            try {
                // Lấy dữ liệu từ form
                String idParam = request.getParameter("id");
                if (idParam == null || idParam.trim().isEmpty()) {
                    response.getWriter().write("error: ID không được để trống");
                    return;
                }

                int id;
                try {
                    id = Integer.parseInt(idParam);
                } catch (NumberFormatException e) {
                    response.getWriter().write("error: ID không hợp lệ");
                    return;
                }
                String name = request.getParameter("brandName");
                String title = request.getParameter("brandTitle");
                String description = request.getParameter("descriptionBrand");

                // Xử lý upload ảnh
                Part imagePart = request.getPart("imageBrand");
                String imagePath = null;
                if (imagePart != null && imagePart.getSize() > 0) {
                    String imageFileName = System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();
                    String uploadPath = getServletContext().getRealPath("/asset/image/banner_brand") + "/" + imageFileName;
                    imagePart.write(uploadPath);
                    imagePath = "asset/image/banner_brand/" + imageFileName;
                }

                // Xử lý upload icon
                Part iconPart = request.getPart("iconBrand");
                String iconPath = null;
                if (iconPart != null && iconPart.getSize() > 0) {
                    String iconFileName = System.currentTimeMillis() + "_" + iconPart.getSubmittedFileName();
                    String uploadPath = getServletContext().getRealPath("/asset/image/brands/icon_brand") + "/" + iconFileName;
                    iconPart.write(uploadPath);
                    iconPath = "asset/image/brands/icon_brand/" + iconFileName;
                }

                // Tạo đối tượng BrandVM
                BrandVM brand = new BrandVM();
                brand.setId(id);
                brand.setName(name);
                brand.setTitle(title);
                brand.setDescription(description);
                if (imagePath != null) brand.setImg(imagePath);
                if (iconPath != null) brand.setIcon(iconPath);

                // Gọi phương thức update
                boolean isUpdated = adminService.updateBrand(brand);

                if (isUpdated) {
                    response.sendRedirect("Brand?message=update_success");
                } else {
                    response.sendRedirect("Brand?message=update_failed");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("Brand?message=error");
            }
        }
    }