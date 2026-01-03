package vn.iotstar.beautyshop.controllers.manager;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.iotstar.beautyshop.dao.BannerDAO;
import vn.iotstar.beautyshop.dao.impl.BannerDAOImpl;
import vn.iotstar.beautyshop.model.Banner;

@WebServlet(urlPatterns = { "/manager/banners", "/manager/banners/*" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
public class ManagerBannerController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BannerDAO bannerDAO = new BannerDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "add":
                showAddForm(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            case "delete":
                deleteBanner(req, resp);
                break;
            default:
                listBanners(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            addBanner(req, resp);
        } else if ("edit".equals(action)) {
            updateBanner(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/manager/banners");
        }
    }

    private static final int PAGE_SIZE = 10;

    // Hiển thị danh sách banner
    private void listBanners(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Pagination
        int page = 1;
        try {
            String pageStr = req.getParameter("page");
            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
                if (page < 1)
                    page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        int totalItems = bannerDAO.count();
        int totalPages = (int) Math.ceil((double) totalItems / PAGE_SIZE);
        if (page > totalPages && totalPages > 0)
            page = totalPages;

        int offset = (page - 1) * PAGE_SIZE;
        List<Banner> banners = bannerDAO.findAll(offset, PAGE_SIZE);

        req.setAttribute("banners", banners);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("totalItems", totalItems);
        req.setAttribute("baseUrl", req.getContextPath() + "/manager/banners");

        // Kiểm tra thông báo từ session
        String message = (String) req.getSession().getAttribute("message");
        String messageType = (String) req.getSession().getAttribute("messageType");
        if (message != null) {
            req.setAttribute("message", message);
            req.setAttribute("messageType", messageType);
            req.getSession().removeAttribute("message");
            req.getSession().removeAttribute("messageType");
        }

        req.getRequestDispatcher("/views/manager/banner/list.jsp").forward(req, resp);
    }

    // Hiển thị form thêm banner
    private void showAddForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/manager/banner/form.jsp").forward(req, resp);
    }

    // Hiển thị form sửa banner
    private void showEditForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            Banner banner = bannerDAO.findById(id);
            if (banner != null) {
                req.setAttribute("banner", banner);
                req.getRequestDispatcher("/views/manager/banner/form.jsp").forward(req, resp);
            } else {
                resp.sendRedirect(req.getContextPath() + "/manager/banners");
            }
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/manager/banners");
        }
    }

    // Thêm banner mới
    private void addBanner(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String link = req.getParameter("link");
        String displayOrderStr = req.getParameter("displayOrder");
        String isActiveStr = req.getParameter("isActive");
        String imageName = uploadImage(req);

        int displayOrder = 0;
        try {
            displayOrder = Integer.parseInt(displayOrderStr);
        } catch (NumberFormatException e) {
            // Giữ mặc định 0
        }

        boolean isActive = "on".equals(isActiveStr) || "true".equals(isActiveStr);

        if (imageName != null && !imageName.trim().isEmpty()) {
            Banner banner = new Banner();
            banner.setTitle(title != null ? title.trim() : "");
            banner.setDescription(description != null ? description.trim() : "");
            banner.setImage(imageName);
            banner.setLink(link != null ? link.trim() : "");
            banner.setDisplayOrder(displayOrder);
            banner.setActive(isActive);
            bannerDAO.insert(banner);

            req.getSession().setAttribute("message", "Thêm banner thành công!");
            req.getSession().setAttribute("messageType", "success");
        } else {
            req.getSession().setAttribute("message", "Vui lòng chọn hình ảnh cho banner!");
            req.getSession().setAttribute("messageType", "danger");
        }
        resp.sendRedirect(req.getContextPath() + "/manager/banners");
    }

    // Cập nhật banner
    private void updateBanner(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String title = req.getParameter("title");
            String description = req.getParameter("description");
            String link = req.getParameter("link");
            String displayOrderStr = req.getParameter("displayOrder");
            String isActiveStr = req.getParameter("isActive");
            String imageName = uploadImage(req);

            int displayOrder = 0;
            try {
                displayOrder = Integer.parseInt(displayOrderStr);
            } catch (NumberFormatException e) {
                // Giữ mặc định 0
            }

            boolean isActive = "on".equals(isActiveStr) || "true".equals(isActiveStr);

            // Nếu không upload ảnh mới, giữ ảnh cũ
            if (imageName == null) {
                Banner oldBanner = bannerDAO.findById(id);
                if (oldBanner != null) {
                    imageName = oldBanner.getImage();
                }
            }

            Banner banner = new Banner();
            banner.setId(id);
            banner.setTitle(title != null ? title.trim() : "");
            banner.setDescription(description != null ? description.trim() : "");
            banner.setImage(imageName != null ? imageName : "");
            banner.setLink(link != null ? link.trim() : "");
            banner.setDisplayOrder(displayOrder);
            banner.setActive(isActive);
            bannerDAO.update(banner);

            req.getSession().setAttribute("message", "Cập nhật banner thành công!");
            req.getSession().setAttribute("messageType", "success");
        } catch (NumberFormatException e) {
            req.getSession().setAttribute("message", "ID không hợp lệ!");
            req.getSession().setAttribute("messageType", "danger");
        }
        resp.sendRedirect(req.getContextPath() + "/manager/banners");
    }

    // Xóa banner
    private void deleteBanner(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            bannerDAO.delete(id);
            req.getSession().setAttribute("message", "Xóa banner thành công!");
            req.getSession().setAttribute("messageType", "success");
        } catch (NumberFormatException e) {
            req.getSession().setAttribute("message", "ID không hợp lệ!");
            req.getSession().setAttribute("messageType", "danger");
        }
        resp.sendRedirect(req.getContextPath() + "/manager/banners");
    }

    // Upload hình ảnh
    private String uploadImage(HttpServletRequest req) throws IOException, ServletException {
        Part filePart = req.getPart("imageFile");

        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        if (fileName == null || fileName.isEmpty()) {
            return null;
        }

        // Tạo tên file unique để tránh trùng lặp
        String extension = "";
        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex > 0) {
            extension = fileName.substring(dotIndex);
        }
        String uniqueFileName = "banner_" + UUID.randomUUID().toString().substring(0, 8) + extension;

        // 1. Lưu vào SOURCE folder (để không mất khi redeploy)
        String sourcePath = vn.iotstar.beautyshop.configs.UploadConfig.getBannerUploadPath();
        File sourceDir = new File(sourcePath);
        if (!sourceDir.exists()) {
            sourceDir.mkdirs();
        }
        String sourceFile = sourcePath + File.separator + uniqueFileName;
        filePart.write(sourceFile);

        // 2. Copy vào DEPLOY folder (để hiển thị ngay không cần restart)
        String deployPath = req.getServletContext().getRealPath("/assets/images/banners");
        File deployDir = new File(deployPath);
        if (!deployDir.exists()) {
            deployDir.mkdirs();
        }
        String deployFile = deployPath + File.separator + uniqueFileName;
        java.nio.file.Files.copy(new File(sourceFile).toPath(), new File(deployFile).toPath(),
                java.nio.file.StandardCopyOption.REPLACE_EXISTING);

        return "banners/" + uniqueFileName;
    }
}
