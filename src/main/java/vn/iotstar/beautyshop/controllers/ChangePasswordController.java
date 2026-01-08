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

@WebServlet("/change-password")
public class ChangePasswordController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/views/change-password.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		User user = (User) session.getAttribute("user");

		String newPassword = req.getParameter("newPassword");
		String confirm = req.getParameter("confirmPassword");

		if (newPassword == null || confirm == null || !newPassword.equals(confirm)) {
			req.setAttribute("error", "Mật khẩu không khớp");
			req.getRequestDispatcher("/views/change-password.jsp").forward(req, resp);
			return;
		}

		userService.changePassword(user.getId(), newPassword);

		// cập nhật lại user trong session
		user.setTempPassword(false);
		session.setAttribute("user", user);

		resp.sendRedirect(req.getContextPath() + "/home");
	}
}
