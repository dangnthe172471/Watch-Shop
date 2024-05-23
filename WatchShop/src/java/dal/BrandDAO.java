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
            String sql = "INSERT INTO brand (bid,bname) VALUES (?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, b.getBid());
            st.setString(2, b.getBname());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
//    public boolean updateBrand(String bname){
//        String sql = "update brand set bname=? where bid=?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, bname);
//            st.setString(2, sql);
//            int update = st.executeUpdate();
//            if(update>0){
//                System.out.println("thanh cong"+bname);
//                return true;
//            }else{
//                System.out.println("looix"+ bname);
//                return false;
//            }
//            
//        } catch (SQLException e) {
//            System.out.println("loiu"+bname);
//            return false;
//        }
//        
//    }

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
//                Brand b = new Brand();
//                b.setBid(rs.getString(1));
//                b.setBname(rs.getString(2));
//                return b;
            }
        } catch (Exception e) {
            System.out.println("in ra lỗi đê" + e.getMessage());
        }
        return null;
    }
//    public Brand checkBrand(String name){
//        String sql = "select * from brand where bname = ?";
//        try {
//            PreparedStatement st  = connection.prepareStatement(sql);
//            st.setString(2, name);
//            ResultSet rs = st.executeQuery();
//            if(rs.next()){
//                Brand b = new Brand();
//                
//            }
//        } catch (Exception e) {
//        }
//    }

    public void deleteDataByBrandName(String bname) {
        try {
            // Disable auto-commit mode
            connection.setAutoCommit(false);

            // Step 1: Xóa các bình luận liên quan từ bảng Comment
            String deleteCommentsSQL = "DELETE m FROM Comment m "
                    + "INNER JOIN product p ON m.pid = p.id "
                    + "INNER JOIN brand b ON p.brandID = b.bid "
                    + "WHERE b.bname = ?";
            try (PreparedStatement deleteCommentsStmt = connection.prepareStatement(deleteCommentsSQL)) {
                deleteCommentsStmt.setString(1, bname);
                deleteCommentsStmt.executeUpdate();
            }

            // Step 2: Xóa các dòng đơn hàng liên quan từ bảng OrderLine
            String deleteOrderLinesSQL = "DELETE ol FROM OrderLine ol "
                    + "INNER JOIN product p ON ol.pid = p.id "
                    + "INNER JOIN brand b ON p.brandID = b.bid "
                    + "WHERE b.bname = ?";
            try (PreparedStatement deleteOrderLinesStmt = connection.prepareStatement(deleteOrderLinesSQL)) {
                deleteOrderLinesStmt.setString(1, bname);
                deleteOrderLinesStmt.executeUpdate();
            }

            // Step 3: Xóa các sản phẩm liên quan từ bảng Product
            String deleteProductsSQL = "DELETE p FROM product p "
                    + "INNER JOIN brand b ON p.brandID = b.bid "
                    + "WHERE b.bname = ?";
            try (PreparedStatement deleteProductsStmt = connection.prepareStatement(deleteProductsSQL)) {
                deleteProductsStmt.setString(1, bname);
                deleteProductsStmt.executeUpdate();
            }

            // Step 4: Xóa các thương hiệu từ bảng Brand
            String deleteBrandsSQL = "DELETE b FROM brand b "
                    + "WHERE b.bname = ?";
            try (PreparedStatement deleteBrandsStmt = connection.prepareStatement(deleteBrandsSQL)) {
                deleteBrandsStmt.setString(1, bname);
                deleteBrandsStmt.executeUpdate();
            }

            // Commit the transaction
            connection.commit();
            System.out.println("Data related to '" + bname + "' deleted successfully.");
        } catch (SQLException e) {
            try {
                connection.rollback();  // Rollback the transaction if any error occurs
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
            System.out.println("An error occurred while deleting data: " + e.getMessage());
        } finally {
            try {
                connection.setAutoCommit(true);  // Re-enable auto-commit mode
            } catch (SQLException finalEx) {
                finalEx.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        // Tạo một đối tượng DAO để truy cập CSDL
        BrandDAO b = new BrandDAO();

        // Gọi phương thức getAllC() để lấy danh sách tất cả các danh mục
        List<Brand> list = b.getAllBrand();

        // Hiển thị thông tin của từng danh mục
        for (Brand brand : list) {
            System.out.println("Category ID: " + brand.getBid());
            System.out.println("Category Name: " + brand.getBname());
            System.out.println("------------------------");
        }
    }
}
