package vn.iotstar.beautyshop.model;

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
	private double oldPrice;
	private String image;
	private int categoryId;
	private String description;
}
