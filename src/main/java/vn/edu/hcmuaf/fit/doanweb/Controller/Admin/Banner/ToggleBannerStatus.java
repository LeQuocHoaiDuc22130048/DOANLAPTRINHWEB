package vn.edu.hcmuaf.fit.doanweb.Controller.Admin.Banner;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

import java.io.IOException;

@WebServlet("/admin/ToggleBannerStatus")
public class ToggleBannerStatus extends HttpServlet {
    private final AdminService adminService = new AdminService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bannerId = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status")); // 1 hoặc 0

        boolean updated = adminService.updateStatusBanner(bannerId, status);
        if (updated) {
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
