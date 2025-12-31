package vn.iotstar.beautyshop.controllers.user;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/page/*")
public class PageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String path = req.getPathInfo(); // /return-policy, /privacy, /about...

		if (path == null) {
			resp.sendError(404);
			return;
		}

		String view;

		switch (path) {

		// Chăm sóc khách hàng
		case "/return-policy":
			view = "/views/web/page/return-policy.jsp";
			break;
		case "/privacy-policy":
			view = "/views/web/page/privacy-policy.jsp";
			break;
		case "/payment-policy":
			view = "/views/web/page/payment-policy.jsp";
			break;
		case "/terms":
			view = "/views/web/page/terms.jsp";
			break;
		case "/buy-guide":
			view = "/views/web/page/buy-guide.jsp";
			break;

		// Công ty
		case "/about":
			view = "/views/web/page/about.jsp";
			break;
		case "/contact":
			view = "/views/web/page/contact.jsp";
			break;
		case "/recruitment":
			view = "/views/web/page/recruitment.jsp";
			break;

		default:
			resp.sendError(404);
			return;
		}

		req.getRequestDispatcher(view).forward(req, resp);
	}
}
