package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.Util.GetRole;
import vn.edu.hcmuaf.fit.doanweb.Enum.JSPPage;

import java.io.IOException;

@WebFilter(urlPatterns = "/user/*")
public class UserFilter implements Filter {

    @Override

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String role = GetRole.GetRoleFromToken(request, response);
        // Kiểm tra quyền hợp lệ
        if (role.equals("ADMIN") || role.equals("GUEST")) {
            res.sendRedirect(JSPPage.Login.getPage());
            return;
        }
        req.setAttribute("role", role);
        chain.doFilter(request, response);
    }
}