package vn.iotstar.beautyshop.controllers.user;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.iotstar.beautyshop.model.CartItem;

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

		// TODO (sau):
		// - Lấy thông tin giao hàng từ form (name, phone, address, province, ...)
		// - Tính tiền
		// - Lưu DB: orders, order_items

		// Xong đơn → clear cart
		session.removeAttribute("cart");

		// Sang trang thành công
		resp.sendRedirect(req.getContextPath() + "/order-success");
	}
}
