package vn.iotstar.beautyshop.controllers.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.beautyshop.model.User;
import vn.iotstar.beautyshop.service.UserService;
import vn.iotstar.beautyshop.service.impl.UserServiceImpl;
import vn.iotstar.beautyshop.util.PasswordUtil;

@WebServlet(urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/views/web/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String password = req.getParameter("password");
		String fullName = req.getParameter("fullName");

		// Kiểm tra trước
		if (email == null || phone == null || phone.isEmpty() || password == null || email.isEmpty()
				|| password.isEmpty()) {
			req.setAttribute("alert", "Vui lòng nhập đầy đủ thông tin.");
			req.getRequestDispatcher("/views/web/register.jsp").forward(req, resp);
			return;
		}

		// Tạo user
		User user = new User();
		user.setEmail(email);
		user.setPhone(phone);
		user.setPassword(PasswordUtil.hash(password));
		user.setFullName(fullName);
		user.setRole("USER");
		user.setStatus(1);

		boolean result = userService.register(user);

		if (result) {
			resp.sendRedirect(req.getContextPath() + "/login");
		} else {
			req.setAttribute("alert", "Email đã tồn tại hoặc đăng ký thất bại.");
			req.getRequestDispatcher("/views/web/register.jsp").forward(req, resp);
		}
	}
}
