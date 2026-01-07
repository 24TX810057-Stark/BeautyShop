package vn.iotstar.beautyshop.service.impl;

import vn.iotstar.beautyshop.dao.UserDAO;
import vn.iotstar.beautyshop.dao.impl.UserDAOImpl;
import vn.iotstar.beautyshop.model.User;
import vn.iotstar.beautyshop.security.PasswordUtil;
import vn.iotstar.beautyshop.service.UserService;

public class UserServiceImpl implements UserService {

	private UserDAO userDAO = new UserDAOImpl();

	@Override
	public User login(String identifier, String password) {

		if (identifier == null || password == null || identifier.isEmpty() || password.isEmpty()) {
			return null;
		}

		User user;

		// nếu có @ thì coi là email, còn lại là sdt
		if (identifier.contains("@")) {
			user = userDAO.findByEmail(identifier);
		} else {
			user = userDAO.findByPhone(identifier);
		}

		if (user == null)
			return null;

		if (!PasswordUtil.verify(password, user.getPassword()))
			return null;

		if (user.getStatus() == 0)
			return null;

		return user;
	}

	@Override
	public boolean register(User user) {

		if (user == null)
			return false;

		// check email rỗng
		if (user.getEmail() == null || user.getEmail().isEmpty()) {
			return false;
		}

		// check phone rỗng
		if (user.getPhone() == null || user.getPhone().isEmpty()) {
			return false;
		}

		// check trùng email
		if (userDAO.findByEmail(user.getEmail()) != null) {
			return false;
		}

		// check trùng sdt
		if (userDAO.findByPhone(user.getPhone()) != null) {
			return false;
		}

		// set role mặc định nếu chưa có
		if (user.getRole() == null || user.getRole().isEmpty()) {
			user.setRole("USER");
		}

		// set status mặc định
		if (user.getStatus() == 0) {
			user.setStatus(1);
		}

		// Trả về kết quả insert thực sự
		return userDAO.insert(user);
	}

}
