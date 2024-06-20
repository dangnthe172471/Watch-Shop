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
                b.setImage(rs.getString(3));
                b.setDescription(rs.getString(4));
                b.setDeleted(String.valueOf(rs.getInt(5)));
                list.add(b);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Brand> getBrand() {
        List<Brand> list = new ArrayList<>();

        try {
            String sql = "select * from brand where deleted = 0";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBid(String.valueOf(rs.getInt(1)));
                b.setBname(rs.getString(2));
                b.setImage(rs.getString(3));
                b.setDescription(rs.getString(4));
                b.setDeleted(String.valueOf(rs.getInt(5)));
                list.add(b);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Brand> getBrandBlock() {
        List<Brand> list = new ArrayList<>();

        try {
            String sql = "select * from brand where deleted = 1";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBid(String.valueOf(rs.getInt(1)));
                b.setBname(rs.getString(2));
                b.setImage(rs.getString(3));
                b.setDescription(rs.getString(4));
                b.setDeleted(String.valueOf(rs.getInt(5)));
                list.add(b);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addBrand(Brand b) {
        try {
            String sql = "INSERT INTO brand (bname, image, description, deleted) VALUES (?,?,?,'0')";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, b.getBname());
            st.setString(2, b.getImage());
            st.setString(3, b.getDescription());
            st.executeUpdate();
        } catch (Exception e) {
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
                        rs.getString("bname"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getString("deleted"));
            }
        } catch (Exception e) {
            ///
        }
        return null;
    }

    public void blockBrandById(String bid) {
        String sql = "UPDATE [dbo].[brand] SET [deleted] = 1 WHERE [bid] = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void restoreBrandById(String bid) {
        String sql = "UPDATE [dbo].[brand] SET [deleted] = 0 WHERE [bid] = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateBrand(Brand b) {
        String sql = "UPDATE [dbo].[brand] SET [bname] = ?, [image]=?, [description]=? WHERE [bid]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, b.getBname());
            st.setString(2, b.getImage());
            st.setString(3, b.getDescription());
            st.setString(4, b.getBid());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteDataByBrandId(String bid) {
        try {
            // Disable auto-commit mode
            connection.setAutoCommit(false);
            System.out.println("Auto-commit disabled.");

            // Step 1: Xóa các bình luận liên quan từ bảng Comment
            String deleteCommentsSQL = "DELETE f FROM [dbo].[Feedback] f "
                    + "INNER JOIN [dbo].[product] p ON f.pid = p.id "
                    + "INNER JOIN [dbo].[brand] b ON p.brandID = b.bid "
                    + "WHERE b.bid = ?";

            try (PreparedStatement deleteCommentsStmt = connection.prepareStatement(deleteCommentsSQL)) {
                deleteCommentsStmt.setString(1, bid);
                deleteCommentsStmt.executeUpdate();
                System.out.println("Comments deleted.");
            }

            // Step 2: Xóa các dòng đơn hàng liên quan từ bảng OrderLine
            String deleteOrderLinesSQL = "DELETE od FROM [dbo].[OrderDetail] od "
                    + "INNER JOIN [dbo].[product] p ON od.pid = p.id "
                    + "INNER JOIN [dbo].[brand] b ON p.brandID = b.bid "
                    + "WHERE b.bid = ?";
            try (PreparedStatement deleteOrderLinesStmt = connection.prepareStatement(deleteOrderLinesSQL)) {
                deleteOrderLinesStmt.setString(1, bid);
                deleteOrderLinesStmt.executeUpdate();
                System.out.println("Order lines deleted.");
            }

            // Step 3: Xóa các sản phẩm liên quan từ bảng Product
            String deleteProductsSQL = "DELETE p FROM [dbo].[product] p "
                    + "INNER JOIN [dbo].[brand] b ON p.brandID = b.bid "
                    + "WHERE b.bid = ?";
            try (PreparedStatement deleteProductsStmt = connection.prepareStatement(deleteProductsSQL)) {
                deleteProductsStmt.setString(1, bid);
                deleteProductsStmt.executeUpdate();
                System.out.println("Products deleted.");
            }

            // Step 4: Xóa các thương hiệu từ bảng Brand
            String deleteBrandsSQL = "DELETE b FROM [dbo].[brand] b "
                    + "WHERE b.bid = ?";
            try (PreparedStatement deleteBrandsStmt = connection.prepareStatement(deleteBrandsSQL)) {
                deleteBrandsStmt.setString(1, bid);
                deleteBrandsStmt.executeUpdate();
                System.out.println("Brand deleted.");
            }

            // Commit the transaction
            connection.commit();
            System.out.println("Transaction committed.");
        } catch (SQLException e) {
            //
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
