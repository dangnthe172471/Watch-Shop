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

    /**
     * get list 5 new product
     *
     * @return list new product
     */
    public List<Product> listProductLast() {
        List<Product> list = new ArrayList<>();
        String sql = """
                        select top 5 *
                        from product p inner join ImageProduct [pi] on(p.id=[pi].[pid])
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
                        new ImageProduct(rs.getInt(14),
                                rs.getInt(15),
                                rs.getString(16),
                                rs.getString(17),
                                rs.getString(18))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    /**
     * get list 5 product by sold
     *
     * @return list product by sold
     */
    public List<Product> listProductBySold() {
        List<Product> list = new ArrayList<>();
        String sql = """
                       select top 5 *
                       from product p inner join ImageProduct [pi] on(p.id=[pi].[pid]) 
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
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        new ImageProduct(rs.getInt(14),
                                rs.getInt(15),
                                rs.getString(16),
                                rs.getString(17),
                                rs.getString(18))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    /**
     * get list5 product by price
     *
     * @return list product by price
     */
    public List<Product> listProductByPrice() {
        List<Product> list = new ArrayList<>();
        String sql = """
                       select top 5 *
                       from product p inner join ImageProduct [pi] on(p.id=[pi].[pid])
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
                        new ImageProduct(rs.getInt(14),
                                rs.getInt(15),
                                rs.getString(16),
                                rs.getString(17),
                                rs.getString(18))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    /**
     * search for a product by its attributes
     *
     * @param bid is brandID of product
     * @param cid is CategoryID of product
     * @param key is keyword for search
     * @param fromprice is min price
     * @param toprice is max price
     * @param fromdate is from date
     * @param todate is to date
     * @param sort is sort its attributes
     * @param index is paging
     * @return list product after
     */
    public List<Product> search(int[] bid, int[] cid, String key, Double fromprice, Double toprice, Date fromdate, Date todate, int sort, int index) {
        List<Product> list = new ArrayList<>();
        String sql = """
                       select *
                       from product p inner join ImageProduct [pi] on(p.id=[pi].[pid])
                       where 1=1""";

        // if array is not null and first values is not 0
        if (bid != null && bid[0] != 0) {
            sql += " and p.[brandID] in (";

            // add values of array bid to string sql
            for (int i = 0; i < bid.length; i++) {
                sql += bid[i] + ",";
            }

            // remove ',' end
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }

        // if array is not null and first values is not 0
        if (cid != null && cid[0] != 0) {
            sql += " and ( p.[cateID1] in (";
            // add values of array bid to string sql
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            // remove ',' end
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";

            sql += " OR p.[cateID2] in (";
            // add values of array bid to string sql
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            // remove ',' end
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";

            sql += " OR p.[cateID3] in (";
            // add values of array bid to string sql
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            // remove ',' end
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ") )";
        }

        // if attributes is not null add attributes to string sql
        if (key != null) {
            sql += " and ( p.[code] like '%" + key + "%' or p.[name]  like '%" + key + "%' )";
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
                        new ImageProduct(rs.getInt(14),
                                rs.getInt(15),
                                rs.getString(16),
                                rs.getString(17),
                                rs.getString(18))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    /**
     * count number of products after searching
     *
     * @param bid is brandID of product
     * @param cid is CategoryID of product
     * @param key is keyword for search
     * @param fromprice is min price
     * @param toprice is max price
     * @param fromdate is from date
     * @param todate is to date
     * @return Number of products after searching
     */
    public int countSearchProduct(int[] bid, int[] cid, String key, Double fromprice, Double toprice, Date fromdate, Date todate) {
        String sql = """
                    SELECT COUNT(*) 
                    from product p
                    where 1=1""";

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

    /**
     * get product by id
     *
     * @param id is ID of product
     * @return product
     */
    public Product getProductByID(String id) {
        String sql = """
                       select *
                       from product p inner join ImageProduct [pi] on(p.id=[pi].[pid])
                       where p.id = ?""";
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
                        new ImageProduct(rs.getInt(14),
                                rs.getInt(15),
                                rs.getString(16),
                                rs.getString(17),
                                rs.getString(18)));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    /**
     * get list top 4 product by product ID
     *
     * @param pid is id of product
     * @return list product by product ID
     */
    public static void main(String[] args) {
        ProductDAO pd = new ProductDAO();
        List<Product> p = pd.listProductByPid("6");
        for (Product product : p) {
            System.out.println(product);
        }
    }

    public List<Product> listProductByPid(String pid) {
        List<Product> list = new ArrayList<>();
        String sql = """
                        select top 4 *
                        from product p inner join ImageProduct [pi] on(p.id=[pi].[pid])
                        where BrandID = (select (BrandID) from Product where id = ? ) AND p.[id] <> ?""";
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
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        new ImageProduct(rs.getInt(14),
                                rs.getInt(15),
                                rs.getString(16),
                                rs.getString(17),
                                rs.getString(18))));
            }
        } catch (SQLException e) {
        }
        return list;
    }
}
