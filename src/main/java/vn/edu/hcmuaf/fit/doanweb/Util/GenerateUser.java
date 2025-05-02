package vn.edu.hcmuaf.fit.doanweb.Util;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

public class GenerateUser {
    public static User GenerateUserFromRequest (HttpServletRequest request ) throws ServletException, IOException {
        // Handle user upload avatar !
        Part filePart = request.getPart("avatar");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadDir = "C:/Users/nhuta/Downloads/DOANLAPTRINHWEB/src/main/webapp/assets/images/Avatar";
        File uploadDirFile = new File(uploadDir);
        String saveFile = uploadDir + File.separator + fileName;
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs();
        }
        if (!fileName.isEmpty()) {
            filePart.write(saveFile);
        }
        // get parameter from form submit !
        int id  = GetDataFromCookie.getUserId(request);
        String name = request.getParameter("name");
        String email = request.getParameter("Email");
        String phone = request.getParameter("Phone");
        String password = request.getParameter("Password");
        String EncryptedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));
        String address = GenerateAddress.getAddress(request);
        // Create user
        User user = new User();
        user.setId(id);
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setPassword(EncryptedPassword);
        user.setAvatar("/assets/images/Avatar/" + fileName);
        return user;
    }
}
