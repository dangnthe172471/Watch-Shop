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
import model.Category;

/**
 *
 * @author admin
 */
public class CategoryDAO extends DBContext {

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCid(String.valueOf(rs.getInt(1)));
                c.setCname(rs.getString(2));
                c.setType(String.valueOf(rs.getInt(3)));
                c.setDeleted(String.valueOf(rs.getInt(4)));
                list.add(c);
            }
        } catch (SQLException e) {
            //
        }
        return list;
    }

    public List<Category> getCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from category where deleted = 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCid(String.valueOf(rs.getInt(1)));
                c.setCname(rs.getString(2));
                c.setType(String.valueOf(rs.getInt(3)));
                c.setDeleted(String.valueOf(rs.getInt(4)));
                list.add(c);
            }
        } catch (SQLException e) {
            //
        }
        return list;
    }
    
    public List<Category> getCategoryBlock() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from category where deleted = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCid(String.valueOf(rs.getInt(1)));
                c.setCname(rs.getString(2));
                c.setType(String.valueOf(rs.getInt(3)));
                c.setDeleted(String.valueOf(rs.getInt(4)));
                list.add(c);
            }
        } catch (SQLException e) {
            //
        }
        return list;
    }

    public void addCategory(Category c) {
        try {
            String sql = "INSERT INTO [dbo].[Category]([cname],[type],[deleted]) VALUES (?,?,0)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getCname());
            st.setString(2, c.getType());
            st.executeUpdate();
        } catch (Exception e) {
            //
        }
    }

    public void updatecategory(Category c) {
        String sql = "UPDATE [dbo].[Category] SET [cname] = ?,[type] = ?,[deleted] = ? WHERE [cid] =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(4, c.getCid());
            st.setString(1, c.getCname());
            st.setString(2, c.getType());
            st.setString(3, c.getDeleted());
            st.executeUpdate();
        } catch (SQLException e) {
//
        }
    }

    public void blockCategoryById(String cid) {
        String sql = "UPDATE [dbo].[Category] SET [deleted] = 1 WHERE [cid] = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void restoreCategoryById(String cid) {
        String sql = "UPDATE [dbo].[Category] SET [deleted] = 0 WHERE [cid] = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    public Category getCategoryByType(String type) {
        String sql = "select * from category where type = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, type);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Category(
                        rs.getString("cid"),
                        rs.getString("cname"),
                        rs.getString("type"),
                        rs.getString("deleted"));
            }
        } catch (Exception e) {
            //
        }
        return null;
    }

    public Category getCategoryByName(String cname) {
        String sql = "select * from category where cname = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cname);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Category(
                        rs.getString("cid"),
                        rs.getString("cname"),
                        rs.getString("type"),
                        rs.getString("deleted"));
            }
        } catch (Exception e) {
            //
        }
        return null;
    }

    public void deleteDataByCategoryId(String cid) {
        try {
            // Disable auto-commit mode
            connection.setAutoCommit(false);
            System.out.println("Auto-commit disabled.");

            // Step 1: Xóa các bình luận liên quan từ bảng Comment
            String deleteCommentsSQL = "DELETE f FROM Feedback f "
                    + "INNER JOIN product p ON f.pid = p.id "
                    + "INNER JOIN category c ON p.cateID = c.cid "
                    + "WHERE c.cid = ?";

            try (PreparedStatement deleteCommentsStmt = connection.prepareStatement(deleteCommentsSQL)) {
                deleteCommentsStmt.setString(1, cid);
                deleteCommentsStmt.executeUpdate();
                System.out.println("Comments deleted.");
            }

            // Step 2: Xóa các dòng đơn hàng liên quan từ bảng OrderLine
            String deleteOrderLinesSQL = "DELETE od FROM OrderDetail od "
                    + "INNER JOIN product p ON od.pid = p.id "
                    + "INNER JOIN category c ON p.cateID = c.cid  "
                    + "WHERE c.cid = ?";
            try (PreparedStatement deleteOrderLinesStmt = connection.prepareStatement(deleteOrderLinesSQL)) {
                deleteOrderLinesStmt.setString(1, cid);
                deleteOrderLinesStmt.executeUpdate();
                System.out.println("Order lines deleted.");
            }

            // Step 3: Xóa các sản phẩm liên quan từ bảng Product
            String deleteProductsSQL = "DELETE p FROM product p "
                    + "INNER JOIN category c ON p.cateID = c.cid  "
                    + "WHERE c.cid = ?";
            try (PreparedStatement deleteProductsStmt = connection.prepareStatement(deleteProductsSQL)) {
                deleteProductsStmt.setString(1, cid);
                deleteProductsStmt.executeUpdate();
                System.out.println("Products deleted.");
            }

            // Step 4: Xóa các thương hiệu từ bảng Brand
            String deleteBrandsSQL = "DELETE c FROM category c "
                    + "WHERE c.cid = ?";
            try (PreparedStatement deleteBrandsStmt = connection.prepareStatement(deleteBrandsSQL)) {
                deleteBrandsStmt.setString(1, cid);
                deleteBrandsStmt.executeUpdate();
                System.out.println("Category deleted.");
            }

            // Commit the transaction
            connection.commit();
            System.out.println("Transaction committed.");
        } catch (SQLException e) {
            //
        }
    }

}
