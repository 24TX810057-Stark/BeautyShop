package vn.iotstar.beautyshop.dao;

import java.util.List;

import vn.iotstar.beautyshop.model.Product;

public interface ProductDAO {
	List<Product> findByCategory(int categoryId);

	Product findById(int id);

	List<Product> search(String keyword);

	List<Product> findLatest();

	List<Product> findAll();
}
