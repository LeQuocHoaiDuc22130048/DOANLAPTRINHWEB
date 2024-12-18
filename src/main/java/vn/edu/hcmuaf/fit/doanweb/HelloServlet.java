package vn.edu.hcmuaf.fit.doanweb;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
//    private String message;
//
//    public void init() {
//        message = "Hello World!";
//    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        String name= request.getParameter("name");

        // Hello
        PrintWriter out = response.getWriter();
//        out.println("<html><body>");
        out.println("<h1>Xin chào: " + name + " nha</h1>");
//        out.println("</body></html>");
    }

    public void destroy() {
    }
}