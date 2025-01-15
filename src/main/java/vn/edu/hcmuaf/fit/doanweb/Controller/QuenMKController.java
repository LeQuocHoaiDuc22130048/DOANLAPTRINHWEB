package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Services.SendEmailServices;

import javax.mail.MessagingException;
import java.io.IOException;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "QuenMKController", value = "/forget")
public class QuenMKController extends HttpServlet {

    private UserDaoImp userDaoImp = new UserDaoImp();
    private SendEmailServices mailService = new SendEmailServices();

    public QuenMKController() {

    }

    private static final String EMAIL_PATTERN = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
    private static final Pattern pattern = Pattern.compile(EMAIL_PATTERN);

    private static final Logger logger = Logger.getLogger(QuenMKController.class.getName());

    private boolean isValidEmail(String email) {
        if (email == null) {
            return false;
        }
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");

        logger.info("Received POST request at /forget with username: " + username + " and email: " + email);
        if (!isValidEmail(email)) {
            request.setAttribute("fail-message", "Email không hợp lệ");
            request.getRequestDispatcher("quen_mat_khau.jsp").forward(request, response);
            return;
        }

        if (!userDaoImp.checkUserExist(username, email)) {
            request.setAttribute("fail-message", "Tài khoản hoặc email không tồn tại trong hệ thống.");
            request.getRequestDispatcher("quen_mat_khau.jsp").forward(request, response);
            return;
        }

        String password = mailService.getPassword(username, email);

        if (password == null) {
            request.setAttribute("fail-message", "Không tìm thấy mật khẩu");
            request.getRequestDispatcher("quen_mat_khau.jsp").forward(request, response);
            return;

        }


        String subject = "Khôi phục mật khẩu";
        String content = "Mật khẩu của bạn là: " + password;

        try {
                mailService.sendEmail(email, subject, content);
                request.setAttribute("success-message", "Tài khoản và email hợp lệ. Mật khẩu đã được gửi qua email.");
                request.getRequestDispatcher("quen_mat_khau.jsp").forward(request, response);

        } catch (MessagingException e) {
            e.printStackTrace();
            logger.severe("Failed to send email: " + e.getMessage());
            request.setAttribute("fail-message", "Không thể gửi email. Vui lòng thử lại sau.");
            request.getRequestDispatcher("quen_mat_khau.jsp").forward(request, response);
        }

        logger.info("Finished processing POST request at /forget");


    }
}
