package vn.iotstar.beautyshop.configs;

import java.io.File;

public class UploadConfig {

    // Tựa
    private static final String BASE_PATH = System.getProperty("user.home") + File.separator + "uploads"
            + File.separator + "beautyshop";

    static {
        // Tạo thư mục nếu chưa tồn tại
        new File(getProductUploadPath()).mkdirs();
        new File(getCategoryUploadPath()).mkdirs();
        new File(getBannerUploadPath()).mkdirs();
    }

    public static String getProductUploadPath() {
        return BASE_PATH + File.separator + "products";
    }

    public static String getCategoryUploadPath() {
        return BASE_PATH + File.separator + "categories";
    }

    public static String getBannerUploadPath() {
        return BASE_PATH + File.separator + "banners";
    }

    public static String getBasePath() {
        return BASE_PATH;
    }
}
