package vn.edu.hcmuaf.fit.doanweb.Util;


import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;

import java.io.*;

public class PdfGenerator {
    public static void generatePdfFromHtml(String htmlContent, OutputStream outputStream) throws IOException {
        try {
            PdfRendererBuilder builder = new PdfRendererBuilder();
            builder.useFastMode();
            builder.withHtmlContent(htmlContent, null); // null = không có base URI
            builder.toStream(outputStream);
            builder.run();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi tạo PDF từ HTML", e);
        }
    }
}
