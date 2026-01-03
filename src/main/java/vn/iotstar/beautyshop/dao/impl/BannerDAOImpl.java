package vn.iotstar.beautyshop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.beautyshop.configs.DBConnect;
import vn.iotstar.beautyshop.dao.BannerDAO;
import vn.iotstar.beautyshop.model.Banner;

public class BannerDAOImpl implements BannerDAO {

    @Override
    public List<Banner> findAll() {
        List<Banner> list = new ArrayList<>();
        String sql = "SELECT * FROM banners ORDER BY display_order ASC";

        try (Connection con = DBConnect.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Banner banner = mapResultSetToBanner(rs);
                list.add(banner);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Banner> findAll(int offset, int limit) {
        List<Banner> list = new ArrayList<>();
        String sql = "SELECT * FROM banners ORDER BY display_order ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection con = DBConnect.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, offset);
            ps.setInt(2, limit);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Banner banner = mapResultSetToBanner(rs);
                list.add(banner);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public int count() {
        String sql = "SELECT COUNT(*) FROM banners";

        try (Connection con = DBConnect.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public List<Banner> findAllActive() {
        List<Banner> list = new ArrayList<>();
        String sql = "SELECT * FROM banners WHERE is_active = 1 ORDER BY display_order ASC";

        try (Connection con = DBConnect.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Banner banner = mapResultSetToBanner(rs);
                list.add(banner);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Banner findById(int id) {
        String sql = "SELECT * FROM banners WHERE id = ?";

        try (Connection con = DBConnect.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapResultSetToBanner(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public void insert(Banner banner) {
        String sql = "INSERT INTO banners(title, description, image, link, display_order, is_active, created_at) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, banner.getTitle());
            ps.setString(2, banner.getDescription());
            ps.setString(3, banner.getImage());
            ps.setString(4, banner.getLink());
            ps.setInt(5, banner.getDisplayOrder());
            ps.setBoolean(6, banner.isActive());
            ps.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Banner banner) {
        String sql = "UPDATE banners SET title = ?, description = ?, image = ?, link = ?, display_order = ?, is_active = ?, updated_at = ? WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, banner.getTitle());
            ps.setString(2, banner.getDescription());
            ps.setString(3, banner.getImage());
            ps.setString(4, banner.getLink());
            ps.setInt(5, banner.getDisplayOrder());
            ps.setBoolean(6, banner.isActive());
            ps.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
            ps.setInt(8, banner.getId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM banners WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Banner mapResultSetToBanner(ResultSet rs) throws Exception {
        Banner banner = new Banner();
        banner.setId(rs.getInt("id"));
        banner.setTitle(rs.getString("title"));
        banner.setDescription(rs.getString("description"));
        banner.setImage(rs.getString("image"));
        banner.setLink(rs.getString("link"));
        banner.setDisplayOrder(rs.getInt("display_order"));
        banner.setActive(rs.getBoolean("is_active"));
        banner.setCreatedAt(rs.getTimestamp("created_at"));
        banner.setUpdatedAt(rs.getTimestamp("updated_at"));
        return banner;
    }
}
