package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.CategoriesVM;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Categories;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "AddCategoryController", value = "/admin/AddCategory")
public class AddCategoryController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}