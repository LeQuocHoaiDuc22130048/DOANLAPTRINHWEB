package vn.edu.hcmuaf.fit.doanweb.Controller.Admin.NewsletterSubscriber;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.NewsletterSubscriber;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;
import vn.edu.hcmuaf.fit.doanweb.Services.SendEmailServices;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import java.util.List;

@WebServlet(name = "SendNewsletterAll", value = "/admin/SendNewsletterAll")
public class SendNewsletterAllContr extends HttpServlet {
    private AdminService service = new AdminService();

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String content = req.getParameter("content");
        System.out.println("Content: "+content);

        List<NewsletterSubscriber> subscribers = service.getAllNewsletterSubscribers();
        System.out.println("Subscribers: "+subscribers);
        boolean allSent = true;

        for (NewsletterSubscriber sub : subscribers) {
            try {
                SendEmailServices mailService = new SendEmailServices();
                Message message = mailService.sendEmail(sub.getEmail(), "Tin mới từ Eyestyle shop!", content);
                Transport.send(message);
            } catch (MessagingException e) {
                allSent = false;
            }
        }

        resp.setStatus(allSent ? HttpServletResponse.SC_OK : HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
}