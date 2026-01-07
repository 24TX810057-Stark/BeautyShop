package vn.iotstar.beautyshop.controllers.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.beautyshop.model.Order;
import vn.iotstar.beautyshop.model.User;
import vn.iotstar.beautyshop.service.OrderService;
import vn.iotstar.beautyshop.service.impl.OrderServiceImpl;

@WebServlet("/order-tracking")
public class OrderTrackingController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private OrderService orderService = new OrderServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");

        // ===== PHÂN TRANG =====
        int page = 1;
        int size = 5;

        String p = req.getParameter("page");
        if (p != null && !p.isBlank()) {
            page = Integer.parseInt(p);
        }

        int offset = (page - 1) * size;

        List<Order> orders =
                orderService.findByUserIdPaginated(user.getId(), offset, size);

        int totalItems =
                orderService.countByUserId(user.getId());

        int totalPages = (int) Math.ceil((double) totalItems / size);

        // ===== SET ATTRIBUTE =====
        req.setAttribute("orders", orders);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);

        req.getRequestDispatcher("/views/web/order-tracking.jsp")
           .forward(req, resp);
    }
}

