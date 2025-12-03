package vn.iotstar.beautyshop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.beautyshop.configs.DBConnect;
import vn.iotstar.beautyshop.dao.UserDAO;
import vn.iotstar.beautyshop.model.User;

public class UserDAOImpl implements UserDAO {

	@Override
	public User findById(int id) {
		String sql = "SELECT * FROM users WHERE id = ?";
		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return mapUser(rs);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public User findByEmail(String email) {
		String sql = "SELECT * FROM users WHERE email = ? AND status = 1";
		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return mapUser(rs);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public User findByEmailAndPassword(String email, String password) {
		String sql = "SELECT * FROM users WHERE email = ? AND password = ? AND status = 1";
		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return mapUser(rs);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public User findByPhone(String phone) {
		String sql = "SELECT * FROM users WHERE phone = ?";
		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, phone);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setPassword(rs.getString("password"));
				user.setFullName(rs.getString("full_name"));
				user.setRole(rs.getString("role"));
				user.setStatus(rs.getInt("status"));
				return user;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean existsByPhone(String phone) {
		return findByPhone(phone) != null;
	}

	@Override
	public List<User> findAll() {
		List<User> list = new ArrayList<>();
		String sql = "SELECT * FROM users";

		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				list.add(mapUser(rs));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean insert(User user) {
		String sql = "INSERT INTO users (email,phone, password, full_name, role, status) VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPhone());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getFullName());
			ps.setString(5, user.getRole());
			ps.setInt(6, user.getStatus());

			int rows = ps.executeUpdate();
			return rows > 0;

		} catch (Exception e) {
			System.err.println("Insert user error: " + e.getMessage());
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean update(User user) {
		String sql = "UPDATE users SET email = ?, password = ?, full_name = ?, role = ?, status = ? WHERE id = ?";

		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getFullName());
			ps.setString(4, user.getRole());
			ps.setInt(5, user.getStatus());
			ps.setInt(6, user.getId());

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public boolean delete(int id) {
		String sql = "DELETE FROM users WHERE id = ?";

		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, id);
			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public boolean existsByEmail(String email) {
		String sql = "SELECT 1 FROM users WHERE email = ?";

		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	private User mapUser(ResultSet rs) throws Exception {
		User u = new User();
		u.setId(rs.getInt("id"));
		u.setEmail(rs.getString("email"));
		u.setPassword(rs.getString("password"));
		u.setFullName(rs.getString("full_name"));
		u.setRole(rs.getString("role"));
		u.setStatus(rs.getInt("status"));
		return u;
	}
}
