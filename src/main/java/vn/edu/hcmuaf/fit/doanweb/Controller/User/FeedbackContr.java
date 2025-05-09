package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDao;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;

import java.io.IOException;

@WebServlet("/send-feedback")
public class FeedbackContr extends HttpServlet {
    private final UserDao dao = new UserDaoImp();

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Validate đầu vào phía server (phòng trường hợp client bypass)
        if (name == null || email == null || message == null ||
                name.trim().isEmpty() || email.trim().isEmpty() || message.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Thiếu thông tin bắt buộc\"}");
            return;
        }

        try {
            dao.insertFeedback(name, email, message);
            response.setStatus(HttpServletResponse.SC_OK); // 200
            response.getWriter().write("{\"status\":\"ok\", \"message\":\"Gửi phản hồi thành công, Chúng tôi sẽ phản hồi qua email sớm nhất\"}");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Lỗi máy chủ. Vui lòng thử lại sau\"}");
        }
    }
}