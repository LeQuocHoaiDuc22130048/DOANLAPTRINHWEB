package vn.edu.hcmuaf.fit.doanweb.Util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.Enum.JSPPage;

import java.io.IOException;

public class GetRole {
    public static String GetRoleFromToken(ServletRequest request, ServletResponse response) throws IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String role = "GUEST";
        String token = req.getHeader("Authorization");

// Nếu có header token → lấy token
        if (token != null && token.startsWith("Bearer ")) {
            token = token.substring(7); // Bỏ chữ "Bearer "
        } else {
            // Nếu không có header, thử lấy token từ cookie
            Cookie[] cookies = req.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("Authorization")) {
                        token = cookie.getValue();
                        break;
                    }
                }
            }
        }
// Nếu vẫn không có token → báo lỗi
        if (token == null) {
            res.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Token required");
        }

        try {
            // Xác thực và lấy thông tin role từ token
            role = JWT.require(Algorithm.HMAC256(JwtUtil.SECRET_KEY))
                    .build()
                    .verify(token)
                    .getClaim("role")
                    .asString();

            // Nếu role null hoặc rỗng → từ chối
            if (role == null || role.isEmpty()) {
                res.sendRedirect("/DoAnWeb" + JSPPage.Index.getPage());
            }
        } catch (JWTVerificationException e) {
            // Nếu token không hợp lệ hoặc hết hạn
            res.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid or expired token");
        }
        return role;
    }
}
