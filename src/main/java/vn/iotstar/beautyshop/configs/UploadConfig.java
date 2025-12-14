package vn.iotstar.beautyshop.configs;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class UploadConfig {
    private static final Properties props = new Properties();
    private static String basePath;

    static {
        try (InputStream is = UploadConfig.class.getClassLoader().getResourceAsStream("upload.properties")) {
            if (is != null) {
                props.load(is);
                basePath = props.getProperty("upload.basePath");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Fallback nếu không có config
        if (basePath == null || basePath.isEmpty()) {
            basePath = System.getProperty("user.dir") + "/src/main/webapp/assets/images";
        }
    }

    public static String getCategoryUploadPath() {
        return basePath + "/categories";
    }

    public static String getProductUploadPath() {
        return basePath + "/products";
    }

    public static String getBasePath() {
        return basePath;
    }
}
