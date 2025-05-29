package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDao;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Enum.JSPPage;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

@WebServlet(name = "ActiveMailController", value = "/ActiveMail")
public class ActiveMailController extends HttpServlet {
    private UserDao userDao;
    @Override
    public void init() throws ServletException {
        userDao = new UserDaoImp();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String  param  = request.getParameter("userId");
        String decodedString = new String(Base64.getDecoder().decode(param), StandardCharsets.UTF_8);
       if(userDao.ActiveAccountExists(Integer.parseInt(decodedString))){
           response.sendRedirect("/DoAnWeb"+JSPPage.Index.getPage());
           return;
       }
       response.sendRedirect(JSPPage.Login.getPage());
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
