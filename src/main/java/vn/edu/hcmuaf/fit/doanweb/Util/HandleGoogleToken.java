package vn.edu.hcmuaf.fit.doanweb.Util;

import com.google.api.client.auth.oauth2.TokenResponse;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeTokenRequest;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.DBProperties;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Properties;
import java.util.logging.Level;

public class HandleGoogleToken {
    private static final Properties properties = new Properties();
    private static final String name = HandleGoogleToken.class.getName();

    static {
        try {
            properties.load(DBProperties.class.getClassLoader().getResourceAsStream("MiddleConfig.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
    private static final JacksonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

    public static String getDataFromToken(String code) throws IOException {
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
        // bước 3 lấy dữ liệu từ response
        int responseCode = conn.getResponseCode();
        if (responseCode != 200) {
            LogSystem.CreateLog(Level.WARNING.getName(), name, 13, "Lỗi khi lấy thông tin người dùng, mã lỗi: {0}", responseCode+"");
            // Đọc nội dung lỗi trả về từ Google để có thông tin chi tiết hơn
            BufferedReader errorReader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            StringBuilder errorSb = new StringBuilder();
            String line;
            while ((line = errorReader.readLine()) != null) {
                errorSb.append(line);
            }
            errorReader.close();
            LogSystem.CreateLog(Level.WARNING.getName(), name, 13, "Nội dung lỗi từ Google: {0}", errorSb.toString());
            throw new RuntimeException("Lỗi khi lấy thông tin người dùng, mã lỗi: " + responseCode + ", chi tiết: " + errorSb.toString());
        }
        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        reader.close();
        return sb.toString();
    }
}
