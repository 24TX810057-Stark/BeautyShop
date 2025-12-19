package vn.iotstar.beautyshop.model;

import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {

	private int id;
	private int userId;
	private double total;
	private String status;
	private Timestamp createdAt;
}
