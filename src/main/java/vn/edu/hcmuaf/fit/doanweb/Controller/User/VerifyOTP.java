package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/verify-otp")
public class VerifyOTP  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        Gson gson = new Gson();
        String email = req.getParameter("email");
        String otp = req.getParameter("otp");
        if (otp == null || otp.isEmpty() || email == null || email.isEmpty() ){
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            Map<String, String> response = new HashMap<>();
            out.print(gson.toJson(response));
            response.put("error", "OTP not provided in the request.");
        }
        HttpSession session = req.getSession(true);
        session.setAttribute("email", email);
        String OTP = (String) session.getAttribute("OTP");
        if (OTP == null || OTP.isEmpty() || !OTP.equals(otp)){
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            Map<String, String> response = new HashMap<>();
            response.put("error", "OTP is incorrect.");
            out.print(gson.toJson(response));
        }
        else {
            session.removeAttribute("OTP");
            session.removeAttribute("otpGeneratedTime");
            Map<String, String> response = new HashMap<>();
            response.put("success", "OTP verified successfully.");
            out.print(gson.toJson(response));
        }
        out.flush();
        out.close();
    }
}
