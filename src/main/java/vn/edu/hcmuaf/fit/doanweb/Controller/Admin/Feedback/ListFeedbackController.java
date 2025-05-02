package vn.edu.hcmuaf.fit.doanweb.Controller.Admin.Feedback;

import java.io.*;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.FeedBacks;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "ListFeedbackController", value = "/admin/Feedback")
public class ListFeedbackController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AdminService adminService = new AdminService();
        List<FeedBacks> feedBacks = adminService.getAllFeedbacks();
        request.setAttribute("feedBacks", feedBacks);
        request.getRequestDispatcher( "/admin/Feedback.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}