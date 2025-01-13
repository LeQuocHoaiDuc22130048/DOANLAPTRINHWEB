package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.ProductVM;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;
import vn.edu.hcmuaf.fit.doanweb.Services.ProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FilterController", value = "/filter")
public class FilterController extends HttpServlet {

        private static final int PRODUCTS_PER_PAGE = 9;
        private final AdminService service = new AdminService();
        private final ProductService proService = new ProductService();

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            List<ProductVM> products = new ArrayList<>();

            // Kiểm tra tham số lọc
            String filterMaterial = request.getParameter("material");
            String filterGender = request.getParameter("gender");
            String filterColor = request.getParameter("color");
            String filterShape = request.getParameter("shape");
            String filterBrand = request.getParameter("brand");
            String filterCate = request.getParameter("category");


            if (filterMaterial == null && filterGender == null && filterColor==null
            && filterShape==null && filterBrand==null && filterCate==null) {
                // Nếu không có tham số lọc, lấy tất cả sản phẩm
                products = service.getAllProduct().stream()
                        .map(mat -> new ProductVM(mat.getId(), mat.getProductName(), mat.getPrice(), mat.getImg()))
                        .toList();

            } else {
                if (filterColor != null && !filterColor.isEmpty()) {
                    // Lọc theo chất liệu
                    List<ProductOfColor> listOfColor = proService.getProductOfColor(filterColor);
                    products = listOfColor.stream()
                            .map(mat -> new ProductVM(mat.getId(), mat.getName(), mat.getPrice(), mat.getPath(),mat.getColor()))
                            .toList();
                }


                if (filterGender != null && !filterGender.isEmpty()) {
                    // Lọc theo giới tính
                    int genderValue = -1;
                    switch (filterGender.toLowerCase()) {
                        case "nam":
                            genderValue = 1; // Nam
                            break;
                        case "nu":
                            genderValue = 2; // Nữ
                            break;
                        case "unisex":
                            genderValue = 3; // Unisex
                            break;
                        case "tre em":
                            genderValue=4;
                            break;
                        default:
                            genderValue = -1; // Mặc định
                            break;
                    }

                    // Lấy sản phẩm theo giới tính
                    List<ProductOfGender> listOfGender = proService.getProductOfGender(genderValue);
                    products = listOfGender.stream()
                            .map(mat -> new ProductVM(mat.getId(), mat.getName(), mat.getPrice(), mat.getPath()))
                            .toList();
                }

                if(filterMaterial!=null && !filterMaterial.isEmpty()){
                    List<ProductOfMaterial> listOfMaterial = proService.getProductOfMaterial(filterMaterial);
                    products = listOfMaterial.stream()
                            .map(mat -> new ProductVM(mat.getId(), mat.getName(), mat.getPrice(), mat.getPath()))
                            .toList();

                }

                if(filterShape!=null && !filterShape.isEmpty()){
                    int shapeValue = -1;

                    switch(filterShape.toLowerCase()){
                        case "hinh thang":
                            shapeValue=9;
                            break;
                        case "chu nhat":
                            shapeValue = 7;
                            break;
                        case "tron":
                            shapeValue = 2;
                            break;
                        case "vuong":
                            shapeValue = 1;
                            break;
                        case "meo":
                            shapeValue=4;
                            break;
                        case "bau duc":
                            shapeValue=3;
                            break;
                        case "da giac":
                            shapeValue =8;
                            break;
                        case "phi cong":
                            shapeValue =5;
                            break;
                        case "buom":
                            shapeValue=6;
                            break;
                        default:
                            shapeValue =-1;
                            break;

                    }
                    List<ProductOfShape> listOfShape = proService.getProductOfShape(shapeValue);
                    products = listOfShape.stream()
                            .map(mat -> new ProductVM(mat.getId(), mat.getName(), mat.getPrice(), mat.getPath()))
                            .toList();
                }

                if(filterBrand!=null && !filterBrand.isEmpty()){

                    int brandValue = -1;

                    switch(filterBrand.toLowerCase()){
                        case "dior":
                            brandValue = 1;
                            break;
                        case "cartier":
                            brandValue = 2;
                            break;
                        case "versace":
                            brandValue = 3;
                            break;
                        case "gucci":
                            brandValue = 4;
                            break;
                        case "montblanc":
                            brandValue = 5;
                            break;
                        case "rayban":
                            brandValue = 6;
                            break;
                        case "burberry":
                            brandValue = 7;
                            break;
                        case "police":
                            brandValue = 9;
                            break;
                        case "chopard":
                            brandValue = 10;
                            break;
                        case "daniel wellington":
                            brandValue = 11;
                            break;
                        case "parim":
                            brandValue = 12;
                            break;
                        case "okley":
                            brandValue = 13;
                            break;
                        case "molsion":
                            brandValue = 14;
                            break;
                        case "exfash":
                            brandValue = 15;
                            break;
                        case "furla":
                            brandValue = 16;
                            break;
                        case "eyescloud":
                            brandValue = 18;
                            break;
                        case "acuvue":
                            brandValue = 19;
                            break;
                        case "tog":
                            brandValue =20;
                            break;
                        case "essilor":
                            brandValue = 21;
                            break;
                        case "rodenstock":
                            brandValue = 22;
                            break;
                        case "zeiss":
                            brandValue = 23;
                            break;
                        case "levanlens":
                            brandValue = 24;
                            break;

                        default:
                            brandValue =-1;
                            break;
                    }

                    List<ProductOfBrand> listOfBrand = proService.getProductOfBrand(brandValue);
                    products = listOfBrand.stream()
                            .map(mat -> new ProductVM(mat.getId(), mat.getName(), mat.getPrice(), mat.getPath()))
                            .toList();
                }

                if(filterCate!=null &&!filterCate.isEmpty()){
                    int categoryValue = -1;
                    switch(filterCate.toLowerCase()){
                        case "kinh can nam":
                            categoryValue =1;
                            break;

                        case "kinh can nu":
                            categoryValue =2;
                            break;
                        case "kinh tre em":
                            categoryValue =3;
                            break;
                        case "kinh ram":
                            categoryValue =4;
                            break;
                        case "kinh can":
                            categoryValue =5;
                            break;
                        case "khong do":
                            categoryValue =6;
                            break;
                        case "ap trong":
                            categoryValue =7;
                            break;
                        case "cao cap":
                            categoryValue =8;
                            break;
                        case "phu kien":
                            categoryValue =9;
                            break;
                        case "kinh unisex":
                            categoryValue =10;
                            break;
                        case "don trong":
                            categoryValue =11;
                            break;
                        case "da trong":
                            categoryValue =12;
                            break;
                        case "hai trong":
                            categoryValue =13;
                            break;

                        default :
                            categoryValue =-1;
                            break;
                    }

                    List<ProductOfCategory>listOfCategory = proService.getProductOfCategory(categoryValue);
                    products = listOfCategory.stream()
                            .map(mat -> new ProductVM(mat.getId(), mat.getName(), mat.getPrice(), mat.getPath()))
                            .toList();
                }
            }


            // Xử lý phân trang
            int page = 1;
            try {
                page = Integer.parseInt(request.getParameter("page"));
                if (page < 1) page = 1;
            } catch (NumberFormatException e) {
                page = 1;
            }

            int totalProducts = products.size();
            int totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);
            if (page > totalPages && totalPages > 0) page = totalPages; // Nếu trang vượt quá, đặt về trang cuối

            int start = (page - 1) * PRODUCTS_PER_PAGE;
            int end = Math.min(start + PRODUCTS_PER_PAGE, totalProducts);

            List<ProductVM> productsForPage = products.subList(start, end);

            // Truyền dữ liệu đến JSP
            request.setAttribute("products", productsForPage);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);

            request.getRequestDispatcher("gong_kinh.jsp").forward(request, response);
        }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
