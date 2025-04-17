package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.doanweb.Controller.DTO.UserProfile;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDao;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Util.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet(name = "UpdateProfileController", value = "/user/updateProfile")

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)

public class UpdateProfileController extends HttpServlet {
    private UserDao userDao;

    @Override
    public void init() throws ServletException {

        userDao = new UserDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = GetDataFromCookie.getUserId(request);
        UserProfile UP = userDao.GetUser(userId);
        request.setAttribute("user", UP);
        request.getRequestDispatcher("/user/UpdateProfile.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle upload user avatar
        User user = GenerateUser.GenerateUserFromRequest(request);
        try {
            userDao.UpdateProfile(user);
            //session update avatar
            HttpSession session = request.getSession();
            session.setAttribute("avatar", user.getAvatar());
            LogSystem.CreateLog("WARNING", UpdateProfileController.class.getName(), user.getId(), "", "Cập nhật thông tin user ");
            response.sendRedirect("/DoAnWeb"+JSPPage.Index.getPage());
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
