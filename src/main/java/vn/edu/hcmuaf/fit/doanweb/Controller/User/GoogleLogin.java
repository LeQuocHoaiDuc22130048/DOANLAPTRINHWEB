package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import com.google.api.client.auth.oauth2.TokenResponse;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeTokenRequest;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.doanweb.Controller.DTO.UserProfile;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.DBProperties;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/login-Google")
public class GoogleLogin extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(GoogleLogin.class.getName());
    private static Properties properties = new Properties();

    static {
        try {
            properties.load(DBProperties.class.getClassLoader().getResourceAsStream("MiddleConfig.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
    private static final JacksonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
    UserDaoImp userDaoImp = new UserDaoImp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String error = request.getParameter("error");

        if (error != null) {
            LOGGER.log(Level.WARNING, "Lỗi từ Google khi nhận mã ủy quyền: {0}", error);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Lỗi từ Google: " + error);
            return;
        }

        if (code == null || code.isEmpty()) {
            LOGGER.log(Level.WARNING, "Không nhận được mã code từ Google");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Không nhận được mã code từ Google");
            return;
        }

        try {
            // Bước 1: Lấy access token
            TokenResponse tokenResponse = new GoogleAuthorizationCodeTokenRequest(
                    HTTP_TRANSPORT,
                    JSON_FACTORY,
                    properties.getProperty("CLIENT_ID"),
                    properties.getProperty("CLIENT_SECRET"),
                    code,
                    properties.getProperty("REDIRECT_URI")
            ).execute();

            String accessToken = tokenResponse.getAccessToken();

            // Bước 2: Gửi yêu cầu tới Google để lấy thông tin người dùng
            URL url = new URL("https://www.googleapis.com/oauth2/v3/userinfo");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

            int responseCode = conn.getResponseCode();
            if (responseCode != 200) {
                LOGGER.log(Level.SEVERE, "Lỗi khi lấy thông tin người dùng, mã lỗi: {0}", responseCode);
                // Đọc nội dung lỗi trả về từ Google để có thông tin chi tiết hơn
                BufferedReader errorReader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                StringBuilder errorSb = new StringBuilder();
                String line;
                while ((line = errorReader.readLine()) != null) {
                    errorSb.append(line);
                }
                errorReader.close();
                LOGGER.log(Level.SEVERE, "Nội dung lỗi từ Google: {0}", errorSb.toString());
                throw new RuntimeException("Lỗi khi lấy thông tin người dùng, mã lỗi: " + responseCode + ", chi tiết: " + errorSb.toString());
            }

            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            reader.close();

            JSONObject jsonObject = new JSONObject(sb.toString());

            String username = jsonObject.optString("given_name");
            String email = jsonObject.optString("email");
            String picture = jsonObject.optString("picture");
            System.out.println(jsonObject.toString());
            if (!userDaoImp.checkEmailExists(email)) {
                userDaoImp.CreateUserTemp(username, email, picture);
                System.out.println("Create User Temp");
            } else {
                int userId = userDaoImp.GetUserIdByEmail(email);
                UserProfile profile = userDaoImp.GetUser(userId);
                picture = profile.getAvatar();
                email = profile.getEmail();
                username = profile.getName();
            }
            HttpSession session = request.getSession();
            session.setAttribute("name", username);
            session.setAttribute("email", email);
            session.setAttribute("avatar", picture);
            session.setAttribute("role", "USER");

            response.sendRedirect("/DoAnWeb");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Lỗi xác thực với Google: {0}");
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi xác thực với Google: " + e.getMessage());
        }
    }
}