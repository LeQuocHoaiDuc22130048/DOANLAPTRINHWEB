package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.Util.JSPPage;
import vn.edu.hcmuaf.fit.doanweb.Util.JwtUtil;

import java.io.IOException;

@WebFilter(filterName = "UserFilter")
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

        if (token != null && token.startsWith("Bearer ")) {
            token = token.substring(7); // Bỏ chữ "Bearer "
            try {
                String role = JWT.require(Algorithm.HMAC256(String.valueOf(JwtUtil.SECRET_KEY)))
                        .build()
                        .verify(token)
                        .getClaim("role").asString();

                req.setAttribute("role", role); // Lưu vào request
                if (role.equals("admin") || role.equals("guest")) {
                    res.sendRedirect(JSPPage.Index.getPage());
                    return ;
                }
                chain.doFilter(request, response);
                return;
            } catch (JWTVerificationException e) {
                res.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid token");
                return;
            }
        }

        res.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Token required");
    }
}