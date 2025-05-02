package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;
import vn.edu.hcmuaf.fit.doanweb.Services.SendEmailServices;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import java.io.IOException;

@WebServlet(name = "ReplyFeedback", value = "/admin/ReplyFeedback")
public class ReplyFeedbackContr extends HttpServlet {
    private AdminService service = new AdminService();

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String email = req.getParameter("email");
        String content = req.getParameter("content");

        // Cập nhật vào DB
        boolean updated = service.replyFeedback(id, content); // cập nhật content, updatedAt, status = 1

        // Gửi email
        if (updated) {
            try {
                SendEmailServices mailService = new SendEmailServices();
                Message message = mailService.sendEmail(email, "Phản hồi từ Evestyle shop", content);
                Transport.send(message);
                resp.setStatus(HttpServletResponse.SC_OK);
            } catch (MessagingException e) {
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
