package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.Util.JSPPage;
import vn.edu.hcmuaf.fit.doanweb.Util.JwtUtil;

import java.io.IOException;

@WebFilter(urlPatterns = "/user/*")
public class UserFilter implements Filter {

    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

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
            return;
        }

        try {
            // Xác thực và lấy thông tin role từ token
            String role = JWT.require(Algorithm.HMAC256(JwtUtil.SECRET_KEY))
                    .build()
                    .verify(token)
                    .getClaim("role")
                    .asString();

            // Nếu role null hoặc rỗng → từ chối
            if (role == null || role.isEmpty()) {
                res.sendRedirect(JSPPage.Index.getPage());
                return;
            }

            // Debug role
            System.out.println("Role: " + role);

            // Kiểm tra quyền hợp lệ
            if (role.equals("ADMIN") || role.equals("GUEST")) {
                res.sendRedirect(JSPPage.Index.getPage());
                return;
            }

            // Cho phép đi tiếp
            req.setAttribute("role", role);
            chain.doFilter(request, response);

        } catch (JWTVerificationException e) {
            // Nếu token không hợp lệ hoặc hết hạn
            res.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid or expired token");
        }

    }
}