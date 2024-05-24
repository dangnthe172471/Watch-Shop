/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Brand;

/**
 *
 * @author quyld
 */
public class BrandDAO extends DBContext {

    public List<Brand> getAllBrand() {
        List<Brand> list = new ArrayList<>();

        try {
            String sql = "select * from brand";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBid(String.valueOf(rs.getInt(1)));
                b.setBname(rs.getString(2));
                list.add(b);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addBrand(Brand b) {
        try {
            String sql = "INSERT INTO brand (bname) VALUES (?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, b.getBname());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateBrand(Brand b) {
        String sql = "update brand set bname=? where bid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(2, b.getBid());
            st.setString(1, b.getBname());
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public Brand getBrandByName(String bname) {
        String sql = "select * from brand where bname = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bname);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Brand(
                        rs.getString("bid"),
                        rs.getString("bname"));
            }
        } catch (Exception e) {
            System.out.println("in ra lỗi đê" + e.getMessage());
        }
        return null;
    }

    public void deleteDataByBrandName(String bid) {
         String sql = """
                   delete from [Brand] where bid = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

//    public static void main(String[] args) {
//        // Tạo một đối tượng DAO để truy cập CSDL
//        BrandDAO b = new BrandDAO();
//
//        // Gọi phương thức getAllC() để lấy danh sách tất cả các danh mục
//        List<Brand> list = b.getAllBrand();
//
//        // Hiển thị thông tin của từng danh mục
//        for (Brand brand : list) {
//            System.out.println("Category ID: " + brand.getBid());
//            System.out.println("Category Name: " + brand.getBname());
//            System.out.println("------------------------");
//        }
//    }
}
