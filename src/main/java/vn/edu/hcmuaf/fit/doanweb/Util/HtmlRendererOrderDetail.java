package vn.edu.hcmuaf.fit.doanweb.Util;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

public class HtmlRendererOrderDetail {
    public static String renderJspToHtml(HttpServletRequest req, HttpServletResponse resp, String jspPath) throws ServletException, IOException {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);

        HttpServletResponseWrapperCapture responseWrapper = new HttpServletResponseWrapperCapture(resp, pw);

        ServletContext context = req.getServletContext();
        RequestDispatcher requestDispatcher = context.getRequestDispatcher(jspPath);

        requestDispatcher.include(req, responseWrapper);

        return sw.toString();
    }
}
