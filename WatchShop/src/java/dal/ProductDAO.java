/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Blog;
import model.Category;
import model.Product;

/**
 *
 * @author admin
 */
public class ProductDAO extends DBContext {

    public List<Blog> getAllBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Blog(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

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

    public List<Product> search(int[] cid, String key, Double fromprice, Double toprice, Date fromdate, Date todate, int sort, int index) {
        List<Product> list = new ArrayList<>();
        String sql = """
                       select p.[id]
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
                       where 1=1""";

        if (cid != null && cid[0] != 0) {
            sql += " and p.[cateID] in (";
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (key != null && !key.equals("")) {
            sql += " and (p.[name] like '%" + key + "%')";
        }
        if (fromdate != null) {
            sql += " and p.[releaseDate] >='" + fromdate + "'";
        }
        if (todate != null) {
            sql += " and p.[releaseDate] <='" + todate + "'";
        }
        if (fromprice != null) {
            sql += " and p.[price] >=" + fromprice;
        }
        if (toprice != null) {
            sql += " and p.[price] <=" + toprice;
        }
        if (sort == 0) {
            sql += " \n order by p.[id]";
        }
        if (sort == 1) {
            sql += "\n order by p.[price]";
        }
        if (sort == 2) {
            sql += "\n order by p.[price] desc";
        }
        if (sort == 3) {
            sql += "\n order by p.[rate]";
        }
        if (sort == 4) {
            sql += "\n order by p.[rate] desc";
        }
        if (sort == 5) {
            sql += "\n order by p.[sold]";
        }
        if (sort == 6) {
            sql += "\n order by p.[sold] desc";
        }
        sql += "\nOFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 10);
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

    public int countSearchProduct(int[] cid, String key, Double fromprice, Double toprice, Date fromdate, Date todate) {
        String sql = """
                    SELECT COUNT(*) 
                    from product p inner join category c on (c.cid=p.cateID)
                    where 1=1""";
        if (cid != null && cid[0] != 0) {
            sql += " and p.[cateID] in (";
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (key != null && !key.equals("")) {
            sql += " and (p.[name] like '%" + key + "%')";
        }
        if (fromdate != null) {
            sql += " and p.[releaseDate] >='" + fromdate + "'";
        }
        if (todate != null) {
            sql += " and p.[releaseDate] <='" + todate + "'";
        }
        if (fromprice != null) {
            sql += " and p.[price] >=" + fromprice;
        }
        if (toprice != null) {
            sql += " and p.[price] <=" + toprice;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public Product getProductByID(String id) {
        String sql = """
                       select p.[id]
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
                       where id = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        new Category(rs.getInt(10),
                                rs.getString(11)));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Product> listProductByPid(String pid) {
        List<Product> list = new ArrayList<>();
        String sql = """
                        select top 4 p.[id]
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
                        where cateID = (select (cateID) from Product where id = ? ) AND p.[id] <> ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            st.setString(2, pid);
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
