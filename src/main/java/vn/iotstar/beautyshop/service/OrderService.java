package vn.iotstar.beautyshop.service;

import java.util.List;
import vn.iotstar.beautyshop.model.Order;
import vn.iotstar.beautyshop.model.CartItem;

public interface OrderService {

    // ===== USER =====
    int createOrder(Order order);

    void createOrderItems(int orderId, List<CartItem> cart);

    List<Order> findByUserId(int userId);

    Order findById(int orderId);

    Order getOrderDetail(int orderId, int userId);

    // ===== MANAGER =====
    List<Order> findAll();                 // manager xem danh sách đơn

    void updateStatus(int orderId, String status); // manager đổi trạng thái
}
