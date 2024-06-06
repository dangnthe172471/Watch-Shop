package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Blog;

/**
 *
 * @author Admin
 */
public class BlogDAO extends DBContext {

    public List<Blog> getAllBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM Blog where status <> 2 ORDER BY status ASC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Blog(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("image"),
                        rs.getString("date"),
                        rs.getString("description"),
                        rs.getInt("status"),
                        rs.getInt("created_by")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Blog getBlogById(int id) {
        String sql = "SELECT * FROM Blog WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Blog(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("image"),
                        rs.getString("date"),
                        rs.getString("description"),
                        rs.getInt("status"),
                        rs.getInt("created_by"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addBlog(Blog blog) {
        String sql = "INSERT INTO Blog (title, image, date, description, status, created_by) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, blog.getTitle());
            st.setString(2, blog.getImage());
            st.setString(3, blog.getDate());
            st.setString(4, blog.getDescription());
            st.setInt(5, blog.getStatus());
            st.setInt(6, blog.getCreated_by());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateBlog(Blog blog) {
        String sql = "UPDATE Blog SET title = ?, image = ?, date = ?, description = ?, status = ? WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, blog.getTitle());
            st.setString(2, blog.getImage());
            st.setString(3, blog.getDate());
            st.setString(4, blog.getDescription());
            st.setInt(5, blog.getStatus());
            st.setInt(6, blog.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteBlog(int id) {
        String sql = "UPDATE Blog SET status = 2 WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Blog> getAllPublishedBlogs() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM Blog WHERE status = 1 ORDER BY id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Blog(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("image"),
                        rs.getString("date"),
                        rs.getString("description"),
                        rs.getInt("status"),
                        rs.getInt("created_by")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt("id"),
                        rs.getString("avatar"),
                        rs.getString("user"),
                        rs.getString("pass"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getDouble("amount"),
                        rs.getInt("bought"),
                        rs.getString("Address"),
                        rs.getInt("status"),
                        rs.getInt("roleID"),
                        rs.getString("token")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
