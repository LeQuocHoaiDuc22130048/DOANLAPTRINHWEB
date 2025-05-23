package vn.edu.hcmuaf.fit.doanweb.Controller.Admin.Banner;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/admin/edit-banner")
@MultipartConfig
public class EditBanner extends HttpServlet {
    private final AdminService adminService = new AdminService();
    private static final String SAVE_DIR = "assets/images/slider";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String link = request.getParameter("link_url");

        Part imagePart = request.getPart("image");
        String imageUrl = null;

        if (imagePart != null && imagePart.getSize() > 0) {
            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
            String savePath = getServletContext().getRealPath(SAVE_DIR);
            File imageDir = new File(savePath);
            if (!imageDir.exists()) {
                imageDir.mkdirs();
            }

            imagePart.write(savePath + File.separator + fileName);
            imageUrl = SAVE_DIR + "/" + fileName;
        }

        boolean success = adminService.updateBanner(id, title, link, imageUrl);
        response.setStatus(success ? 200 : 500);
    }
}


