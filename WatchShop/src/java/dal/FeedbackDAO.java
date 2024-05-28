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
import model.Product;

/**
 *
 * @author admin
 */
public class FeedbackDAO extends DBContext {

    /**
     * get all feedback of product
     * @param pid is product ID
     * @param index is paging
     * @return list feedback of product
     */
    public List<Feedback> displayFeedback(String pid, int index) {
        List<Feedback> list = new ArrayList<>();
        String sql = """
                        SELECT *
                        FROM [feedback] f 
                        INNER JOIN [Account] a ON (a.[id] = f.[aid])
                        INNER JOIN Product p  ON (p.[id] = f.[pid])
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
                                rs.getInt(28))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    /**
     * count number feedback of product for paging
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
}
