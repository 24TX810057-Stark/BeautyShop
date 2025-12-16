package vn.iotstar.beautyshop.controllers.user;

import java.io.IOException;
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
		User user = (User) session.getAttribute("account");

		// CHƯA LOGIN → ĐÁ VỀ LOGIN
		if (user == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		// LẤY ĐƠN THEO USER
		List<Order> orders = orderService.findByUserId(user.getId());

		req.setAttribute("orders", orders);
		req.getRequestDispatcher("/views/web/order-tracking.jsp")
		   .forward(req, resp);
	}
}
