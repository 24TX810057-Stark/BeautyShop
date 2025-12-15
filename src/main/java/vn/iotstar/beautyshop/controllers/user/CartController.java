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

		// ===== TÍNH TOÁN =====
		int cartCount = 0;
		double subTotal = 0;

		for (CartItem item : cart) {
			cartCount += item.getQuantity();
			subTotal += item.getProduct().getPrice() * item.getQuantity();
		}

		double discount = 0; // sau này áp mã
		double total = subTotal - discount;

		// ===== SET ATTRIBUTE =====
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

		HttpSession session = req.getSession();
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

		if (cart == null) {
			cart = new ArrayList<>();
			session.setAttribute("cart", cart);
		}

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
			// ADD từ "Thêm vào giỏ"
			for (CartItem item : cart) {
				if (item.getProduct().getId() == productId) {
					item.setQuantity(item.getQuantity() + 1);
					resp.sendRedirect(req.getContextPath() + "/cart");
					return;
				}
			}

			Product product = productService.findById(productId);
			cart.add(new CartItem(product, 1));
		}

		resp.sendRedirect(req.getContextPath() + "/cart");
	}

}
