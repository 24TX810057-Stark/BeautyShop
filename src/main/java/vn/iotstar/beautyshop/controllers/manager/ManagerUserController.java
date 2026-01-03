package vn.iotstar.beautyshop.controllers.manager;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.beautyshop.dao.UserDAO;
import vn.iotstar.beautyshop.dao.impl.UserDAOImpl;
import vn.iotstar.beautyshop.model.User;

@WebServlet(urlPatterns = { "/manager/users", "/manager/users/*" })
public class ManagerUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int PAGE_SIZE = 10;
    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "edit":
                showEditForm(req, resp);
                break;
            case "delete":
                deleteUser(req, resp);
                break;
            default:
                listUsers(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("edit".equals(action)) {
            updateUser(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/manager/users");
        }
    }

    // Hiển thị danh sách người dùng
    private void listUsers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

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

        int totalItems = userDAO.count();
        int totalPages = (int) Math.ceil((double) totalItems / PAGE_SIZE);
        if (page > totalPages && totalPages > 0)
            page = totalPages;

        int offset = (page - 1) * PAGE_SIZE;
        List<User> users = userDAO.findAllPaginated(offset, PAGE_SIZE);

        req.setAttribute("users", users);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("totalItems", totalItems);
        req.setAttribute("baseUrl", req.getContextPath() + "/manager/users");

        // Kiểm tra thông báo từ session
        String message = (String) req.getSession().getAttribute("message");
        String messageType = (String) req.getSession().getAttribute("messageType");
        if (message != null) {
            req.setAttribute("message", message);
            req.setAttribute("messageType", messageType);
            req.getSession().removeAttribute("message");
            req.getSession().removeAttribute("messageType");
        }

        req.getRequestDispatcher("/views/manager/user/list.jsp").forward(req, resp);
    }

    // Hiển thị form sửa người dùng
    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            User user = userDAO.findById(id);
            if (user != null) {
                req.setAttribute("user", user);
                req.getRequestDispatcher("/views/manager/user/form.jsp").forward(req, resp);
            } else {
                resp.sendRedirect(req.getContextPath() + "/manager/users");
            }
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/manager/users");
        }
    }

    // Cập nhật người dùng (chỉ role và status)
    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String role = req.getParameter("role");
            String statusStr = req.getParameter("status");

            User user = userDAO.findById(id);
            if (user != null) {
                user.setRole(role);
                user.setStatus(Integer.parseInt(statusStr));
                userDAO.update(user);

                req.getSession().setAttribute("message", "Cập nhật người dùng thành công!");
                req.getSession().setAttribute("messageType", "success");
            }
        } catch (NumberFormatException e) {
            req.getSession().setAttribute("message", "Dữ liệu không hợp lệ!");
            req.getSession().setAttribute("messageType", "danger");
        }
        resp.sendRedirect(req.getContextPath() + "/manager/users");
    }

    // Xóa người dùng
    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            userDAO.delete(id);
            req.getSession().setAttribute("message", "Xóa người dùng thành công!");
            req.getSession().setAttribute("messageType", "success");
        } catch (NumberFormatException e) {
            req.getSession().setAttribute("message", "ID không hợp lệ!");
            req.getSession().setAttribute("messageType", "danger");
        }
        resp.sendRedirect(req.getContextPath() + "/manager/users");
    }
}
