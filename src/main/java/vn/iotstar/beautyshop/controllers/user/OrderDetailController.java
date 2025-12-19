package vn.iotstar.beautyshop.controllers.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.iotstar.beautyshop.model.Order;
import vn.iotstar.beautyshop.model.User;
import vn.iotstar.beautyshop.service.OrderService;
import vn.iotstar.beautyshop.service.impl.OrderServiceImpl;

@WebServlet("/order-detail")
public class OrderDetailController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private OrderService orderService = new OrderServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);
		User user = (session != null) ? (User) session.getAttribute("user") : null;

		if (user == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		String idParam = req.getParameter("id");
		if (idParam == null) {
			resp.sendRedirect(req.getContextPath() + "/order-tracking");
			return;
		}

		int orderId;
		try {
			orderId = Integer.parseInt(idParam);
		} catch (NumberFormatException e) {
			resp.sendRedirect(req.getContextPath() + "/order-tracking");
			return;
		}

		Order order = orderService.getOrderDetail(orderId, user.getId());

		if (order == null) {
			resp.sendRedirect(req.getContextPath() + "/order-tracking");
			return;
		}

		req.setAttribute("order", order);
		req.getRequestDispatcher("/views/web/order-detail.jsp").forward(req, resp);
	}
}
