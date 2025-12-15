package vn.iotstar.beautyshop.controllers.user;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.iotstar.beautyshop.model.CartItem;

@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

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

        // Tính tiền lại cho chắc
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
}
