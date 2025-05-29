package vn.edu.hcmuaf.fit.doanweb.Controller.Product;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Banner;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoInterface;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/get-banners")   //trả ve json cho ajax render giao diện slider ở index
public class BannerCarouselContr extends HttpServlet {
    private final ProductDaoInterface dao = new ProductDaoImp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Banner> banners = dao.getAllBanners();
        Map<String, Object> result = new HashMap<>();
        result.put("banners", banners);
        response.setContentType("application/json");
        new ObjectMapper().writeValue(response.getOutputStream(), result);
    }
}
