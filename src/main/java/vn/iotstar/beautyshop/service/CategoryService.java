package vn.iotstar.beautyshop.service;

import java.util.List;

import vn.iotstar.beautyshop.model.Category;


public interface CategoryService {
    List<Category> getAll();
    Category getById(int id);
    boolean add(Category c);
    boolean update(Category c);
    boolean delete(int id);
}
