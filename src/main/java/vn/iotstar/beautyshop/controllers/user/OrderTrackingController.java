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

	    // ===== LẤY DANH SÁCH ĐƠN =====
	    List<Order> orders = orderService.findByUserId(user.getId());

	    // ===== PHÂN TRANG =====
	    int page = 1;
	    int size = 5; // 5 đơn / trang

	    String p = req.getParameter("page");
	    if (p != null && !p.isEmpty()) {
	        page = Integer.parseInt(p);
	    }

	    int totalItems = orders.size();
	    int totalPages = (int) Math.ceil((double) totalItems / size);

	    int fromIndex = (page - 1) * size;
	    int toIndex = Math.min(fromIndex + size, totalItems);

	    List<Order> orderPage =
	            totalItems == 0 ? new ArrayList<>() : orders.subList(fromIndex, toIndex);

	    // ===== SET ATTRIBUTE =====
	    req.setAttribute("orders", orderPage);
	    req.setAttribute("currentPage", page);
	    req.setAttribute("totalPages", totalPages);

	    req.getRequestDispatcher("/views/web/order-tracking.jsp").forward(req, resp);
	}


}
