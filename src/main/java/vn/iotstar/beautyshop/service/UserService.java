package vn.iotstar.beautyshop.service;

import vn.iotstar.beautyshop.model.User;

public interface UserService {
	User login(String identifier, String password);

	boolean register(User user);

	void updateTempPassword(int userId, String rawPassword);

	void changePassword(int id, String newPass);

	User findByEmail(String email);

}
