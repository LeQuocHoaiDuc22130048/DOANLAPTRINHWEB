package vn.edu.hcmuaf.fit.doanweb.Controller.Product;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.Controller.DTO.ProductByCondition;
import vn.edu.hcmuaf.fit.doanweb.Services.ProductService;
import vn.edu.hcmuaf.fit.doanweb.Enum.JSPPage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "FilterController", value = "/filter")
public class FilterController extends HttpServlet {

    private static final int PRODUCTS_PER_PAGE = 9;
    private final ProductService proService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();

        String pageParam = request.getParameter("page");
        int currentPage = 1;
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                // Xử lý trường hợp tham số trang không hợp lệ
            }
        }

        String type = request.getParameter("type");
        String value = request.getParameter("value");

        // Lấy toàn bộ danh sách sản phẩm dựa trên điều kiện
        List<ProductByCondition> allProducts = proService.getProduct(type, value);
        int totalItems = allProducts.size();
        int totalPages = (int) Math.ceil((double) totalItems / PRODUCTS_PER_PAGE);

        // Tính toán chỉ mục bắt đầu và kết thúc cho trang hiện tại
        int startIndex = (currentPage - 1) * PRODUCTS_PER_PAGE;
        int endIndex = Math.min(startIndex + PRODUCTS_PER_PAGE, totalItems);

        // Lấy danh sách sản phẩm cho trang hiện tại
        List<ProductByCondition> currentPageProducts = allProducts.subList(startIndex, endIndex);

        // Tạo một Map để chứa dữ liệu và thông tin phân trang
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("products", currentPageProducts);
        responseData.put("currentPage", currentPage);
        responseData.put("totalPages", totalPages);
        responseData.put("totalItems", totalItems);
        responseData.put("itemsPerPage", PRODUCTS_PER_PAGE);

        // Chuyển đổi Map thành chuỗi JSON và gửi về client
        String jsonResponse = gson.toJson(responseData);
        out.write(jsonResponse);
        out.flush();
    }

}
