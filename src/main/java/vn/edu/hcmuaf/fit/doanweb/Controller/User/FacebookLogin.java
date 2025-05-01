package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/login-facebook")
public class FacebookLogin extends HttpServlet {
    private static final String CLIENT_ID = "1591074918239784";
    private static final String CLIENT_SECRET = "472ab378d7ff8d2614996d5142d4eacd";
    private static final String REDIRECT_URI = "http://localhost:8080/DoAnWeb/";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");

        if (code == null || code.isEmpty()) {
            resp.sendRedirect("login.jsp");
            return;
        }

        // 1. Exchange code for access token
        String tokenUrl = "https://graph.facebook.com/v13.0/oauth/access_token"
                + "?client_id=" + CLIENT_ID
                + "&redirect_uri=" + REDIRECT_URI
                + "&client_secret=" + CLIENT_SECRET
                + "&code=" + code;

        String response = sendGetRequest(tokenUrl);
        JsonObject jsonResponse = JsonParser.parseString(response).getAsJsonObject();
        String accessToken = jsonResponse.get("access_token").getAsString();

        // 2. Use access token to get user info
        String userInfoUrl = "https://graph.facebook.com/me?fields=id,name,email&access_token=" + accessToken;
        String userInfoResponse = sendGetRequest(userInfoUrl);
        JsonObject userJson = JsonParser.parseString(userInfoResponse).getAsJsonObject();

        String facebookId = userJson.get("id").getAsString();
        String name = userJson.get("name").getAsString();
        String email = userJson.has("email") ? userJson.get("email").getAsString() : "";

        // 3. Xử lý login thành công (ví dụ lưu session, redirect về home page)
        HttpSession session = req.getSession();
        session.setAttribute("user_name", name);
        session.setAttribute("user_email", email);

        resp.sendRedirect("home.jsp"); // Trang chính sau khi đăng nhập
    }

    private String sendGetRequest(String url) throws IOException {
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("GET");

        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuilder response = new StringBuilder();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
        return response.toString();
    }
}
