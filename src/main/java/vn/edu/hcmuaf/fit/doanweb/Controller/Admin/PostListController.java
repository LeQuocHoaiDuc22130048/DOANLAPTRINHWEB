package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.PostVM;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;
import vn.edu.hcmuaf.fit.doanweb.config.AppConfig;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "PostListController", value = "/admin/PostList")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10,  // 10 MB
        maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class PostListController extends HttpServlet {
    private AdminService service;
    private String uploadDirectory;

    @Override
    public void init() throws ServletException {
        service = new AdminService();
        uploadDirectory = AppConfig.getUploadDirectory() + File.separator + "blog_images";
        File uploadDir = new File(uploadDirectory);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "get":
                    handleGetPost(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            }
        } else {
            request.setAttribute("posts", service.getAllPosts());
            request.getRequestDispatcher("/admin/PostList.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "add":
                    handleAddPost(request, response);
                    break;
                case "edit":
                    System.out.println("Vào edit");
                    handleEditPost(request, response);
                    break;
                case "toggle":
                    handleToggleStatus(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private void handleGetPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, Object> result = new HashMap<>();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            PostVM post = service.getPostById(id);
            System.out.println("post: "+post.toString());
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            new Gson().toJson(post, response.getWriter());
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", e.getMessage());
            new Gson().toJson(result, response.getWriter());
        }
    }

    private void handleAddPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Map<String, Object> result = new HashMap<>();
        try {
            Part filePart = request.getPart("thumbnail");
            String fileName = System.currentTimeMillis() + "_" + sanitizeFileName(filePart.getSubmittedFileName());
            String filePath = uploadDirectory + File.separator + fileName;
            filePart.write(filePath);

            PostVM post = new PostVM();
            post.setTitle(request.getParameter("title"));
            post.setContent(request.getParameter("content"));
            post.setUrl(request.getParameter("url"));
            post.setThumbnail("upload/blog_images/" + fileName);

            LocalDateTime createdAt = new Date().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
            post.setCreated_at(createdAt);
            post.setAccess(0);

            boolean success = service.addPost(post);
            result.put("success", success);
            if (!success) {
                result.put("message", "Không thể thêm bài viết");
            }
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", e.getMessage());
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        new Gson().toJson(result, response.getWriter());
    }

    private void handleEditPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Map<String, Object> result = new HashMap<>();
        System.out.println("Vào handelEditPost r");
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            PostVM post = service.getPostById(id);

            if (post != null) {
                post.setTitle(request.getParameter("title"));
                post.setContent(request.getParameter("content"));
                post.setUrl(request.getParameter("url"));
                System.out.println(request.getParameter("title"));

                Part filePart = request.getPart("thumbnail");
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = System.currentTimeMillis() + "_" + sanitizeFileName(filePart.getSubmittedFileName());
                    String filePath = uploadDirectory + File.separator + fileName;
                    filePart.write(filePath);
                    post.setThumbnail("upload/blog_images/" + fileName);
                }

                boolean success = service.updatePost(post);
                result.put("success", success);
                if (!success) {
                    result.put("message", "Không thể cập nhật bài viết");
                }
            } else {
                result.put("success", false);
                result.put("message", "Không tìm thấy bài viết");
            }
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", e.getMessage());
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        new Gson().toJson(result, response.getWriter());
    }

    private void handleToggleStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, Object> result = new HashMap<>();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int status = Integer.parseInt(request.getParameter("status"));
            boolean success = service.toggleStatus(id, status);
            result.put("success", success);
            if (!success) {
                result.put("message", "Không thể cập nhật trạng thái");
            }
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", e.getMessage());
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        new Gson().toJson(result, response.getWriter());
    }

    private String sanitizeFileName(String fileName) {
        return fileName.replaceAll("[^a-zA-Z0-9\\.\\-_]", "_");
    }
}