package vn.edu.hcmuaf.fit.doanweb.Controller.Admin.NewsletterSubscriber;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.Services.SendEmailServices;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import java.io.IOException;

@WebServlet("/admin/SendNewsletter")  //gửi cho từng người
public class SendNewsletterContr extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String content = request.getParameter("content");

        try {
            SendEmailServices mailService = new SendEmailServices();
            Message message = mailService.sendEmail(email, "Tin mới từ Eyestyle shop!", content);
            Transport.send(message);
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (MessagingException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
