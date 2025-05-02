package vn.edu.hcmuaf.fit.doanweb.Util;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class ExchangeRate {
    private static final String API_KEY= "08b7273b010d4b690a799708";
    private static final String API_URL = "https://v6.exchangerate-api.com/v6/" + API_KEY + "/latest/USD";

    public static double getUSDRate() {

        try {
            // Gửi request tới API
            URL url= new URL(API_URL);
            HttpURLConnection conn= (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //Đọc phản hồi từ API trả về
            InputStream is= conn.getInputStream();
            byte[] data= is.readAllBytes();
            String responseText= new String(data, StandardCharsets.UTF_8);

            //Chuyênr JSON về Object
            JsonObject jsonObject= JsonParser.parseString(responseText).getAsJsonObject();
            JsonObject conversion_rates= jsonObject.getAsJsonObject("conversion_rates");

            return conversion_rates.get("VND").getAsDouble();

        } catch (Exception e) {
            e.printStackTrace();
            return 24000.0;  //Giá trị mặc định nếu API lỗi
        }

    }

}
