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
        SendEmailServices services ;

        try {
            services = new SendEmailServices();
            Transport.send(services.sendEmail(email ,"Link kích hoạt tai khoản của bạn !" , "http://localhost:8080/DoAnWeb/ActiveMail/"+"?userId=1" ));
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        System.out.println("Send mail success");
        response.sendRedirect("DangKiController");
    }
}
