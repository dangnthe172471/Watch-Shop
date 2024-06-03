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
import model.Account;
import model.Feedback;
import model.ImageProduct;
import model.Product;

/**
 *
 * @author admin
 */
public class FeedbackDAO extends DBContext {

    /**
     * get all feedback of product
     *
     * @param pid is product ID
     * @param index is paging
     * @return list feedback of product
     */
    public List<Feedback> displayFeedback(String pid, int index) {
        List<Feedback> list = new ArrayList<>();
        String sql = """
                        Select *
                        FROM [feedback] f 
                        INNER JOIN [Account] a ON (a.[id] = f.[aid])
                        INNER JOIN (Product p inner join ImageProduct [ip] on (p.id=[ip].pid)) ON (p.[id] = f.[pid])
                        where p.[id] = ?
                        order by f.[id] desc
                        OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            st.setInt(2, (index - 1) * 4);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(rs.getInt(1),
                        rs.getString(4),
                        rs.getInt(5),
                        new Account(rs.getInt(6),
                                rs.getString(7),
                                rs.getString(8),
                                rs.getString(9),
                                rs.getString(10),
                                rs.getString(11),
                                rs.getDouble(12),
                                rs.getInt(13),
                                rs.getString(14),
                                rs.getInt(15),
                                rs.getInt(16),
                                rs.getString(17)),
                        new Product(rs.getInt(18),
                                rs.getString(19),
                                rs.getString(20),
                                rs.getDouble(21),
                                rs.getInt(22),
                                rs.getInt(23),
                                rs.getDate(24),
                                rs.getString(25),
                                rs.getDouble(26),
                                rs.getInt(27),
                                rs.getInt(28),
                                rs.getInt(29),
                                rs.getInt(30),
                                rs.getInt(31),
                                new ImageProduct(rs.getInt(32),
                                        rs.getInt(33),
                                        rs.getString(34),
                                        rs.getString(35),
                                        rs.getString(36),
                                        rs.getString(37)))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    /**
     * count number feedback of product for paging
     *
     * @param pid is ID of product
     * @return number feedback of product
     */
    public int countFeedbackByPid(String pid) {
        String sql = """
                     SELECT COUNT(*) FROM feedback 
                     where pid = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    /**
     * Check if the customer has purchased the product yet
     *
     * @param aid is id of account
     * @param pid is id of product
     * @return true or false
     */
    public Boolean checkFeedback(int aid, int pid) {
        String sql = """
                     select * from [Order] o  join OrderDetail od on (od.oid=o.id)
                     where od.pid = ? and o.aid =?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.setInt(2, aid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }
}
