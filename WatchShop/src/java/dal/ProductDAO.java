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
import model.Product;
import model.ImageProduct;

/**
 *
 * @author admin
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = """
                        select *
                        from product p inner join ImageProduct [pi] on(p.id=[pi].[pid])
                        inner join brand b on (b.bid=p.brandID)
                        inner join category c1 on (c1.cid=p.cateID1)
                        inner join category c2 on (c2.cid=p.cateID2)
                        inner join category c3 on (c3.cid=p.cateID3)""";
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
                                rs.getString(20))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> listProductLast() {
        List<Product> list = new ArrayList<>();
        String sql = """
                        select top 5 *
                        from product p inner join ImageProduct [pi] on(p.id=[pi].[pid])
                        inner join brand b on (b.bid=p.brandID)
                        inner join category c1 on (c1.cid=p.cateID1)
                        inner join category c2 on (c2.cid=p.cateID2)
                        inner join category c3 on (c3.cid=p.cateID3)
                        where b.deleted=0 AND (c1.deleted = 0 AND c2.deleted = 0 AND c3.deleted = 0)
                        and p.[status]=0
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
                                rs.getString(20))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> listProductBySold() {
        List<Product> list = new ArrayList<>();
        String sql = """
                      select top 5 *
                       from product p inner join ImageProduct [pi] on(p.id=[pi].[pid])
                       inner join brand b on (b.bid=p.brandID)
                       inner join category c1 on (c1.cid=p.cateID1)
                       inner join category c2 on (c2.cid=p.cateID2)
                       inner join category c3 on (c3.cid=p.cateID3)
                       where b.deleted=0 AND (c1.deleted = 0 AND c2.deleted = 0 AND c3.deleted = 0)
                       and p.[status]=0
                       order by sold desc""";
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
                                rs.getString(20))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> listProductByPrice() {
        List<Product> list = new ArrayList<>();
        String sql = """
                       select top 5 *
                       from product p inner join ImageProduct [pi] on(p.id=[pi].[pid])
                       inner join brand b on (b.bid=p.brandID)
                       inner join category c1 on (c1.cid=p.cateID1)
                       inner join category c2 on (c2.cid=p.cateID2)
                       inner join category c3 on (c3.cid=p.cateID3)
                       where b.deleted=0 AND (c1.deleted = 0 AND c2.deleted = 0 AND c3.deleted = 0)
                       and p.[status]=0
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
                                rs.getString(20))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> search(int[] bid, int[] cid1, int[] cid2, int[] cid3, String key, Double fromprice, Double toprice, Date fromdate, Date todate, int sort, int index) {
        List<Product> list = new ArrayList<>();
        String sql = """
                       select *
                       from product p inner join ImageProduct [pi] on(p.id=[pi].[pid])
                       inner join brand b on (b.bid=p.brandID)
                       inner join category c1 on (c1.cid=p.cateID1)
                       inner join category c2 on (c2.cid=p.cateID2)
                       inner join category c3 on (c3.cid=p.cateID3)
                       where b.deleted=0 AND (c1.deleted = 0 AND c2.deleted = 0 AND c3.deleted = 0)
                       and p.[status]=0 """;

        if (bid != null && bid[0] != 0) {
            sql += " and p.[brandID] in (";
            for (int i = 0; i < bid.length; i++) {
                sql += bid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (cid1 != null && cid1[0] != 0) {
            sql += " and p.[cateID1] in (";
            for (int i = 0; i < cid1.length; i++) {
                sql += cid1[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (cid2 != null && cid2[0] != 0) {
            sql += " and p.[cateID2] in (";
            for (int i = 0; i < cid2.length; i++) {
                sql += cid2[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (cid3 != null && cid3[0] != 0) {
            sql += " and p.[cateID3] in (";
            for (int i = 0; i < cid3.length; i++) {
                sql += cid3[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (key != null) {
            sql += " and ( p.[code] like N'%" + key + "%' or p.[name]  like N'%" + key + "%' )";
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
        sql += "\nOFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 9);
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
                                rs.getString(20))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int countSearchProduct(int[] bid, int[] cid1, int[] cid2, int[] cid3, String key, Double fromprice, Double toprice, Date fromdate, Date todate) {
        String sql = """
                    SELECT COUNT(*) 
                    from product p inner join ImageProduct [pi] on(p.id=[pi].[pid])
                    inner join brand b on (b.bid=p.brandID)
                    inner join category c1 on (c1.cid=p.cateID1)
                    inner join category c2 on (c2.cid=p.cateID2)
                    inner join category c3 on (c3.cid=p.cateID3)
                    where b.deleted=0 AND (c1.deleted = 0 AND c2.deleted = 0 AND c3.deleted = 0)
                    and p.[status]=0""";
        if (bid != null && bid[0] != 0) {
            sql += " and p.[brandID] in (";
            for (int i = 0; i < bid.length; i++) {
                sql += bid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (cid1 != null && cid1[0] != 0) {
            sql += " and p.[cateID1] in (";
            for (int i = 0; i < cid1.length; i++) {
                sql += cid1[i] + ",";
            }

            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (cid2 != null && cid2[0] != 0) {
            sql += " and p.[cateID2] in (";
            for (int i = 0; i < cid2.length; i++) {
                sql += cid2[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (cid3 != null && cid3[0] != 0) {
            sql += " and p.[cateID3] in (";
            for (int i = 0; i < cid3.length; i++) {
                sql += cid3[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (key != null) {
            sql += " and ( p.[code] like N'%" + key + "%' or p.[name]  like N'%" + key + "%' )";
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
                       select *
                       from product p inner join ImageProduct [pi] on(p.id=[pi].[pid])
                       inner join brand b on (b.bid=p.brandID)
                       inner join category c1 on (c1.cid=p.cateID1)
                       inner join category c2 on (c2.cid=p.cateID2)
                       inner join category c3 on (c3.cid=p.cateID3)
                       where b.deleted=0 AND (c1.deleted = 0 AND c2.deleted = 0 AND c3.deleted = 0)
                       and p.[status]=0 and p.id = ?""";
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

    public List<Product> listProductByPid(String pid) {
        List<Product> list = new ArrayList<>();
        String sql = """
                    select top 4 *
                        from product p inner join ImageProduct [pi] on(p.id=[pi].[pid])
                        inner join brand b on (b.bid=p.brandID)
                        inner join category c1 on (c1.cid=p.cateID1)
                        inner join category c2 on (c2.cid=p.cateID2)
                        inner join category c3 on (c3.cid=p.cateID3)
                        where b.deleted=0 AND (c1.deleted = 0 AND c2.deleted = 0 AND c3.deleted = 0)
                        and p.[status]=0
                        and ( BrandID = (select (BrandID) from Product where id = ? ) 
                        Or cateID1 = (select (cateID1) from Product where id = ? )
                        Or cateID2 = (select (cateID2) from Product where id = ? )
                        Or cateID3 = (select (cateID3) from Product where id = ? ))
                        and p.[status]=0 and p.[id] != ?                        
                        Order by sold desc
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            st.setString(2, pid);
            st.setString(3, pid);
            st.setString(4, pid);
            st.setString(5, pid);
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
                                rs.getString(20))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> manageProduct(int[] bid, int[] cid1, int[] cid2, int[] cid3, String key, int sort, int index, Date fromdate, Date todate) {
        List<Product> list = new ArrayList<>();
        String sql = """
                        select *
                        from product p inner join ImageProduct [pi] on(p.id=[pi].[pid])
                        inner join brand b on (b.bid=p.brandID)
                        inner join category c1 on (c1.cid=p.cateID1)
                        inner join category c2 on (c2.cid=p.cateID2)
                        inner join category c3 on (c3.cid=p.cateID3)
                        where p.[status]=0
                     """;
        if (bid != null && bid[0] != 0) {
            sql += " and p.[brandID] in (";
            for (int i = 0; i < bid.length; i++) {
                sql += bid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (cid1 != null && cid1[0] != 0) {
            sql += " and p.[cateID1] in (";
            for (int i = 0; i < cid1.length; i++) {
                sql += cid1[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (cid2 != null && cid2[0] != 0) {
            sql += " and p.[cateID2] in (";
            for (int i = 0; i < cid2.length; i++) {
                sql += cid2[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (cid3 != null && cid3[0] != 0) {
            sql += " and p.[cateID3] in (";
            for (int i = 0; i < cid3.length; i++) {
                sql += cid3[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (key != null) {
            sql += " and ( p.[code] like N'%" + key + "%' or p.[name]  like N'%" + key + "%' )";
        }
        if (fromdate != null) {
            sql += " and p.[releaseDate] >='" + fromdate + "'";
        }
        if (todate != null) {
            sql += " and p.[releaseDate] <='" + todate + "'";
        }
        if (sort == 0) {
            sql += " \n order by p.[id]";
        }
        if (sort == 1) {
            sql += "\n order by p.[code]";
        }
        if (sort == 2) {
            sql += "\n order by p.[code] desc";
        }
        if (sort == 3) {
            sql += "\n order by p.[name]";
        }
        if (sort == 4) {
            sql += "\n order by p.[name] desc";
        }
        if (sort == 5) {
            sql += "\n order by p.[price]";
        }
        if (sort == 6) {
            sql += "\n order by p.[price] desc";
        }
        if (sort == 7) {
            sql += "\n order by p.[quantity]";
        }
        if (sort == 8) {
            sql += "\n order by p.[quantity] desc";
        }
        if (sort == 9) {
            sql += "\n order by p.[sold]";
        }
        if (sort == 10) {
            sql += "\n order by p.[sold] desc";
        }
        if (sort == 11) {
            sql += "\n order by p.[releaseDate]";
        }
        if (sort == 12) {
            sql += "\n order by p.[releaseDate] desc";
        }
        sql += "\nOFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 6);
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
                                rs.getString(20))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int countManageProduct(int[] bid, int[] cid1, int[] cid2, int[] cid3, String key, Date fromdate, Date todate) {
        String sql = """
                    SELECT COUNT(*) 
                    from product p inner join ImageProduct [pi] on(p.id=[pi].[pid])
                    inner join brand b on (b.bid=p.brandID)
                    inner join category c1 on (c1.cid=p.cateID1)
                    inner join category c2 on (c2.cid=p.cateID2)
                    inner join category c3 on (c3.cid=p.cateID3)
                    where p.[status]=0""";

        if (bid != null && bid[0] != 0) {
            sql += " and p.[brandID] in (";
            for (int i = 0; i < bid.length; i++) {
                sql += bid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (cid1 != null && cid1[0] != 0) {
            sql += " and p.[cateID1] in (";
            for (int i = 0; i < cid1.length; i++) {
                sql += cid1[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (cid2 != null && cid2[0] != 0) {
            sql += " and p.[cateID2] in (";
            for (int i = 0; i < cid2.length; i++) {
                sql += cid2[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (cid3 != null && cid3[0] != 0) {
            sql += " and p.[cateID3] in (";
            for (int i = 0; i < cid3.length; i++) {
                sql += cid3[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (key != null) {
            sql += " and ( p.[code] like N'%" + key + "%' or p.[name]  like N'%" + key + "%' )";
        }
        if (fromdate != null) {
            sql += " and p.[releaseDate] >='" + fromdate + "'";
        }
        if (todate != null) {
            sql += " and p.[releaseDate] <='" + todate + "'";
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

    public void deleteProduct(String pid, String status) {
        String sql = "UPDATE [dbo].[product] SET [status] = ? WHERE [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setString(2, pid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editProduct(String id, String code, String name, String price, String quantity, String sold, String date, String description,
            String rate, String cateID1, String cateID2, String cateID3, String brandID, String img1, String img2, String img3, String img4) {
        String sql = """
                    UPDATE [dbo].[product]
                    SET [code] = ?
                        ,[name] = ?
                        ,[price] = ?
                        ,[quantity] = ?
                        ,[sold] = ?
                        ,[releaseDate] = ?
                        ,[description] = ?
                        ,[rate] = ?
                        ,[cateID1] = ?
                        ,[cateID2] = ?
                        ,[cateID3] = ?
                        ,[brandID] = ?
                        WHERE [id] = ? 
                    UPDATE [dbo].[ImageProduct]
                    SET [image1] = ?
                        ,[image2] = ?
                        ,[image3] = ?
                        ,[image4] = ?
                        WHERE [pid] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            st.setString(2, name);
            st.setString(3, price);
            st.setString(4, quantity);
            st.setString(5, sold);
            st.setString(6, date);
            st.setString(7, description);
            st.setString(8, rate);
            st.setString(9, cateID1);
            st.setString(10, cateID2);
            st.setString(11, cateID3);
            st.setString(12, brandID);
            st.setString(13, id);
            st.setString(14, img1);
            st.setString(15, img2);
            st.setString(16, img3);
            st.setString(17, img4);
            st.setString(18, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addProduct(String code, String name, String price, String quantity, String sold, String date, String description,
            String rate, String cateID1, String cateID2, String cateID3, String brandID, String img1, String img2, String img3, String img4) {
        String sql = """
                     INSERT INTO [dbo].[product]([code],[name],[price],[quantity],[sold],[releaseDate],[description],[rate],[cateID1],[cateID2],[cateID3],[brandID],[status])VALUES
                     (?,?,?,?,?,?,?,?,?,?,?,?,'0') """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            st.setString(2, name);
            st.setString(3, price);
            st.setString(4, quantity);
            st.setString(5, sold);
            st.setString(6, date);
            st.setString(7, description);
            st.setString(8, rate);
            st.setString(9, cateID1);
            st.setString(10, cateID2);
            st.setString(11, cateID3);
            st.setString(12, brandID);
            st.executeUpdate();
        } catch (Exception e) {
        }
        String sql2 = """                    
                     INSERT INTO [dbo].[ImageProduct]([pid],[image1],[image2],[image3],[image4])
                     VALUES((select top 1 id from product order by id desc),?,?,?,?) """;
        try {
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setString(1, img1);
            st2.setString(2, img2);
            st2.setString(3, img3);
            st2.setString(4, img4);
            st2.executeUpdate();
        } catch (Exception e) {
        }
    }
}
