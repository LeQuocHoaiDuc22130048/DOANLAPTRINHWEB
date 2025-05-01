package vn.edu.hcmuaf.fit.doanweb.Controller.Product;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoInterface;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.stream.Collectors;

@WebServlet("/favorite")
public class FavoriteProductContr extends HttpServlet {
    private final ProductDaoInterface dao= new ProductDaoImp();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JsonObject json = new JsonObject();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            json.addProperty("status", "not_logged_in");
            json.addProperty("message", "Bạn cần đăng nhập để thêm sản phẩm yêu thích");
            response.getWriter().write(json.toString());
            return;
        }

        BufferedReader reader = request.getReader();
        String jsonData = reader.lines().collect(Collectors.joining());

        try {
            JsonObject body = JsonParser.parseString(jsonData).getAsJsonObject();
            int productId = body.get("productId").getAsInt();

            boolean isFavorite = dao.isFavorite(user.getId(), productId);

            if (isFavorite) {
                dao.removeFavoriteProduct(user.getId(), productId);
                json.addProperty("status", "success");
                json.addProperty("action", "removed");
                json.addProperty("message", "Đã xoá khỏi sản phẩm yêu thích");
            } else {
                dao.addFavoriteProduct(user.getId(), productId);
                json.addProperty("status", "success");
                json.addProperty("action", "added");
                json.addProperty("message", "Đã thêm vào sản phẩm yêu thích");
            }

        } catch (Exception e) {
            json.addProperty("status", "error");
            json.addProperty("message", "Lỗi xử lý dữ liệu");
        }

        response.getWriter().write(json.toString());
    }
}


