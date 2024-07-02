/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.ImageProduct;
import model.Order;
import model.OrderDetail;
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

    public int getMinYearOrder() {
        String sql = "SELECT YEAR(MIN(date)) FROM [Order] where sid = 4";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int getTotalByYear(int year) {
        String sql = "select sum (totalMoney) from [Order] where year(date) = ? and sid = 4";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int getSumByBrandID(int bid) {
        String sql = """
                     select sum(sold) from product 
                     where brandID=?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Account> getTopTN() {
        List<Account> list = new ArrayList<>();
        String sql = """
                     SELECT TOP 3 *
                     FROM [Account] 
                     Where [roleID] =4
                     order by bought desc""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "Select * from [Order] o "
                + "inner join Account a on (a.[id]=o.[aid])"
                + "Where [sid] =4";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12),
                        new Account(rs.getInt(13),
                                rs.getString(14),
                                rs.getString(15),
                                rs.getString(16),
                                rs.getString(17),
                                rs.getString(18),
                                rs.getDouble(19),
                                rs.getInt(20),
                                rs.getString(21),
                                rs.getInt(22),
                                rs.getInt(23),
                                rs.getString(24))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<OrderDetail> getAllOrderDetail() {
        List<OrderDetail> list = new ArrayList<>();
        String sql = """
                     select * FROM OrderDetail od
                     INNER JOIN [Order] o ON o.id = od.oid
                     INNER JOIN [Account] a ON a.id = o.aid
                     INNER JOIN (Product p inner join ImageProduct [ip] on [ip].pid=p.id) ON p.id = od.pid""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(
                        rs.getInt(3),
                        rs.getDouble(4),
                        new Order(rs.getInt(5),
                                rs.getString(7),
                                rs.getString(8),
                                rs.getString(9),
                                rs.getString(10),
                                rs.getDouble(11),
                                rs.getString(12),
                                rs.getString(13),
                                rs.getString(14),
                                rs.getString(15),
                                rs.getInt(16),
                                new Account(rs.getInt(17),
                                        rs.getString(18),
                                        rs.getString(19),
                                        rs.getString(20),
                                        rs.getString(21),
                                        rs.getString(22),
                                        rs.getDouble(23),
                                        rs.getInt(24),
                                        rs.getString(25),
                                        rs.getInt(26),
                                        rs.getInt(27),
                                        rs.getString(28))),
                        new Product(rs.getInt(29),
                                rs.getString(30),
                                rs.getString(31),
                                rs.getDouble(32),
                                rs.getInt(33),
                                rs.getInt(34),
                                rs.getDate(35),
                                rs.getString(36),
                                rs.getDouble(37),
                                rs.getInt(38),
                                rs.getInt(39),
                                rs.getInt(40),
                                rs.getInt(41),
                                rs.getInt(42),
                                new ImageProduct(rs.getInt(43),
                                        rs.getInt(44),
                                        rs.getString(45),
                                        rs.getString(46),
                                        rs.getString(47),
                                        rs.getString(48)))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getTotalByMonth(int month, int year) {
        String sql = "select sum (totalMoney) from [Order] where MONTH(date)=? and year(date) = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, month);
            st.setInt(2, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }
    
    public List<OrderDetail> getOrderDetailByYear(int year) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = """
                     select * FROM OrderDetail od
                     INNER JOIN [Order] o ON o.id = od.oid
                     INNER JOIN [Account] a ON a.id = o.aid
                     INNER JOIN (Product p inner join ImageProduct [ip] on [ip].pid=p.id) ON p.id = od.pid
                     Where year(date) = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(
                        rs.getInt(3),
                        rs.getDouble(4),
                        new Order(rs.getInt(5),
                                rs.getString(7),
                                rs.getString(8),
                                rs.getString(9),
                                rs.getString(10),
                                rs.getDouble(11),
                                rs.getString(12),
                                rs.getString(13),
                                rs.getString(14),
                                rs.getString(15),
                                rs.getInt(16),
                                new Account(rs.getInt(17),
                                        rs.getString(18),
                                        rs.getString(19),
                                        rs.getString(20),
                                        rs.getString(21),
                                        rs.getString(22),
                                        rs.getDouble(23),
                                        rs.getInt(24),
                                        rs.getString(25),
                                        rs.getInt(26),
                                        rs.getInt(27),
                                        rs.getString(28))),
                        new Product(rs.getInt(29),
                                rs.getString(30),
                                rs.getString(31),
                                rs.getDouble(32),
                                rs.getInt(33),
                                rs.getInt(34),
                                rs.getDate(35),
                                rs.getString(36),
                                rs.getDouble(37),
                                rs.getInt(38),
                                rs.getInt(39),
                                rs.getInt(40),
                                rs.getInt(41),
                                rs.getInt(42),
                                new ImageProduct(rs.getInt(43),
                                        rs.getInt(44),
                                        rs.getString(45),
                                        rs.getString(46),
                                        rs.getString(47),
                                        rs.getString(48)))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static void main(String[] args) {
        StatisticalDAO sdao = new StatisticalDAO();
        BrandDAO bdao = new BrandDAO();
        int minYear = sdao.getMinYearOrder();

        LocalDate currentDate = LocalDate.now();

        // Lấy năm hiện tại
        int maxYear = currentDate.getYear();

        int[] year = new int[maxYear*12 - minYear*12 + 1];

        for (int i = 1; i <= 12; i++) {
            year[i - 1] = sdao.getTotalByMonth(i, 2021);
        }
    }
}
