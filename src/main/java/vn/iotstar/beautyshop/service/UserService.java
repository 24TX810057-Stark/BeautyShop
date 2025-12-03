package vn.iotstar.beautyshop.service;

import vn.iotstar.beautyshop.model.User;

public interface UserService {
    User login(String identifier, String password);

	boolean register(User user);
    
}


