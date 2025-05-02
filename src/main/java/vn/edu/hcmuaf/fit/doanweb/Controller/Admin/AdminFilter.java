package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.Util.GetRole;
import vn.edu.hcmuaf.fit.doanweb.Util.JSPPage;
import vn.edu.hcmuaf.fit.doanweb.Util.JwtUtil;

import java.io.IOException;

@WebFilter(filterName = "AdminFilter", urlPatterns = "/admin/*")
public class AdminFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String role = GetRole.GetRoleFromToken(request, response);
        // Debug role
        System.out.println("Role: " + role);

        // Kiểm tra quyền hợp lệ
        if (role.equals("USER") || role.equals("GUEST")) {
            res.sendRedirect(JSPPage.Login.getPage());
            return;
        }

        // Cho phép đi tiếp
        req.setAttribute("role", role);
        chain.doFilter(request, response);

    }
}