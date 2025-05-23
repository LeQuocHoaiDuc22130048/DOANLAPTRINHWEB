package vn.edu.hcmuaf.fit.doanweb.Util;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletResponseWrapper;

import java.io.PrintWriter;

public class HttpServletResponseWrapperCapture extends HttpServletResponseWrapper {

    private final PrintWriter writer;

    public HttpServletResponseWrapperCapture(HttpServletResponse response, PrintWriter writer) {
        super(response);
        this.writer = writer;
    }

    @Override
    public PrintWriter getWriter() {
        return writer;
    }
}
