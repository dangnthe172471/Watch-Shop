/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.ImageProduct;
import model.Product;

/**
 *
 * @author admin
 */
public class StatisticalDAO extends DBContext {

    public int countAccount() {
        String sql = "SELECT COUNT(*) FROM Account where roleID = 4";
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

    public int countOrder() {
        String sql = "SELECT COUNT(*) FROM [Order] where sid = 4";
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

    public int totalMoney() {
        String sql = "SELECT SUM(totalMoney) FROM [Order] where sid = 4";
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

    public Product getMax() {
        String sql = """
                    select top 1 *
                    from product p inner join ImageProduct [ip]  on (p.id=[ip].pid)       
                    inner join brand b on (b.bid=p.brandID)
                    inner join category c1 on (c1.cid=p.cateID1)
                    inner join category c2 on (c2.cid=p.cateID2)
                    inner join category c3 on (c3.cid=p.cateID3)
                    where b.deleted=0 AND (c1.deleted = 0 AND c2.deleted = 0 AND c3.deleted = 0)
                    and p.[status]=0
                    and sold = (SELECT MAX(sold) FROM product)
                    order by rate desc""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
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
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        new ImageProduct(rs.getInt(15),
                                rs.getInt(16),
                                rs.getString(17),
                                rs.getString(18),
                                rs.getString(19),
                                rs.getString(20)));
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public Product getMin() {
        String sql = """
                    select top 1 *
                    from product p inner join ImageProduct [ip]  on (p.id=[ip].pid)       
                    inner join brand b on (b.bid=p.brandID)
                    inner join category c1 on (c1.cid=p.cateID1)
                    inner join category c2 on (c2.cid=p.cateID2)
                    inner join category c3 on (c3.cid=p.cateID3)
                    where b.deleted=0 AND (c1.deleted = 0 AND c2.deleted = 0 AND c3.deleted = 0)
                    and p.[status]=0
                    and sold = (SELECT Min(sold) FROM product)
                    order by rate""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
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
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        new ImageProduct(rs.getInt(15),
                                rs.getInt(16),
                                rs.getString(17),
                                rs.getString(18),
                                rs.getString(19),
                                rs.getString(20)));
            }
        } catch (SQLException e) {
        }
        return null;
    }
}
