package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Services.SendEmailServices;

import javax.mail.MessagingException;
import javax.mail.Transport;
import java.io.IOException;

@WebServlet(name = "DangKiController", value = "/sign-in")
public class DangKiController extends HttpServlet {
    private static final String Link = "http://localhost:8080/DoAnWeb/ActiveMail?userId=";
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
        System.out.println(userName);
        System.out.println(email);
        System.out.println(password);
        if (!userDaoImp.CreateUserTemp(userName, email, password)) response.sendRedirect("index.jsp"); ;
        int userId = userDaoImp.GetUserIdByEmail(email);


        try {
            SendEmailServices    services = new SendEmailServices();
            Transport.send(services.sendEmail(email ,"Link kích hoạt tai khoản của bạn !" , Link + userId ));
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        System.out.println("Send mail success");
        response.sendRedirect("index.jsp");
    }
}
