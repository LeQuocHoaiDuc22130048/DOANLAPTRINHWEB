package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDao;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;

import java.io.IOException;

@WebServlet(name = "ActiveMail", value = "/ActiveMail")
public class ActiveMail extends HttpServlet {
    private UserDao userDao;
    private String Home = "index.jsp";
    private String ActiveSuccess = "active mail success";
    @Override
    public void init() throws ServletException {
        userDao = new UserDaoImp();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        userDao.ActiveAccountExists(userId);
        request.setAttribute("Success", ActiveSuccess);
        request.getRequestDispatcher(Home).forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
