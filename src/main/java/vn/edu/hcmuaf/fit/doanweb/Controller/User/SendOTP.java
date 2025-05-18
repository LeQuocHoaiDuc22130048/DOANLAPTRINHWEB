package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Services.SendEmailServices;
import vn.edu.hcmuaf.fit.doanweb.Util.GenerateOTP;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/send-otp")
public class SendOTP  extends HttpServlet {
    private UserDaoImp userDao = new UserDaoImp();
    private SendEmailServices emailServices = new SendEmailServices();

    public SendOTP() throws MessagingException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        Gson gson = new Gson();
        String email = (String) req.getParameter("email"); // Cast về String một cách an toàn

        if (email == null || email.isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            Map<String, String> response = new HashMap<>();
            response.put("error", "Email not provided in the request.");
            out.print(gson.toJson(response));
            out.close();
            return;
        }

        if (!userDao.checkEmailExists(email)) {
            resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
            Map<String, String> response = new HashMap<>();
            response.put("error", "User with this email not found.");
            out.print(gson.toJson(response));
            out.close();
            return;
        }

        String OTP = GenerateOTP.GenerateSecureOTP(6);
        try {
           Message message =  emailServices.sendEmail(email, "Web_eyestyle gửi đến bạn mã OTP ", "Đây là otp của bạn vui lòng không cung cấp cho bất kỳ bên nào khác: " + OTP);
            Transport.send(message);
            HttpSession session = req.getSession(true);
            session.setAttribute("OTP", OTP);
            session.setAttribute("otpGeneratedTime", System.currentTimeMillis()); // Lưu thời gian tạo OTP

            Map<String, String> response = new HashMap<>();
            response.put("success", "OTP sent successfully to " + email);
            out.print(gson.toJson(response));

        } catch (MessagingException e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            Map<String, String> response = new HashMap<>();
            response.put("error", "Failed to send OTP. Please try again later.");
            out.print(gson.toJson(response));
        } finally {
            out.flush();
        }

    }
}
