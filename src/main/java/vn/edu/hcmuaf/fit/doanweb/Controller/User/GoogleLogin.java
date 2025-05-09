package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.doanweb.Controller.DTO.UserProfile;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Util.HandleGoogleToken;
import vn.edu.hcmuaf.fit.doanweb.Enum.JSPPage;
import vn.edu.hcmuaf.fit.doanweb.Util.JwtUtil;
import vn.edu.hcmuaf.fit.doanweb.Util.LogSystem;

import java.io.IOException;
import java.util.logging.Level;

@WebServlet("/login-Google")
public class GoogleLogin extends HttpServlet {
    public static final String name = GoogleLogin.class.getName();
    UserDaoImp userDaoImp = new UserDaoImp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        if (error != null) {
            LogSystem.CreateLog(Level.WARNING.getName(), name, 13, "Lỗi từ Google khi nhận mã ủy quyền: {0}", error);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Lỗi từ Google: " + error);
            return;
        }
        if (code == null || code.isEmpty()) {
            LogSystem.CreateLog(Level.WARNING.getName(), name, 13, "Không nhận được mã code từ Google", "");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Không nhận được mã code từ Google");
            return;
        }
        try {
            String token = HandleGoogleToken.getDataFromToken(code);
            JSONObject jsonObject = new JSONObject(token);
            String username = jsonObject.optString("given_name");
            String email = jsonObject.optString("email");
            String picture = jsonObject.optString("picture");
            if (!userDaoImp.checkEmailExists(email)) {
                userDaoImp.CreateUserTemp(username, email, picture);
                System.out.println("Create User Temp");
            }
            int userId = userDaoImp.GetUserIdByEmail(email);
            UserProfile profile = userDaoImp.GetUser(userId);
            picture = profile.getAvatar();
            username = profile.getName();
            String role = profile.getRole();
            // create token
            String JWTtoken = JwtUtil.generateToken(userId, role, username);
            response.setContentType("application/json");
            response.setHeader("Authorization", "Bearer " + JWTtoken);
            //create session
            HttpSession session = request.getSession();
            session.setAttribute("avatar", picture);
            session.setAttribute("userId", userId);
            // tạo cookie lưu thông tin token
            Cookie jwtCookie = new Cookie("Authorization", JWTtoken);
            jwtCookie.setHttpOnly(true);
            jwtCookie.setSecure(true); // chỉ nên dùng khi dùng HTTPS
            jwtCookie.setPath("/");
            response.addCookie(jwtCookie);
            if (role.equals("ADMIN")) {
                response.sendRedirect("/DoAnWeb"+JSPPage.AdminDashBoard.getPage());
            }
            else {
                response.sendRedirect("/DoAnWeb"+JSPPage.Index.getPage());

            }

        } catch (Exception e) {
            LogSystem.CreateLog(Level.WARNING.getName(), name, 13, "Lỗi xác thực với Google: {0}" , "");
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi xác thực với Google: " + e.getMessage());
        }
    }
}