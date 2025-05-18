package vn.edu.hcmuaf.fit.doanweb.Util;
import java.security.SecureRandom;

public class GenerateOTP {

    public static String GenerateSecureOTP(int length) {
        if (length <= 0) {
            throw new IllegalArgumentException("Độ dài OTP phải lớn hơn 0.");
        }
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            sb.append(random.nextInt(10));
        }
        return sb.toString();
    }

}
