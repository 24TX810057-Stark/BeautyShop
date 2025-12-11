package vn.iotstar.beautyshop.service.impl;

import java.util.List;

import vn.iotstar.beautyshop.dao.ProductDAO;
import vn.iotstar.beautyshop.dao.impl.ProductDAOImpl;
import vn.iotstar.beautyshop.model.Product;
import vn.iotstar.beautyshop.service.ProductService;

public class ProductServiceImpl implements ProductService {

	private ProductDAO dao = new ProductDAOImpl();

	@Override
	public Product findById(int id) {
		return dao.findById(id);
	}

	@Override
	public List<Product> findByCategory(int categoryId) {
		return dao.findByCategory(categoryId);
	}

	@Override
	public List<Product> search(String keyword) {
		return dao.search(keyword);
	}

	@Override
	public List<Product> findLatest() {
		return dao.findLatest();
	}

	@Override
	public List<Product> findAll() {
		return dao.findAll();
	}
}
