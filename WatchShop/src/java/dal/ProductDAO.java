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
import model.Product;

/**
 *
 * @author admin
 */
public class ProductDAO extends DBContext {

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> listProductLast() {
        List<Product> list = new ArrayList<>();
        String sql = """
                        select top 5 p.[id]
                        ,p.[name]
                        ,p.[image]
                        ,p.[price]
                        ,p.[quantity]
                        ,p.[sold]
                        ,p.[releaseDate]
                        ,p.[description]
                        ,p.[rate]
                        ,c.[cid]
                        ,c.[cname]
                        from product p inner join category c on (c.cid=p.cateID)
                        order by releaseDate desc""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        new Category(rs.getInt(10),
                                rs.getString(11))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> listProductBySold() {
        List<Product> list = new ArrayList<>();
        String sql = """
                       select top 5 p.[id]
                                    ,p.[name]
                                    ,p.[image]
                                    ,p.[price]
                                    ,p.[quantity]
                                    ,p.[sold]
                                    ,p.[releaseDate]
                                    ,p.[description]
                                    ,p.[rate]
                                    ,c.[cid]
                                    ,c.[cname]
                                    from product p inner join category c on (c.cid=p.cateID)
                                    order by sold""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        new Category(rs.getInt(10),
                                rs.getString(11))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> listProductByPrice() {
        List<Product> list = new ArrayList<>();
        String sql = """
                       select top 5 p.[id]
                       ,p.[name]
                       ,p.[image]
                       ,p.[price]
                       ,p.[quantity]
                       ,p.[sold]
                       ,p.[releaseDate]
                       ,p.[description]
                       ,p.[rate]
                       ,c.[cid]
                       ,c.[cname]
                       from product p inner join category c on (c.cid=p.cateID)
                       order by price""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        new Category(rs.getInt(10),
                                rs.getString(11))));
            }
        } catch (SQLException e) {
        }
        return list;
    }
}
