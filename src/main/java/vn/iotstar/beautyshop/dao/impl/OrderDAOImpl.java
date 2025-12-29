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
import vn.iotstar.beautyshop.model.OrderItem;

public class OrderDAOImpl implements OrderDAO {

	// ===== SQL =====
	private static final String FIND_BY_USER = "SELECT id, user_id, receiver_name, phone, address, ward, "
			+ "total_amount, status, created_at " + "FROM orders WHERE user_id = ? ORDER BY created_at DESC";

	private static final String INSERT_ORDER = "INSERT INTO orders (user_id, receiver_name, phone, address, ward, total_amount, status, created_at) "
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, GETDATE())";

	private static final String INSERT_ORDER_ITEM = "INSERT INTO order_items (order_id, product_id, price, quantity) "
			+ "VALUES (?, ?, ?, ?)";

	private static final String FIND_BY_ID = "SELECT id, user_id, receiver_name, phone, address, ward, "
			+ "total_amount, status, created_at " + "FROM orders WHERE id = ?";

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
				o.setTotalAmount(rs.getDouble("total_amount"));
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
			ps.setString(2, order.getReceiverName());
			ps.setString(3, order.getPhone());
			ps.setString(4, order.getAddress());
			ps.setString(5, order.getWard());
			ps.setDouble(6, order.getTotalAmount());
			ps.setString(7, order.getStatus());

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

		Order o = null;

		try (Connection con = DBConnect.getConnection(); PreparedStatement ps = con.prepareStatement(FIND_BY_ID)) {

			ps.setInt(1, orderId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				o = new Order();
				o.setId(rs.getInt("id"));
				o.setUserId(rs.getInt("user_id"));

				o.setReceiverName(rs.getString("receiver_name"));
				o.setPhone(rs.getString("phone"));
				o.setAddress(rs.getString("address"));
				o.setWard(rs.getString("ward"));

				o.setTotalAmount(rs.getDouble("total_amount"));
				o.setStatus(rs.getString("status"));
				o.setCreatedAt(rs.getTimestamp("created_at"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return o;
	}

	@Override
	public Order findOrderDetail(int orderId, int userId) {

		String sql = """
				    SELECT o.id, o.user_id, o.total_amount, o.status, o.created_at,
				           oi.product_id, oi.price, oi.quantity,
				           p.name,
				           p.image
				    FROM orders o
				    JOIN order_items oi ON o.id = oi.order_id
				    JOIN products p ON oi.product_id = p.id
				    WHERE o.id = ? AND o.user_id = ?
				""";

		Order order = null;
		List<OrderItem> items = new ArrayList<>();

		try (Connection con = DBConnect.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, orderId);
			ps.setInt(2, userId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				if (order == null) {
					order = new Order();
					order.setId(rs.getInt("id"));
					order.setUserId(rs.getInt("user_id"));
					order.setTotalAmount(rs.getDouble("total_amount"));
					order.setStatus(rs.getString("status"));
					order.setCreatedAt(rs.getTimestamp("created_at"));
				}

				OrderItem item = new OrderItem();
				item.setProductId(rs.getInt("product_id"));
				item.setProductName(rs.getString("name"));
				item.setImage(rs.getString("image")); 
				item.setPrice(rs.getDouble("price"));
				item.setQuantity(rs.getInt("quantity"));

				items.add(item);
			}

			if (order != null) {
				order.setItems(items);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return order;
	}
//============================================================
	@Override
	public List<Order> findAll() {
		List<Order> list = new ArrayList<>();

		String sql = "SELECT * FROM orders ORDER BY created_at DESC";

		try (Connection conn = DBConnect.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Order o = new Order();
				o.setId(rs.getInt("id"));
				o.setUserId(rs.getInt("user_id"));
				o.setTotalAmount(rs.getDouble("total_amount"));
				o.setStatus(rs.getString("status"));
				o.setCreatedAt(rs.getTimestamp("created_at"));
				o.setReceiverName(rs.getString("receiver_name"));
				o.setPhone(rs.getString("phone"));
				o.setAddress(rs.getString("address"));
				o.setWard(rs.getString("ward"));

				list.add(o);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateStatus(int orderId, String status) {

		String sql = "UPDATE orders SET status = ? WHERE id = ?";

		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			ps.setInt(2, orderId);
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
