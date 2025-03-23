package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Services.SendEmailServices;
import vn.edu.hcmuaf.fit.doanweb.Util.LogSystem;

import javax.mail.MessagingException;
import javax.mail.Transport;
import java.io.IOException;

@WebServlet(name = "DangKiController", value = "/sign-in")
public class DangKiController extends HttpServlet {
    private static final String Link = "http://localhost:8080/DoAnWeb/ActiveMail?userId=";
    private static final String Home ="index.jsp";
    private static final String SignIn = "sign-in";
    private static final String EmailExist = "Email used";
    private static final String SignInFailed = "Sign in failed";
    private static final String CreatedFailed = "Created failed";
    private UserDaoImp userDaoImp ;
    private LogSystem logSystem ;

    @Override
    public void init() throws ServletException {
        userDaoImp = new UserDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        // encrypt password
        String EncryptedPassword =  BCrypt.hashpw(password, BCrypt.gensalt(12)  );
        // Check email exist
        if (userDaoImp.checkEmailExists(email)) {
            request.setAttribute("Error" , EmailExist);
            request.getRequestDispatcher(SignIn).forward(request, response);
            return;
        }
        // Check create user success
        if (!userDaoImp.CreateUserTemp(userName, email, EncryptedPassword)) {
            request.setAttribute("Error" , SignInFailed);
            request.getRequestDispatcher(SignIn).forward(request, response);
            return;
        }
        System.out.println(password);
        // get user id
        int userId = userDaoImp.GetUserIdByEmail(userName);
        if (userId == -1) { request.setAttribute("Error" , CreatedFailed); return; }

        try {
            SendEmailServices    services = new SendEmailServices();
            Transport.send(services.sendEmail(email ,"Link kích hoạt tai khoản của bạn !" , Link + userId ));
            request.getRequestDispatcher(Home).forward(request, response);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
