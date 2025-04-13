package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDao;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Util.JSPPage;

import java.io.IOException;
import java.util.Base64;

@WebServlet(name = "ActiveMailController", value = "/ActiveMailController")
public class ActiveMailController extends HttpServlet {
    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserDaoImp();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String  param  = request.getParameter("userId");
        String decode = new String(Base64.getDecoder().decode(param));
        userDao.ActiveAccountExists(Integer.parseInt(decode));
        String activeSuccess = "active mail success";
        request.setAttribute("Success", activeSuccess);
        request.getRequestDispatcher(JSPPage.Index.getPage()).forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
