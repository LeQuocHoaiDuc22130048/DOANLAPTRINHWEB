package vn.edu.hcmuaf.fit.doanweb.Util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;

import java.sql.Date;

public class JwtUtil {
    private static final String SECRET = "WEB-EYESTYLE";

    public static String generateToken(String username) {
        Algorithm algorithm = Algorithm.HMAC256(SECRET);
        // 1 giờ
        return JWT.create()
                .withSubject(username)
                .withIssuer("your-app")
                .withClaim("role", "user")
                .withExpiresAt(new Date(System.currentTimeMillis() + 3600 * 1000)) // 1 giờ
                .sign(algorithm);
    }
}
