package vn.iotstar.beautyshop.dao;

import java.util.List;
import java.util.Map;

import vn.iotstar.beautyshop.model.CartItem;
import vn.iotstar.beautyshop.model.Order;

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

	double sumRevenue();

	int countAll();

	Map<Integer, Double> getRevenueByDay(int month, int year);

	double getRevenueByMonth(int month, int year);

	int countCompletedOrders(int month, int year);

	Map<String, Double> getRevenueByCategory();

	Map<String, Double> getRevenueByCategory(int month, int year);

}
