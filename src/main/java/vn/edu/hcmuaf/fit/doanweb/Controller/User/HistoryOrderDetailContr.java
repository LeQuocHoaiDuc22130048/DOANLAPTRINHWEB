package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.OrderDetails;
import vn.edu.hcmuaf.fit.doanweb.DAO.OrderDao;
import vn.edu.hcmuaf.fit.doanweb.DAO.OrderDaoImp;

import java.io.IOException;
import java.util.List;

@WebServlet("/user/orderDetail")
public class HistoryOrderDetailContr extends HttpServlet {
    private OrderDao dao = new OrderDaoImp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String code = request.getParameter("code");
        JsonObject json = new JsonObject();
        if (code == null || code.trim().isEmpty()) {
            json.addProperty("status", "error");
            json.addProperty("message", "Thiếu mã đơn hàng");
            response.getWriter().write(json.toString());
            return;
        }

        List<OrderDetails> details = dao.getOrderDetailsByCode(code);

        if (details == null || details.isEmpty()) {
            json.addProperty("status", "error");
            json.addProperty("message", "Không tìm thấy chi tiết đơn hàng");
        } else {
            json.addProperty("status", "success");
            Gson gson = new Gson();
            json.add("data", gson.toJsonTree(details));
        }

        response.getWriter().write(json.toString());

    }
}
