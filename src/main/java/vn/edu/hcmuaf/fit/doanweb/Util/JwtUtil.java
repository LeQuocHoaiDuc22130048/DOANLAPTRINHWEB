package vn.edu.hcmuaf.fit.doanweb.Util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;

import java.util.Date;

public class JwtUtil {
    public static final String SECRET_KEY = "WEB_EYESTYLE";


    public static String generateToken(int userId, String role, String username) {
        Algorithm algorithm = Algorithm.HMAC256(SECRET_KEY);
        return JWT.create()
                .withSubject(String.valueOf(userId)) // gán userId
                .withClaim("role", role) // gán vai trò
                .withClaim("username", username)
                .withIssuedAt(new Date())
                .withExpiresAt(new Date(System.currentTimeMillis() + 3600_000)) // Hết hạn sau 1 giờ
                .sign(algorithm);
    }

}
