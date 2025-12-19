package vn.iotstar.beautyshop.service.impl;

import java.util.List;

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
}
