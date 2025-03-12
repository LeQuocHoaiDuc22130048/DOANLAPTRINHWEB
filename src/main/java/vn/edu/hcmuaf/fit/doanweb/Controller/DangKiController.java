package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Services.SendEmailServices;

import javax.mail.MessagingException;
import javax.mail.Transport;
import java.io.IOException;

@WebServlet(name = "DangKiController", value = "/sign-in")
public class DangKiController extends HttpServlet {
    private static final String Link = "http://localhost:8080/DoAnWeb/ActiveMail?userId=";
    private static final String Home ="index.jsp";
    private UserDaoImp userDaoImp ;

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
        if (userDaoImp.checkEmailExists(email)) { response.sendRedirect(Home); }
        // Check create user success
        if (!userDaoImp.CreateUserTemp(userName, email, EncryptedPassword)) response.sendRedirect(Home);
        // get user id
        int userId = userDaoImp.GetUserIdByEmail(userName);
        if (userId == -1) { response.sendRedirect(Home); }
        try {
            SendEmailServices    services = new SendEmailServices();
            Transport.send(services.sendEmail(email ,"Link kích hoạt tai khoản của bạn !" , Link + userId ));
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
