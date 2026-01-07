package vn.iotstar.beautyshop.service.impl;

import java.util.List;
import java.util.Map;

import vn.iotstar.beautyshop.dao.OrderDAO;
import vn.iotstar.beautyshop.dao.impl.OrderDAOImpl;
import vn.iotstar.beautyshop.model.CartItem;
import vn.iotstar.beautyshop.model.Order;
import vn.iotstar.beautyshop.service.OrderService;

public class OrderServiceImpl implements OrderService {

	private OrderDAO orderDAO = new OrderDAOImpl();

	@Override
	public int createOrder(Order order) {
		return orderDAO.createOrder(order);
	}

	@Override
	public void createOrderItems(int orderId, List<CartItem> cart) {
		orderDAO.createOrderItems(orderId, cart);
	}

	@Override
	public List<Order> findByUserId(int userId) {
		return orderDAO.findByUserId(userId);
	}

	@Override
	public Order findById(int orderId) {
		return orderDAO.findById(orderId);
	}

	@Override
	public Order getOrderDetail(int orderId, int userId) {
		return orderDAO.findOrderDetail(orderId, userId);
	}

	@Override
	public List<Order> findAll() {
		return orderDAO.findAll();
	}

	@Override
	public List<Order> findAllPaginated(int offset, int limit) {
		return orderDAO.findAllPaginated(offset, limit);
	}

	@Override
	public int countAll() {
		return orderDAO.countAll();
	}

	@Override
	public void updateStatus(int orderId, String status) {
		orderDAO.updateStatus(orderId, status);
	}

	@Override
	public double getTotalRevenue() {
		return orderDAO.sumRevenue();
	}

	@Override
	public int countOrders() {
		return orderDAO.countAll();
	}

	@Override
	public Map<Integer, Double> getRevenueByDay(int month, int year) {
		return orderDAO.getRevenueByDay(month, year);
	}

	@Override
	public double getRevenueByMonth(int month, int year) {
		return orderDAO.getRevenueByMonth(month, year);
	}

	@Override
	public int countCompletedOrders(int month, int year) {
		return orderDAO.countCompletedOrders(month, year);
	}

	@Override
	public Map<String, Double> getRevenueByCategory() {
		return orderDAO.getRevenueByCategory();
	}

	@Override
	public Map<String, Double> getRevenueByCategory(int month, int year) {
		return orderDAO.getRevenueByCategory(month, year);
	}

	@Override
	public List<Order> findByUserIdPaginated(int userId, int offset, int size) {
		return orderDAO.findByUserIdPaginated(userId, offset, size);
	}

	@Override
	public int countByUserId(int userId) {
		return orderDAO.countByUserId(userId);
	}

}