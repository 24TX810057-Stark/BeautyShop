package vn.iotstar.beautyshop.dao;

import java.util.List;

import vn.iotstar.beautyshop.model.Product;

public interface ProductDAO {
	List<Product> findByCategory(int categoryId);

	Product findById(int id);

	List<Product> search(String keyword);

	List<Product> findLatest();

	List<Product> findAll();

	List<Product> findAllPaginated(int offset, int limit);

	int count();

	void insert(Product product);

	void update(Product product);

	void delete(int id);

	List<Product> findByCategory(int categoryId, String sort);

	List<Product> findAll(String sort);

	List<Product> search(String keyword, String sort);

	List<Product> findByPriceRange(Double min, Double max, String sort);

	List<Product> findBestSeller(int limit);

	Object findDealUnder100k(String sort);

}
