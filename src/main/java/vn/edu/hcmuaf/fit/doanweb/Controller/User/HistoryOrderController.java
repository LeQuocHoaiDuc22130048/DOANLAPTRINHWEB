package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Orders;
import vn.edu.hcmuaf.fit.doanweb.DAO.OrderDao;
import vn.edu.hcmuaf.fit.doanweb.DAO.OrderDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Enum.JSPPage;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HistoryProductController", value = "/user/historyOrder")
public class HistoryOrderController extends HttpServlet {
    OrderDao dao= new OrderDaoImp();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        List<Orders> orderList = dao.getOrdersByUserId(userId);
        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher(JSPPage.HistoryOrder.getPage()).forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
