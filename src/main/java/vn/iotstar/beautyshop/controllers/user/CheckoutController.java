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
import vn.iotstar.beautyshop.model.User;

@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);
		if (session == null) {
			resp.sendRedirect(req.getContextPath() + "/cart");
			return;
		}

		// CHECK LOGIN TẠI CHECKOUT
		User user = (User) session.getAttribute("user");
		if (user == null) {
			session.setAttribute("redirectAfterLogin", req.getContextPath() + "/checkout");
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		@SuppressWarnings("unchecked")
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		if (cart == null || cart.isEmpty()) {
			resp.sendRedirect(req.getContextPath() + "/cart");
			return;
		}

		// Tính tiền
		double subTotal = 0;
		for (CartItem item : cart) {
			subTotal += item.getProduct().getPrice() * item.getQuantity();
		}

		double shippingFee = 0; // tạm thời
		double total = subTotal + shippingFee;

		req.setAttribute("cart", cart);
		req.setAttribute("subTotal", subTotal);
		req.setAttribute("shippingFee", shippingFee);
		req.setAttribute("total", total);

		req.getRequestDispatcher("/views/web/checkout.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String receiverName = req.getParameter("receiverName");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		String ward = req.getParameter("ward");

		if (receiverName == null || receiverName.trim().isEmpty() || phone == null || phone.trim().isEmpty()
				|| address == null || address.trim().isEmpty() || ward == null || ward.trim().isEmpty()) {

			req.setAttribute("error", "Vui lòng nhập đầy đủ thông tin giao hàng");
			doGet(req, resp);
			return;
		}

		HttpSession session = req.getSession();
		session.setAttribute("checkout_receiverName", receiverName.trim());
		session.setAttribute("checkout_phone", phone.trim());
		session.setAttribute("checkout_address", address.trim());
		session.setAttribute("checkout_ward", ward.trim());
		session.setAttribute("checkout_payment", req.getParameter("payment"));
		session.setAttribute("checkout_note", req.getParameter("note"));

		req.getRequestDispatcher("/order").forward(req, resp);
	}

}
