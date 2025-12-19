package vn.iotstar.beautyshop.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.beautyshop.model.User;
import vn.iotstar.beautyshop.service.UserService;
import vn.iotstar.beautyshop.service.impl.UserServiceImpl;

@WebServlet("/login")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private final UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);
		User user = (session != null) ? (User) session.getAttribute("user") : null;

		// ĐÃ LOGIN → QUAY LẠI LUỒNG CŨ NẾU CÓ
		if (user != null) {
			String redirect = (session != null) ? (String) session.getAttribute("redirectAfterLogin") : null;

			if (redirect != null) {
				session.removeAttribute("redirectAfterLogin");
				resp.sendRedirect(redirect);
			} else {
				resp.sendRedirect(req.getContextPath() + "/home");
			}
			return;
		}

		// CHƯA LOGIN
		req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String identifier = req.getParameter("identifier");
		String password = req.getParameter("password");

		User user = userService.login(identifier, password);

		if (user == null) {
			req.setAttribute("error", "Sai email, số điện thoại hoặc mật khẩu");
			req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
			return;
		}
		HttpSession session = req.getSession();
		session.setAttribute("user", user);

		// quay lại trang đang làm dở
		String redirect = (String) session.getAttribute("redirectAfterLogin");
		if (redirect != null) {
			session.removeAttribute("redirectAfterLogin");
			resp.sendRedirect(redirect);
			return;
		}

		// fallback theo role
		if ("ADMIN".equalsIgnoreCase(user.getRole())) {
			resp.sendRedirect(req.getContextPath() + "/manager/home");
		} else {
			resp.sendRedirect(req.getContextPath() + "/home");
		}

	}

}
