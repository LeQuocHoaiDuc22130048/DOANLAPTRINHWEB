package vn.edu.hcmuaf.fit.doanweb.config;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class AppConfig {
    private static final Properties properties = new Properties();

    static {
        try (InputStream input = AppConfig.class.getClassLoader().getResourceAsStream("app.properties")) {
            if (input == null) {
                System.out.println("Sorry, unable to find app.properties");
            } else {
                properties.load(input);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public static String getUploadDirectory() {
        return properties.getProperty("upload.directory", System.getProperty("java.io.tmpdir") + File.separator + "doanweb_uploads");
    }

    // Add other configuration properties here as needed
}