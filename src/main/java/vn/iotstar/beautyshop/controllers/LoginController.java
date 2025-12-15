package vn.iotstar.beautyshop.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.beautyshop.model.User;
import vn.iotstar.beautyshop.service.UserService;
import vn.iotstar.beautyshop.service.impl.UserServiceImpl;

@WebServlet("/login")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private final UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

		req.getSession().setAttribute("account", user);

		if ("ADMIN".equalsIgnoreCase(user.getRole())) {
			resp.sendRedirect(req.getContextPath() + "/manager/home");
		} else {
			resp.sendRedirect(req.getContextPath() + "/home");
		}
	}

}
