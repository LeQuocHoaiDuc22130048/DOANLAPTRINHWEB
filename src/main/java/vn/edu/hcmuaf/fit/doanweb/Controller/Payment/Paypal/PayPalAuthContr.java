package vn.edu.hcmuaf.fit.doanweb.Controller.Payment.Paypal;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

@WebServlet("/PayPalAuthContr")
public class PayPalAuthContr extends HttpServlet {
    private static final String CLIENT_ID= "AcfxEHNy5kNjuU9Uv8VBHkWMdK0q4_o2k8vKAEvWbM4OgthZBuvRsGM2XuvAcEiWvayc6ZeJBJJ4oRDY";
    private static final String SECRET ="ELwNCfaDCKHiYahHWm7gnYdNKnv_UFsXRdcRKvtamxJp6uItgROjZv69zLxkCYqw51irCIpyzw0MXbc3";
    private static final String PAYPAL_API= "https://api-m.sandbox.paypal.com/v1/oauth2/token";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"access_token\": \"" + getAccessToken() + "\"}");
    }

    public static String getAccessToken() throws ServletException, IOException {
        String auth= CLIENT_ID+":"+SECRET;
        String encodedAuth = Base64.getEncoder().encodeToString(auth.getBytes(StandardCharsets.UTF_8));

        URL url= new URL(PAYPAL_API);
        HttpURLConnection conn= (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "Basic " + encodedAuth);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            os.write("grant_type=client_credentials".getBytes(StandardCharsets.UTF_8));
        }

        InputStream is = conn.getInputStream();
        byte[] responseBytes = is.readAllBytes();
        String response = new String(responseBytes, StandardCharsets.UTF_8);

        JsonObject jsonResponse = JsonParser.parseString(response).getAsJsonObject();
        return jsonResponse.get("access_token").getAsString();

    }





}
