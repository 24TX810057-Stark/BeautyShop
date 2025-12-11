package vn.iotstar.beautyshop.service;

import java.util.List;

import vn.iotstar.beautyshop.model.Product;

public interface ProductService {
    Product findById(int id);
    List<Product> findByCategory(int categoryId);
    List<Product> findAll();       
    List<Product> findLatest();   
    List<Product> search(String keyword); 
    
}

