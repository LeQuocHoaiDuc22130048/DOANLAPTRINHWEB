package vn.edu.hcmuaf.fit.doanweb.Controller.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductIndex;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoInterface;
import vn.edu.hcmuaf.fit.doanweb.Util.JSPPage;

import java.io.IOException;
import java.util.*;

@WebServlet("/search")
public class SearchContr extends HttpServlet {
    private final ProductDaoInterface dao = new ProductDaoImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        String keyword = req.getParameter("keyword");
        int page = 1;
        int limit = 12;
        try {
            page = Integer.parseInt(req.getParameter("page"));
        } catch (NumberFormatException | NullPointerException e) {
            // page vẫn giữ giá trị mặc định = 1
        }

        try {
            limit = Integer.parseInt(req.getParameter("limit"));
        } catch (NumberFormatException | NullPointerException e) {
            // limit giữ mặc định = 12
        }

        int offset = (page - 1) * limit;
        
        // Trường hợp không có keyword, chuyển hướng đến trang search trống
        if (keyword == null || keyword.trim().isEmpty()) {
            RequestDispatcher dispatcher = req.getRequestDispatcher(JSPPage.Search.getPage());
            dispatcher.forward(req, resp);
            return;
        }

        try {
            List<ProductIndex> products = dao.searchProducts(keyword, offset, limit);
            int totalProducts = dao.countSearchResults(keyword);
            int totalPages = (int) Math.ceil((double) totalProducts / limit);
            
            // Tính toán các giá trị phân trang
            int startPage = Math.max(1, page - 2);
            int endPage = Math.min(totalPages, page + 2);
            boolean hasPrevious = page > 1;
            boolean hasNext = page < totalPages;

            // Lấy danh sách yêu thích nếu đã đăng nhập
            User user = (User) req.getSession().getAttribute("user");
            Set<Integer> favoriteIds = new HashSet<>();
            if (user != null) {
                favoriteIds = dao.getFavoriteProductIds(user.getId());
            }

            // Đặt các thuộc tính vào request để JSP sử dụng
            req.setAttribute("products", products);
            req.setAttribute("totalPages", totalPages);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalProducts", totalProducts);
            req.setAttribute("favoriteIds", favoriteIds);
            req.setAttribute("startPage", startPage);
            req.setAttribute("endPage", endPage);
            req.setAttribute("hasPrevious", hasPrevious);
            req.setAttribute("hasNext", hasNext);
            req.setAttribute("previousPage", page - 1);
            req.setAttribute("nextPage", page + 1);
            
            RequestDispatcher dispatcher = req.getRequestDispatcher(JSPPage.Search.getPage());
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Đã xảy ra lỗi khi tìm kiếm. Vui lòng thử lại sau.");
            RequestDispatcher dispatcher = req.getRequestDispatcher(JSPPage.Search.getPage());
            dispatcher.forward(req, resp);
        }
    }
}
