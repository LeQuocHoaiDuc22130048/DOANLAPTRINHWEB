package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.SubscriberDao;
import vn.edu.hcmuaf.fit.doanweb.DAO.SubscriberDaoImp;

import java.io.IOException;

@WebServlet("/subscribe")
public class SubscriberCtr extends HttpServlet {
    private SubscriberDao dao = new SubscriberDaoImp();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=UTF-8");
        String name = req.getParameter("name");
        String email = req.getParameter("email");

        JsonObject json = new JsonObject();
        //Kiểm tra rỗng
        if(name == null || email == null || name.trim().isEmpty() || email.trim().isEmpty()){
            json.addProperty("status","error");
            json.addProperty("message", "Vui lòng nhập đầy đủ thông tin");
            resp.getWriter().write(json.toString());
            return;
        }
        //kiem tra email hop le
        String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        if(!email.matches(emailRegex)){
            json.addProperty("status","error");
            json.addProperty("message", "Email không hợp lệ");
            resp.getWriter().write(json.toString());
            return;
        }
        //Kiểm tra email có tồn tại chưa
        if(dao.isExistEmail(email)){
            json.addProperty("status","error");
            json.addProperty("message", "Email đã được đăng kí trước đó!");
            resp.getWriter().write(json.toString());
            return;
        }

        boolean success = dao.addSubscriber(name, email);
        if (success) {
            json.addProperty("success", true);
            json.addProperty("message", "Đăng ký thành công!");
        } else {
            json.addProperty("success", false);
            json.addProperty("message", "Đăng ký thất bại, email có thể đã tồn tại.");
        }

        resp.getWriter().write(json.toString());
    }
}
