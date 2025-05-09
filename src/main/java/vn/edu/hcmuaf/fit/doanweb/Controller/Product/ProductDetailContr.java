package vn.edu.hcmuaf.fit.doanweb.Controller.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Brands;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductImage;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductIndex;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoInterface;
import vn.edu.hcmuaf.fit.doanweb.Enum.JSPPage;

import java.io.IOException;
import java.util.List;

@WebServlet(name="Detail", value="/product-detail")
public class ProductDetailContr extends HttpServlet {
    ProductDaoInterface dao = new ProductDaoImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            int id = Integer.parseInt(req.getParameter("id"));
            ProductIndex product = dao.getProductById(id);
            List<ProductImage> images0= dao.getImagesByProductId(id);

            if (product != null) {
                int brand_id= product.getBrandId();
                Brands brand= dao.getBrandById(brand_id);
                req.setAttribute("brand", brand);
                req.setAttribute("product", product);
                req.setAttribute("images", images0); //ảnh phụ
                req.setAttribute("shape",dao.getFrameShapeById(product.getShapeId()));
                req.setAttribute("category",dao.getCategoryById(id));
                req.setAttribute("brandList",dao.getProductsByBrandId(brand_id));
                req.getRequestDispatcher(JSPPage.ProductDetail.getPage()).forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Sản phẩm không tồn tại.");
            }
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID sản phẩm không hợp lệ.");
        }
    }

}
