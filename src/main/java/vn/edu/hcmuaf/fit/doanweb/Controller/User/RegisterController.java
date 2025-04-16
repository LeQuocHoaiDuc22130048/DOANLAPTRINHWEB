package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Services.SendEmailServices;
import vn.edu.hcmuaf.fit.doanweb.Util.JSPPage;
import vn.edu.hcmuaf.fit.doanweb.Util.LogSystem;

import javax.mail.MessagingException;
import javax.mail.Transport;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import static vn.edu.hcmuaf.fit.doanweb.Util.LogSystem.CreateLog;

@WebServlet(name = "RegisterController", value = "/sign-in")
public class RegisterController extends HttpServlet {
    private static final String Link = "http://localhost:8080/DoAnWeb/ActiveMail?userId=";
    private static final String Home = JSPPage.Index.getPage();
    private static final String SignIn = JSPPage.Register.getPage();
    private static final String EmailExist = "Email đã được sử dụng bởi người dùng khác ";
    private static final String SignInFailed = "Sign in failed";
    private static final String CreatedFailed = "Created failed";
    private static final String name = RegisterController.class.getName();
    private UserDaoImp userDaoImp;
    private LogSystem logSystem;

    @Override
    public void init() throws ServletException {
        userDaoImp = new UserDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || userName == null || password == null) {
            request.setAttribute("Error", "Please fill all the fields");
            request.getRequestDispatcher(SignIn).forward(request, response);
            return;
        }
        // encrypt password
        String EncryptedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));
        // Check email exist
        if (userDaoImp.checkEmailExists(email)) {
            request.setAttribute("Error", EmailExist);
            request.getRequestDispatcher(SignIn).forward(request, response);
            return;
        }
        // Check create user success

        if (!userDaoImp.CreateUserTemp(userName, email, EncryptedPassword)) {
            request.setAttribute("Error", SignInFailed);
            request.getRequestDispatcher(SignIn).forward(request, response);
            return;
        }
        // get user id
        int userId = userDaoImp.GetUserIdByEmail(email);
        if (userId == -1) {
            request.setAttribute("Error", CreatedFailed);
            request.getRequestDispatcher(SignIn).forward(request, response);
            return;
        }
        CreateLog("WARNING" , name  , userId , "", "User đăng ký tài khoản với user name : " + userName );
        String encoded = Base64.getEncoder().encodeToString(String.valueOf(userId).getBytes(StandardCharsets.UTF_8));
        String urlSafe = URLEncoder.encode(encoded, StandardCharsets.UTF_8);

        try {
            SendEmailServices services = new SendEmailServices();
            Transport.send(services.sendEmail(email, "Link kích hoạt tai khoản của bạn !", Link + urlSafe));
            response.sendRedirect("/DoAnWeb"+JSPPage.Index.getPage());
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
