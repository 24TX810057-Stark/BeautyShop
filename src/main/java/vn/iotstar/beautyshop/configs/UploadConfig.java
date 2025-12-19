package vn.iotstar.beautyshop.configs;

import java.io.File;

public class UploadConfig {

    // Thư mục upload gốc: mỗi máy 1 chỗ, nhưng logic giống nhau
    private static final String BASE_PATH =
            System.getProperty("user.home") + File.separator + "uploads"
            + File.separator + "beautyshop";

    static {
        // Tạo thư mục nếu chưa tồn tại
        new File(getProductUploadPath()).mkdirs();
        new File(getCategoryUploadPath()).mkdirs();
    }

    public static String getProductUploadPath() {
        return BASE_PATH + File.separator + "products";
    }

    public static String getCategoryUploadPath() {
        return BASE_PATH + File.separator + "categories";
    }

    public static String getBasePath() {
        return BASE_PATH;
    }
}
   