package vn.edu.hcmuaf.fit.doanweb.Util;

import jakarta.servlet.http.HttpServletRequest;

public class GenerateAddress {
    public static String getAddress(HttpServletRequest request) {
        String province = request.getParameter("Province");
        String district = request.getParameter("District");
        String ward = request.getParameter("Ward");
        return province + "," + district + "," + ward;
    }
}
