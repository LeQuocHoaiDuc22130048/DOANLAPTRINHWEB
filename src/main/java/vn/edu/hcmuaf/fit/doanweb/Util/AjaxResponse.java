package vn.edu.hcmuaf.fit.doanweb.Util;

import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class AjaxResponse {
    public static void response(HttpServletResponse response, String message) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.write(message);
        out.flush();
    }
}
