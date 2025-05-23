package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ValidationMail", value = "/ValidationMail")
public class ValidationMail extends HttpServlet {
    private final UserDaoImp userDao = new UserDaoImp();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        String email = (String) request.getParameter("email");
        Map<String, Boolean> result = new HashMap<>();
        if(userDao.checkEmailExists(email)) {

            result.put("isSuccess", true);
            out.print(gson.toJson(result));
        }
        else {
            result.put("isSuccess",false);
            out.print(gson.toJson(response));
        }
        out.flush();
        out.close();
    }

}
