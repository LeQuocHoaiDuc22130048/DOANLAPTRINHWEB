package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Orders;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;
import vn.edu.hcmuaf.fit.doanweb.DAO.OrderDao;
import vn.edu.hcmuaf.fit.doanweb.DAO.OrderDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Util.JSPPage;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HistoryProductController", value = "/user/historyOrder")
public class HistoryOrderController extends HttpServlet {
    OrderDao dao= new OrderDaoImp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("/DoAnWeb/Login.jsp");
            return;
        }

        List<Orders> orderList = dao.getOrdersByUserId(user.getId());
        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher(JSPPage.HistoryOrder.getPage()).forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
