package vn.iotstar.beautyshop.model;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private int id;
	private String name;
	private double price;
	private double salePrice;
	private String image;
	private int categoryId;
	private String description;
	private LocalDateTime createdAt;
}
