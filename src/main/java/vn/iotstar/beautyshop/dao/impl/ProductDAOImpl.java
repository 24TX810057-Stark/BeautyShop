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
	public List<Product> findByCategory(int categoryId, String sort) {
		List<Product> list = new ArrayList<>();

		String sql = "SELECT * FROM Products WHERE categoryId=? ORDER BY " + buildOrderBy(sort);

		try (Connection con = DBConnect.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, categoryId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
						rs.getDouble("salePrice"), rs.getString("image"), rs.getInt("categoryId"),
						rs.getString("description"), rs.getTimestamp("created_at").toLocalDateTime());
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
						rs.getDouble("salePrice"), rs.getString("image"), rs.getInt("categoryId"),
						rs.getString("description"), rs.getTimestamp("created_at").toLocalDateTime());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List<Product> search(String keyword, String sort) {
		List<Product> list = new ArrayList<>();

		String sql = "SELECT * FROM Products WHERE name LIKE ? ORDER BY " + buildOrderBy(sort);

		try (Connection con = DBConnect.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, "%" + keyword + "%");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
						rs.getDouble("salePrice"), rs.getString("image"), rs.getInt("categoryId"),
						rs.getString("description"), rs.getTimestamp("created_at").toLocalDateTime());
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Product> findLatest() {
		List<Product> list = new ArrayList<>();

		String sql = "SELECT TOP 8 * FROM Products ORDER BY id DESC";

		try (Connection con = DBConnect.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
						rs.getDouble("salePrice"), rs.getString("image"), rs.getInt("categoryId"),
						rs.getString("description"), rs.getTimestamp("created_at").toLocalDateTime());
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Product> findAll(String sort) {
		List<Product> list = new ArrayList<>();

		String sql = "SELECT * FROM Products ORDER BY " + buildOrderBy(sort);

		try (Connection con = DBConnect.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
						rs.getDouble("salePrice"), rs.getString("image"), rs.getInt("categoryId"),
						rs.getString("description"), rs.getTimestamp("created_at").toLocalDateTime());
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void insert(Product product) {
		String sql = "INSERT INTO Products(name, price, salePrice, image, categoryId, description) VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, product.getName());
			ps.setDouble(2, product.getPrice());
			ps.setDouble(3, product.getSalePrice());
			ps.setString(4, product.getImage());
			ps.setInt(5, product.getCategoryId());
			ps.setString(6, product.getDescription());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(Product product) {
		String sql = "UPDATE Products SET name = ?, price = ?, salePrice = ?, image = ?, categoryId = ?, description = ? WHERE id = ?";

		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, product.getName());
			ps.setDouble(2, product.getPrice());
			ps.setDouble(3, product.getSalePrice());
			ps.setString(4, product.getImage());
			ps.setInt(5, product.getCategoryId());
			ps.setString(6, product.getDescription());
			ps.setInt(7, product.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(int id) {
		String sql = "DELETE FROM Products WHERE id = ?";

		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String buildOrderBy(String sort) {
		switch (sort) {
		case "price_asc":
			return "price ASC";
		case "price_desc":
			return "price DESC";
		default:
			return "created_at DESC";
		}
	}

	@Override
	public List<Product> findByCategory(int categoryId) {
		return findByCategory(categoryId, "new");
	}

	@Override
	public List<Product> findAll() {
		return findAll("new");
	}

	@Override
	public List<Product> search(String keyword) {
		return search(keyword, "new");
	}

	@Override
	public List<Product> findByPriceRange(Double min, Double max, String sort) {
		List<Product> list = new ArrayList<>();

		StringBuilder sql = new StringBuilder("SELECT * FROM Products WHERE 1=1");

		if (min != null)
			sql.append(" AND price >= ").append(min);
		if (max != null)
			sql.append(" AND price <= ").append(max);

		sql.append(" ORDER BY ").append(buildOrderBy(sort));

		try (Connection con = DBConnect.getConnection();
				PreparedStatement ps = con.prepareStatement(sql.toString());
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
						rs.getDouble("salePrice"), rs.getString("image"), rs.getInt("categoryId"),
						rs.getString("description"), rs.getTimestamp("created_at").toLocalDateTime());
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Product> findBestSeller(int limit) {
		List<Product> list = new ArrayList<>();

		String sql = String.format("""
				    SELECT TOP %d
				        p.id, p.name, p.price, p.salePrice,
				        p.image, p.categoryId, p.description, p.created_at,
				        SUM(oi.quantity) AS total_sold
				    FROM products p
				    JOIN order_items oi ON p.id = oi.product_id
				    GROUP BY
				        p.id, p.name, p.price, p.salePrice,
				        p.image, p.categoryId, p.description, p.created_at
				    ORDER BY total_sold DESC
				""", limit);

		try (Connection con = DBConnect.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
						rs.getDouble("salePrice"), rs.getString("image"), rs.getInt("categoryId"),
						rs.getString("description"), rs.getTimestamp("created_at").toLocalDateTime());
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Product> findDealUnder100k(String sort) {

		List<Product> list = new ArrayList<>();

		String orderBy = buildOrderBy(sort);

		String sql = """
				SELECT *
				FROM Products
				WHERE
				    (salePrice IS NOT NULL AND salePrice <= 100000)
				    OR
				    (salePrice IS NULL AND price <= 100000)
				""" + "ORDER BY " + orderBy;

		try (Connection con = DBConnect.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
						rs.getDouble("salePrice"), rs.getString("image"), rs.getInt("categoryId"),
						rs.getString("description"), rs.getTimestamp("created_at").toLocalDateTime());
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}