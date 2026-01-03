package vn.iotstar.beautyshop.dao;

import java.util.List;

import vn.iotstar.beautyshop.model.Banner;

public interface BannerDAO {
    List<Banner> findAll();

    List<Banner> findAll(int offset, int limit);

    int count();

    List<Banner> findAllActive();

    Banner findById(int id);

    void insert(Banner banner);

    void update(Banner banner);

    void delete(int id);
}
