package vn.iotstar.beautyshop.dao;

import java.util.List;
import vn.iotstar.beautyshop.model.User;

public interface UserDAO {

	User findById(int id);

	User findByEmail(String email);

	User findByPhone(String phone);

	User findByEmailAndPassword(String email, String password);

	List<User> findAll();

	boolean insert(User user);

	boolean update(User user);

	boolean delete(int id);

	boolean existsByEmail(String email);

	boolean existsByPhone(String phone);

}
