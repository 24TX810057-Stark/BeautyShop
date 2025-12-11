package vn.iotstar.beautyshop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.beautyshop.configs.DBConnect;
import vn.iotstar.beautyshop.dao.ProductDAO;
import vn.iotstar.beautyshop.model.Product;

public class ProductDAOImpl implements ProductDAO {

	@Override
	public List<Product> findByCategory(int categoryId) {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM Products WHERE categoryId=?";

		try (Connection con = DBConnect.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, categoryId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
						rs.getDouble("oldPrice"), rs.getString("image"), rs.getInt("categoryId"),
						rs.getString("description"));
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Product findById(int id) {
		String sql = "SELECT * FROM Products WHERE id=?";

		try (Connection con = DBConnect.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
						rs.getDouble("oldPrice"), rs.getString("image"), rs.getInt("categoryId"),
						rs.getString("description"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}
