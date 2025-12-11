package vn.iotstar.beautyshop.dao;

import java.util.List;

import vn.iotstar.beautyshop.model.Category;


public interface CategoryDAO {
	List<Category> findAll();

	Category findById(int id);
}
