package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductImage;
import vn.edu.hcmuaf.fit.doanweb.Services.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name="Detail", value="/product-detail")
public class ProductDetailContr extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));

            ProductService service = new ProductService();
            Product product = service.getProductById(id);
            List<ProductImage> images0= service.getProductImages(id);

            if (product != null) {
                req.setAttribute("product", product);
                req.setAttribute("images", images0); //ảnh phụ
                req.getRequestDispatcher("chi_tiet_san_pham.jsp").forward(req, resp); // Chuyển tiếp đến giao diện JSP
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Sản phẩm không tồn tại.");
            }
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID sản phẩm không hợp lệ.");
        }
    }
}
