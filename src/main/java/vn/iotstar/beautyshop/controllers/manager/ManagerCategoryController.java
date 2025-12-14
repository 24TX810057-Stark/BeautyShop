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
import vn.iotstar.beautyshop.dao.CategoryDAO;
import vn.iotstar.beautyshop.dao.impl.CategoryDAOImpl;
import vn.iotstar.beautyshop.model.Category;

@WebServlet(urlPatterns = { "/manager/categories", "/manager/categories/*" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
public class ManagerCategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryDAO categoryDAO = new CategoryDAOImpl();

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
                deleteCategory(req, resp);
                break;
            default:
                listCategories(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            addCategory(req, resp);
        } else if ("edit".equals(action)) {
            updateCategory(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/manager/categories");
        }
    }

    // Hiển thị danh sách danh mục
    private void listCategories(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<Category> categories = categoryDAO.findAll();
        req.setAttribute("categories", categories);

        // Kiểm tra thông báo từ session
        String message = (String) req.getSession().getAttribute("message");
        String messageType = (String) req.getSession().getAttribute("messageType");
        if (message != null) {
            req.setAttribute("message", message);
            req.setAttribute("messageType", messageType);
            req.getSession().removeAttribute("message");
            req.getSession().removeAttribute("messageType");
        }

        req.getRequestDispatcher("/views/manager/category/list.jsp").forward(req, resp);
    }

    // Hiển thị form thêm danh mục
    private void showAddForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/manager/category/form.jsp").forward(req, resp);
    }

    // Hiển thị form sửa danh mục
    private void showEditForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            Category category = categoryDAO.findById(id);
            if (category != null) {
                req.setAttribute("category", category);
                req.getRequestDispatcher("/views/manager/category/form.jsp").forward(req, resp);
            } else {
                resp.sendRedirect(req.getContextPath() + "/manager/categories");
            }
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/manager/categories");
        }
    }

    // Thêm danh mục mới
    private void addCategory(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String name = req.getParameter("name");
        String imageName = uploadImage(req);

        if (name != null && !name.trim().isEmpty()) {
            Category category = new Category();
            category.setName(name.trim());
            category.setImage(imageName != null ? imageName : "");
            categoryDAO.insert(category);

            req.getSession().setAttribute("message", "Thêm danh mục thành công!");
            req.getSession().setAttribute("messageType", "success");
        } else {
            req.getSession().setAttribute("message", "Vui lòng nhập tên danh mục!");
            req.getSession().setAttribute("messageType", "danger");
        }
        resp.sendRedirect(req.getContextPath() + "/manager/categories");
    }

    // Cập nhật danh mục
    private void updateCategory(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String imageName = uploadImage(req);

            // Nếu không upload ảnh mới, giữ ảnh cũ
            if (imageName == null) {
                Category oldCategory = categoryDAO.findById(id);
                if (oldCategory != null) {
                    imageName = oldCategory.getImage();
                }
            }

            if (name != null && !name.trim().isEmpty()) {
                Category category = new Category();
                category.setId(id);
                category.setName(name.trim());
                category.setImage(imageName != null ? imageName : "");
                categoryDAO.update(category);

                req.getSession().setAttribute("message", "Cập nhật danh mục thành công!");
                req.getSession().setAttribute("messageType", "success");
            } else {
                req.getSession().setAttribute("message", "Vui lòng nhập tên danh mục!");
                req.getSession().setAttribute("messageType", "danger");
            }
        } catch (NumberFormatException e) {
            req.getSession().setAttribute("message", "ID không hợp lệ!");
            req.getSession().setAttribute("messageType", "danger");
        }
        resp.sendRedirect(req.getContextPath() + "/manager/categories");
    }

    // Xóa danh mục
    private void deleteCategory(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            categoryDAO.delete(id);
            req.getSession().setAttribute("message", "Xóa danh mục thành công!");
            req.getSession().setAttribute("messageType", "success");
        } catch (NumberFormatException e) {
            req.getSession().setAttribute("message", "ID không hợp lệ!");
            req.getSession().setAttribute("messageType", "danger");
        }
        resp.sendRedirect(req.getContextPath() + "/manager/categories");
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
        String uniqueFileName = "cat_" + UUID.randomUUID().toString().substring(0, 8) + extension;

        // 1. Lưu vào SOURCE folder (để không mất khi redeploy)
        String sourcePath = vn.iotstar.beautyshop.configs.UploadConfig.getCategoryUploadPath();
        File sourceDir = new File(sourcePath);
        if (!sourceDir.exists()) {
            sourceDir.mkdirs();
        }
        String sourceFile = sourcePath + File.separator + uniqueFileName;
        filePart.write(sourceFile);

        // 2. Copy vào DEPLOY folder (để hiển thị ngay không cần restart)
        String deployPath = req.getServletContext().getRealPath("/assets/images/categories");
        File deployDir = new File(deployPath);
        if (!deployDir.exists()) {
            deployDir.mkdirs();
        }
        String deployFile = deployPath + File.separator + uniqueFileName;
        java.nio.file.Files.copy(new File(sourceFile).toPath(), new File(deployFile).toPath(),
                java.nio.file.StandardCopyOption.REPLACE_EXISTING);

        return "categories/" + uniqueFileName;
    }
}
