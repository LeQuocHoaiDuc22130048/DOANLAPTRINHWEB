package vn.edu.hcmuaf.fit.doanweb.Controller.Product;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductIndex;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoInterface;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@WebServlet("/best-seller")
public class BestSellerContr extends HttpServlet {
    private ProductDaoInterface dao = new ProductDaoImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page = Integer.parseInt(req.getParameter("page"));
        int pageSize = 9;
        int offset = (page - 1) * pageSize;

        List<ProductIndex> products = dao.getProducsBestSeller(pageSize, offset);
        int totalProducts = dao.getTotalBestSellerProducts();
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

        // Lấy danh sách yêu thích nếu đã đăng nhập
        User user = (User) req.getSession().getAttribute("user");
        Set<Integer> favoriteIds = null;
        if (user != null) {
            favoriteIds = dao.getFavoriteProductIds(user.getId());
        }

        // Gộp vào 1 object để trả JSON
        Map<String, Object> result = new HashMap<>();
        result.put("products", products);
        result.put("totalPages", totalPages);
        result.put("favoriteIds", favoriteIds);

        resp.setContentType("application/json");
        new ObjectMapper().writeValue(resp.getOutputStream(), result);

    }
}

