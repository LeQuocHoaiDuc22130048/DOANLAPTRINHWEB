package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.doanweb.Controller.DTO.UserProfile;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDao;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Util.GenerateAddress;
import vn.edu.hcmuaf.fit.doanweb.Util.GetDataFromCookie;
import vn.edu.hcmuaf.fit.doanweb.Util.JSPPage;
import vn.edu.hcmuaf.fit.doanweb.Util.LogSystem;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet(name = "UpdateProfileController", value = "/user/updateProfile")

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB threshold for in-memory storage
        maxFileSize = 1024 * 1024 * 10,      // 10MB maximum file size
        maxRequestSize = 1024 * 1024 * 50    // 50MB maximum request size
)

public class UpdateProfileController extends HttpServlet {
    private UserDao userDao;

    @Override
    public void init() throws ServletException {

        userDao = new UserDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String avatar = (String) session.getAttribute("avatar");
        int userId = GetDataFromCookie.getUserId(request);
        UserProfile UP = userDao.GetUser(userId);
        request.setAttribute("user", UP);
        request.getRequestDispatcher("/user/UpdateProfile.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle file upload
        Part filePart = request.getPart("avatar"); // Match "name" in input field
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadDir = getServletContext().getRealPath("/")
                + "assets" + File.separator + "images" + File.separator + "Avatar" + File.separator;

        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdir();
        }
        if (!fileName.isEmpty()) {
            filePart.write(uploadDir  + fileName);
        }
        int userId = GetDataFromCookie.getUserId(request);
        String name = request.getParameter("name");
        String email = request.getParameter("Email");
        String phone = request.getParameter("Phone");
        String password = request.getParameter("Password");
        String EncryptedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));
        String address = GenerateAddress.getAddress(request);
        User user = new User();
        user.setId(userId);
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setPassword(EncryptedPassword);
        user.setAvatar("/assets/images/Avatar/" + fileName);
        try {
            userDao.UpdateProfile(user);
            LogSystem.CreateLog("WARNING" , UpdateProfileController.class.getName() , userId , "" , "Cập nhật thông tin user " );
            response.sendRedirect(JSPPage.Index.getPage());
        }
        catch (Exception e) {
            e.printStackTrace();
        }


    }
}
