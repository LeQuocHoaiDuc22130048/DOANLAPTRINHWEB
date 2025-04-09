package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Posts;
import vn.edu.hcmuaf.fit.doanweb.DAO.PostDao;
import vn.edu.hcmuaf.fit.doanweb.Util.LogSystem;

import javax.mail.Session;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PostsController", value = "/allPost")
public class PostsController extends HttpServlet {
    private PostDao postDao;
    private LogSystem logSystem;
    private final static String name = PostsController.class.getName();
    @Override
    public void init() throws ServletException {
        postDao = new PostDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = 17;
        try {
            List<Posts> lists = postDao.getAllPost();
            request.setAttribute("posts", lists);
            request.getRequestDispatcher("bai_viet.jsp").forward(request, response);
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
        finally {
            LogSystem.CreateLog("INFO" , name , id , ""  , "User access  post controller");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
