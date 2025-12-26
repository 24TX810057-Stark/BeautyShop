package vn.iotstar.beautyshop.dao;

import java.util.List;
import vn.iotstar.beautyshop.model.Order;
import vn.iotstar.beautyshop.model.CartItem;

public interface OrderDAO {

	// INSERT
	int createOrder(Order order);

	void createOrderItems(int orderId, List<CartItem> cart);

	// READ
	List<Order> findByUserId(int userId);

	Order findById(int orderId);

	Order findOrderDetail(int orderId, int userId);

	List<Order> findAll();

	void updateStatus(int orderId, String status);

}
