package vn.edu.hcmuaf.fit.doanweb.Controller.Validation;

import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Util.AjaxResponse;

import java.io.IOException;

@WebServlet(name = "CheckEmail", value = "/CheckEmail")
public class CheckEmail extends HttpServlet {
    public UserDaoImp userDaoImp ;

    @Override
    public void init() throws ServletException {
        userDaoImp = new UserDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("isSuccess", userDaoImp.checkEmailExists(email));
        AjaxResponse.response(response, jsonObject.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
