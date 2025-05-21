package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;

import com.openhtmltopdf.outputdevice.helper.BaseRendererBuilder;
import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.OrderItemVM;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Orders;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "InvoiceOrder", value = "/admin/InvoiceOrder")
public class InvoiceOrderServlet extends HttpServlet {

    private static final String INVOICE_PATH = "D:\\Workspace\\WebPrograming\\WebsiteBanHang\\DoAnWeb\\src\\main\\webapp\\admin\\OrderInvoice.html";
    AdminService adminService = new AdminService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String orderIdParam = request.getParameter("orderId");

        if (orderIdParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing order ID");
            return;
        }

        int orderId;

        try {
            orderId = Integer.parseInt(orderIdParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid order ID");
            return;
        }

        Orders orders = adminService.getOrderById(orderId);
        if (orders == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order not found");
            return;
        }

        List<OrderItemVM> itemVMS = adminService.getOrderItems(orderId);

        String htmlTemplate = Files.readString(Paths.get(INVOICE_PATH), StandardCharsets.UTF_8);
        String renderedHtml = renderInvoiceOrder(htmlTemplate, orders, itemVMS);

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=invoice_" + orderId + ".pdf");

        System.setProperty("org.apache.pdfbox.rendering.UseFontCache", "false");

        try (OutputStream os = response.getOutputStream()) {
            PdfRendererBuilder builder = new PdfRendererBuilder();
            builder.useFastMode();

            InputStream fontStream = getClass().getClassLoader().getResourceAsStream("/font/Roboto/static/Roboto-Regular.ttf");
            builder.useFont(() -> fontStream,"Roboto");

            builder.defaultTextDirection(BaseRendererBuilder.TextDirection.LTR);
            builder.withHtmlContent(renderedHtml, null);
            builder.toStream(os);
            builder.run();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Lỗi khi tạo PDF từ HTML", e);
        }
    }


    public String renderInvoiceOrder(String invoice, Orders orders, List<OrderItemVM> orderItems) {
        StringBuilder orderRow = new StringBuilder();
        int index = 1;
        long sumQuantity = 0;
        long sumPrice = 0;
        long totalPrice = 0;
        for (OrderItemVM detail : orderItems) {
            orderRow.append("<tr>")
                    .append("<td>").append(index++).append("</td>")
                    .append("<td>").append(detail.getProductCode()).append("</td>")
                    .append("<td>").append(detail.getQuantityInOrder()).append("</td>")
                    .append("<td>").append(detail.getSellingPrice()).append("</td>")
                    .append("<td>").append(detail.getTotalPrice()).append("</td>")
                    .append("</tr>");
            sumQuantity += detail.getQuantityInOrder();
            sumPrice += detail.getSellingPrice();
            totalPrice += detail.getTotalPrice();
        }

        LocalDate date = LocalDate.now();

        int day = date.getDayOfMonth();
        int month = date.getMonthValue();
        int year = date.getYear();
        return invoice
                .replace("{{customerName}}", orders.getCustomer_name())
                .replace("{{customerAddress}}", orders.getShipping_address())
                .replace("{{orderDay}}", String.valueOf(day))
                .replace("{{orderMonth}}", String.valueOf(month))
                .replace("{{orderYear}}", String.valueOf(year))
                .replace("{{sumQuantity}}", String.valueOf(sumQuantity))
                .replace("{{sumPrice}}", String.valueOf(sumPrice))
                .replace("{{totalPrice}}", String.valueOf(totalPrice))
                .replace("{{orderItems}}", orderRow.toString());

    }
}