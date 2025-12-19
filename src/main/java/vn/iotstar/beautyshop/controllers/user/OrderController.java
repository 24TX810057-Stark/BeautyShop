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
import vn.iotstar.beautyshop.service.OrderService;
import vn.iotstar.beautyshop.service.impl.OrderServiceImpl;

@WebServlet("/order")
public class OrderController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private OrderService orderService = new OrderServiceImpl();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);
		if (session == null) {
			resp.sendRedirect(req.getContextPath() + "/cart");
			return;
		}

		// CHECK LOGIN
		User user = (User) session.getAttribute("user");
		if (user == null) {
			session.setAttribute("redirectAfterLogin", req.getContextPath() + "/checkout");
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		// LẤY ĐỊA CHỈ TỪ CHECKOUT
		String receiverName = (String) session.getAttribute("checkout_receiverName");
		String phone = (String) session.getAttribute("checkout_phone");
		String address = (String) session.getAttribute("checkout_address");
		String ward = (String) session.getAttribute("checkout_ward");
		if (address == null || ward == null || receiverName == null || phone == null) {
			resp.sendRedirect(req.getContextPath() + "/checkout");
			return;
		}

		// LẤY CART
		@SuppressWarnings("unchecked")
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		if (cart == null || cart.isEmpty()) {
			resp.sendRedirect(req.getContextPath() + "/cart");
			return;
		}

		// TÍNH TOTAL
		double total = 0;
		for (CartItem item : cart) {
			total += item.getProduct().getPrice() * item.getQuantity();
		}

		// TẠO ORDER
		Order order = new Order();
		order.setUserId(user.getId());
		order.setReceiverName(receiverName);
		order.setPhone(phone);
		order.setAddress(address);
		order.setWard(ward);
		order.setTotalAmount(total);
		order.setStatus("PENDING");

		int orderId = orderService.createOrder(order);
		orderService.createOrderItems(orderId, cart);

		// CLEAR SESSION TẠM
		session.removeAttribute("cart");
		session.removeAttribute("checkout_receiverName");
		session.removeAttribute("checkout_phone");
		session.removeAttribute("checkout_address");
		session.removeAttribute("checkout_ward");

		resp.sendRedirect(req.getContextPath() + "/order-success");
	}
}
