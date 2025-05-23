package vn.edu.hcmuaf.fit.doanweb.Controller.Admin.Banner;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Banner;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/Banner-carousel")  //get all banner cho giao diện admin
public class BannerCarousel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminService adminService = new AdminService();
        List<Banner> banners = adminService.getAllBanners();
        request.setAttribute("banners", banners);
        request.getRequestDispatcher( "/admin/BannerCarousel.jsp").forward(request, response);
    }
}
