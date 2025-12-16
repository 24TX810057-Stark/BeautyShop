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
import vn.iotstar.beautyshop.model.CartItem;
import vn.iotstar.beautyshop.model.Product;
import vn.iotstar.beautyshop.service.ProductService;
import vn.iotstar.beautyshop.service.impl.ProductServiceImpl;

@WebServlet("/cart")
public class CartController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		@SuppressWarnings("unchecked")
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		if (cart == null) {
			cart = new ArrayList<>();
			session.setAttribute("cart", cart);
		}

		int cartCount = 0;
		double subTotal = 0;

		for (CartItem item : cart) {
			cartCount += item.getQuantity();
			subTotal += item.getProduct().getPrice() * item.getQuantity();
		}

		double discount = 0;
		double total = subTotal - discount;

		// SET SESSION (CHO HEADER)
		session.setAttribute("cartCount", cartCount);

		// SET REQUEST (CHO CART PAGE)
		req.setAttribute("cart", cart);
		req.setAttribute("cartCount", cartCount);
		req.setAttribute("subTotal", subTotal);
		req.setAttribute("discount", discount);
		req.setAttribute("total", total);

		req.getRequestDispatcher("/views/web/cart.jsp").forward(req, resp);
	}

	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");
		int productId = Integer.parseInt(req.getParameter("productId"));

		// ===== LẤY QUANTITY (product-detail gửi lên) =====
		int quantity = 1;
		String qtyParam = req.getParameter("quantity");
		if (qtyParam != null && !qtyParam.isEmpty()) {
			try {
				quantity = Integer.parseInt(qtyParam);
			} catch (NumberFormatException e) {
				quantity = 1;
			}
		}

		HttpSession session = req.getSession();
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

		if (cart == null) {
			cart = new ArrayList<>();
			session.setAttribute("cart", cart);
		}

		// ===== XỬ LÝ ACTION =====
		if ("inc".equals(action)) {

			for (CartItem item : cart) {
				if (item.getProduct().getId() == productId) {
					item.setQuantity(item.getQuantity() + 1);
					break;
				}
			}

		} else if ("dec".equals(action)) {

			cart.removeIf(item -> {
				if (item.getProduct().getId() == productId) {
					item.setQuantity(item.getQuantity() - 1);
					return item.getQuantity() <= 0;
				}
				return false;
			});

		} else if ("remove".equals(action)) {

			cart.removeIf(item -> item.getProduct().getId() == productId);

		} else {
			// ===== ADD TO CART / BUY NOW =====
			boolean found = false;

			for (CartItem item : cart) {
				if (item.getProduct().getId() == productId) {
					item.setQuantity(item.getQuantity() + quantity);
					found = true;
					break;
				}
			}

			if (!found) {
				Product product = productService.findById(productId);
				cart.add(new CartItem(product, quantity));
			}

			// BUY NOW → nhảy thẳng checkout
			if ("true".equals(req.getParameter("buyNow"))) {
				updateCartCount(session, cart);
				resp.sendRedirect(req.getContextPath() + "/checkout");
				return;
			}
		}

		// ===== CẬP NHẬT CART COUNT =====
		updateCartCount(session, cart);

		resp.sendRedirect(req.getContextPath() + "/cart");
	}

	private void updateCartCount(HttpSession session, List<CartItem> cart) {
		int cartCount = 0;
		for (CartItem item : cart) {
			cartCount += item.getQuantity();
		}
		session.setAttribute("cart", cart);
		session.setAttribute("cartCount", cartCount);
	}

}
