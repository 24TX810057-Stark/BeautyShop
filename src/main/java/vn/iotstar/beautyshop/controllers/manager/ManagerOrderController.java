package vn.iotstar.beautyshop.controllers.manager;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.beautyshop.model.Order;
import vn.iotstar.beautyshop.service.OrderService;
import vn.iotstar.beautyshop.service.impl.OrderServiceImpl;

@WebServlet(urlPatterns = {
        "/manager/orders",
        "/manager/order-detail",
        "/manager/order/update-status"
})
public class ManagerOrderController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private OrderService orderService;

    @Override
    public void init() {
        orderService = new OrderServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String uri = req.getRequestURI();

        if (uri.endsWith("/orders")) {
            listOrders(req, resp);
        } else if (uri.endsWith("/order-detail")) {
            showOrderDetail(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String uri = req.getRequestURI();

        if (uri.endsWith("/order/update-status")) {
            updateStatus(req, resp);
        }
    }

    private static final int PAGE_SIZE = 10;

    // =========================

    private void listOrders(HttpServletRequest req, HttpServletResponse resp)
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

        int totalItems = orderService.countAll();
        int totalPages = (int) Math.ceil((double) totalItems / PAGE_SIZE);
        if (page > totalPages && totalPages > 0)
            page = totalPages;

        int offset = (page - 1) * PAGE_SIZE;
        List<Order> orders = orderService.findAllPaginated(offset, PAGE_SIZE);

        req.setAttribute("orders", orders);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("totalItems", totalItems);
        req.setAttribute("baseUrl", req.getContextPath() + "/manager/orders");

        req.getRequestDispatcher("/views/manager/order/list.jsp").forward(req, resp);
    }

    private void showOrderDetail(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(req.getParameter("id"));
        Order order = orderService.findById(orderId);

        req.setAttribute("order", order);
        req.getRequestDispatcher("/views/manager/order/detail.jsp").forward(req, resp);
    }

    private void updateStatus(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        int orderId = Integer.parseInt(req.getParameter("orderId"));
        String status = req.getParameter("status");

        orderService.updateStatus(orderId, status);

        resp.sendRedirect(req.getContextPath() + "/manager/order-detail?id=" + orderId);
    }
}
