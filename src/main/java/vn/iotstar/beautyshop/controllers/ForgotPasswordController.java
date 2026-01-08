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
import vn.iotstar.beautyshop.util.MailUtil;
import vn.iotstar.beautyshop.util.PasswordUtil;

@WebServlet("/forgot-password")
public class ForgotPasswordController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserService userService = new UserServiceImpl();
	private MailUtil mailUtil = new MailUtil();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		/*
		 * // LOG DEBUG System.out.println("FORGOT PASSWORD - EMAIL INPUT = [" + email +
		 * "]");
		 */
		User user = userService.findByEmail(email);

		if (user == null) {
			req.setAttribute("error", "Email không tồn tại");
			req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
			return;
		}

		// tạo mật khẩu tạm
		String tempPassword = PasswordUtil.randomPassword(8);

		// update DB (HASH + đánh dấu tạm)
		userService.updateTempPassword(user.getId(), tempPassword);

		// gửi mail
		mailUtil.send(email, "Mật khẩu tạm - BeautyShop",
				"Mật khẩu tạm của bạn là: " + tempPassword + "\nVui lòng đăng nhập và đổi lại mật khẩu.");

		req.setAttribute("msg", "Mật khẩu tạm đã gửi về email.");
		req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
	}

}
