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
import model.Comment;
import model.Product;

/**
 *
 * @author admin
 */
public class CommentDAO extends DBContext {

    public List<Comment> displayComment(String pid, int index) {
        List<Comment> list = new ArrayList<>();
        String sql = """
                        SELECT c.[id],
                        c.[content],
                        c.[voted],
                        a.[id],
                        a.[avatar],
                        a.[user],                        
                        a.[pass],
                        a.[email],
                        a.[phone],
                        a.[amount],
                        a.[bought],
                        a.[address],
                        a.[status],
                        a.[roleID],
                        p.[id],
                        p.[name],
                        p.[image],
                        p.[price],
                        p.[quantity],
                        p.[sold],
                        p.[releaseDate],
                        p.[description],
                        p.[rate],
                        p.[cateID],
                        p.[brandID]
                        FROM [Comment] c  
                        INNER JOIN [Account] a ON (a.[id] = c.[aid])
                        INNER JOIN Product p  ON (p.[id] = c.[pid])
                        where p.[id] = ?
                        order by c.[id] desc
                        OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            st.setInt(2, (index - 1) * 4);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Comment(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        new Account(rs.getInt(4),
                                rs.getString(5),
                                rs.getString(6),
                                rs.getString(7),
                                rs.getString(8),
                                rs.getString(9),
                                rs.getDouble(10),
                                rs.getInt(11),
                                rs.getString(12),
                                rs.getInt(13),
                                rs.getInt(14)),
                        new Product(rs.getInt(15),
                                rs.getString(16),
                                rs.getString(17),
                                rs.getDouble(18),
                                rs.getInt(19),
                                rs.getInt(20),
                                rs.getDate(21),
                                rs.getString(22),
                                rs.getDouble(23),
                                rs.getInt(24),
                                rs.getInt(25))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int countCommentByPid(String pid) {
        String sql = """
                     SELECT COUNT(*) FROM Comment 
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
