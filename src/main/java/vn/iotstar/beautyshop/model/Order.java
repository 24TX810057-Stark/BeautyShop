package vn.iotstar.beautyshop.model;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {

	private int id;
	private int userId;

	private String receiverName;
	private String phone;
	private String address;
	private String ward;
	
	private double totalAmount;
	private String status;
	private Timestamp createdAt;
	
	private List<OrderItem> items;
}
