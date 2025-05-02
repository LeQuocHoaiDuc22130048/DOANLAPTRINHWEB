package vn.edu.hcmuaf.fit.doanweb.Controller.Admin.NewsletterSubscriber;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.NewsletterSubscriber;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/Newsletter-subscriber")
public class ListNewsletterSubscriberContr extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AdminService adminService = new AdminService();
        List<NewsletterSubscriber> subscribers = adminService.getAllNewsletterSubscribers();
        request.setAttribute("subscribers", subscribers);
        request.getRequestDispatcher("/admin/NewsletterSubscriber.jsp").forward(request, response);
    }
}
