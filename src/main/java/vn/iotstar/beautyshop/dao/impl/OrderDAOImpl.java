package vn.iotstar.beautyshop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.beautyshop.configs.DBConnect;
import vn.iotstar.beautyshop.dao.OrderDAO;
import vn.iotstar.beautyshop.model.CartItem;
import vn.iotstar.beautyshop.model.Order;

public class OrderDAOImpl implements OrderDAO {

	// ===== SQL =====
	private static final String FIND_BY_USER = "SELECT id, user_id, total_amount, status, created_at "
			+ "FROM orders WHERE user_id = ? ORDER BY created_at DESC";

	private static final String INSERT_ORDER = "INSERT INTO orders (user_id, total_amount, status, created_at) "
			+ "VALUES (?, ?, ?, GETDATE())";

	private static final String INSERT_ORDER_ITEM = "INSERT INTO order_items (order_id, product_id, price, quantity) "
			+ "VALUES (?, ?, ?, ?)";

	// ===== READ =====
	@Override
	public List<Order> findByUserId(int userId) {
		List<Order> list = new ArrayList<>();

		try (Connection con = DBConnect.getConnection(); PreparedStatement ps = con.prepareStatement(FIND_BY_USER)) {

			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Order o = new Order();
				o.setId(rs.getInt("id"));
				o.setUserId(rs.getInt("user_id"));
				o.setTotal(rs.getDouble("total_amount"));
				o.setStatus(rs.getString("status"));
				o.setCreatedAt(rs.getTimestamp("created_at"));
				list.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// ===== INSERT ORDER =====
	@Override
	public int createOrder(Order order) {
		int orderId = 0;

		try (Connection con = DBConnect.getConnection();
				PreparedStatement ps = con.prepareStatement(INSERT_ORDER, PreparedStatement.RETURN_GENERATED_KEYS)) {

			ps.setInt(1, order.getUserId());
			ps.setDouble(2, order.getTotal());
			ps.setString(3, order.getStatus());

			ps.executeUpdate();

			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				orderId = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return orderId;
	}

	// ===== INSERT ORDER ITEMS =====
	@Override
	public void createOrderItems(int orderId, List<CartItem> cart) {

		try (Connection con = DBConnect.getConnection();
				PreparedStatement ps = con.prepareStatement(INSERT_ORDER_ITEM)) {

			for (CartItem item : cart) {
				ps.setInt(1, orderId);
				ps.setInt(2, item.getProduct().getId());
				ps.setDouble(3, item.getProduct().getPrice());
				ps.setInt(4, item.getQuantity());
				ps.addBatch();
			}

			ps.executeBatch();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Order findById(int orderId) {
		// làm sau
		return null;
	}
}
