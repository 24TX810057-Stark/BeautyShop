package vn.iotstar.beautyshop.service.impl;

import java.util.List;

import vn.iotstar.beautyshop.dao.CategoryDAO;
import vn.iotstar.beautyshop.dao.impl.CategoryDAOImpl;
import vn.iotstar.beautyshop.model.Category;
import vn.iotstar.beautyshop.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {

    private CategoryDAO dao = new CategoryDAOImpl();

    @Override
    public List<Category> getAll() {
        return dao.findAll();
    }

    @Override
    public Category getById(int id) {
        return dao.findById(id);
    }

    @Override
    public boolean add(Category c) {
        if(c.getName() == null || c.getName().trim().isEmpty())
            return false;

        dao.insert(c);
        return true;
    }

    @Override
    public boolean update(Category c) {
        if(c.getName() == null || c.getName().trim().isEmpty())
            return false;

        dao.update(c);
        return true;
    }

    @Override
    public boolean delete(int id) {
        dao.delete(id);
        return true;
    }
}
