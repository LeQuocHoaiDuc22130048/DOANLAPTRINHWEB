package vn.edu.hcmuaf.fit.doanweb.Controller;

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
import java.util.Base64;

@WebServlet(name = "DangKiController", value = "/sign-in")
public class DangKiController extends HttpServlet {
    private static final String Link = "http://localhost:8080/DOANWEB/ActiveMail?userId=";
    private static final String Home = JSPPage.Index.getPage();
    private static final String SignIn = JSPPage.Register.getPage();
    private static final String EmailExist = "Email đã được sử dụng bởi người dùng khác ";
    private static final String SignInFailed = "Sign in failed";
    private static final String CreatedFailed = "Created failed";
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
        System.out.println(password);

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
        String encode = Base64.getEncoder().encodeToString(String.valueOf(userId).getBytes());
        try {
            SendEmailServices services = new SendEmailServices();
            Transport.send(services.sendEmail(email, "Link kích hoạt tai khoản của bạn !", Link + encode));
            request.getRequestDispatcher(Home).forward(request, response);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
