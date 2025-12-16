package vn.iotstar.beautyshop.controllers.user;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.beautyshop.model.CartItem;
import vn.iotstar.beautyshop.model.Order;
import vn.iotstar.beautyshop.model.User;

@WebServlet("/order")
public class OrderController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);
		if (session == null) {
			resp.sendRedirect(req.getContextPath() + "/cart");
			return;
		}

		@SuppressWarnings("unchecked")
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		if (cart == null || cart.isEmpty()) {
			resp.sendRedirect(req.getContextPath() + "/cart");
			return;
		}
		User user = (User) session.getAttribute("user");
		if (user == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		double total = 0;
		for (CartItem item : cart) {
			total += item.getProduct().getPrice() * item.getQuantity();

		}

		Order order = new Order();
		order.setUserId(user.getId());
		order.setTotal(total);
		order.setStatus("PENDING");

		int orderId = orderService.createOrder(order);

		orderService.createOrderItems(orderId, cart);

		// clear cart
		session.removeAttribute("cart");

		resp.sendRedirect(req.getContextPath() + "/order-success");

	}
}
