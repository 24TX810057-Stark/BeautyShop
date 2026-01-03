package vn.iotstar.beautyshop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.beautyshop.configs.DBConnect;
import vn.iotstar.beautyshop.dao.CategoryDAO;
import vn.iotstar.beautyshop.model.Category;

public class CategoryDAOImpl implements CategoryDAO {

	@Override
	public List<Category> findAll() {
		List<Category> list = new ArrayList<>();

		String sql = "SELECT * FROM Categories";

		try (Connection con = DBConnect.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Category c = new Category(rs.getInt("id"), rs.getString("name"), rs.getString("image"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Category> findAll(int offset, int limit) {
		List<Category> list = new ArrayList<>();
		String sql = "SELECT * FROM Categories ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

		try (Connection con = DBConnect.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, offset);
			ps.setInt(2, limit);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Category c = new Category(rs.getInt("id"), rs.getString("name"), rs.getString("image"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int count() {
		String sql = "SELECT COUNT(*) FROM Categories";

		try (Connection con = DBConnect.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			if (rs.next()) {
				return rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public Category findById(int id) {
		String sql = "SELECT * FROM Categories WHERE id=?";

		try (Connection con = DBConnect.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return new Category(rs.getInt("id"), rs.getString("name"), rs.getString("image"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public void insert(Category category) {
		String sql = "INSERT INTO Categories(name, image) VALUES (?, ?)";

		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, category.getName());
			ps.setString(2, category.getImage());
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(Category category) {
		String sql = "UPDATE Categories SET name = ?, image = ? WHERE id = ?";
		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, category.getName());
			ps.setString(2, category.getImage());
			ps.setInt(3, category.getId());

			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(int id) {
		// Xóa tất cả sản phẩm thuộc danh mục này trước
		String deleteProducts = "DELETE FROM Products WHERE categoryId = ?";
		try (Connection conn = DBConnect.getConnection();
				PreparedStatement ps = conn.prepareStatement(deleteProducts)) {
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		// Sau đó xóa danh mục
		String sql = "DELETE FROM Categories WHERE id = ?";
		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
