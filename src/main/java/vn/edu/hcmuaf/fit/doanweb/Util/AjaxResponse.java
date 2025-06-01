package vn.edu.hcmuaf.fit.doanweb.Util;

import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AjaxResponse {
    public static void response(HttpServletResponse response , String message) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(message);
        response.getWriter().flush();  // Đảm bảo dữ liệu được gửi đi
        response.getWriter().close();  // Đóng stream để tránh lỗi
    }

}
