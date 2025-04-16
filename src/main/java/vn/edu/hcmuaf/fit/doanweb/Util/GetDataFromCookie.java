package vn.edu.hcmuaf.fit.doanweb.Util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

public class GetDataFromCookie {
    public static  int getUserId(HttpServletRequest request) {
        int userId = -1;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("Authorization".equals(cookie.getName())) {
                    String tokenValue = cookie.getValue();
                    // → Verify token (tùy mục đích)
                    DecodedJWT decoded = JWT.require(Algorithm.HMAC256(JwtUtil.SECRET_KEY)).build().verify(tokenValue);
                    return  Integer.parseInt(decoded.getSubject());
                }
            }
        }
        return userId;
    }
}
