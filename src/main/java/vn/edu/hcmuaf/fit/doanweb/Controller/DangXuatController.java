package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.Util.JSPPage;

import java.io.IOException;

@WebServlet(name = "DangXuatController", value = "/logout")
public class DangXuatController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    session.invalidate();
    response.sendRedirect(JSPPage.Index.getPage());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   doGet(request, response);
    }
}
