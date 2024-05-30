package controller;

import dal.BlogDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.Comparator;
import model.Blog;

@WebServlet(name = "EditBlogServlet", urlPatterns = {"/editblog"})
public class EditBlogServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogDAO blogDAO = new BlogDAO();
        String action = request.getParameter("action");
        String idStr = request.getParameter("id");

        if ("edit".equals(action) && idStr != null) {
            int id = Integer.parseInt(idStr);
            Blog blog = blogDAO.getBlogById(id);
            request.setAttribute("blog", blog);
        } else if ("delete".equals(action) && idStr != null) {
            int id = Integer.parseInt(idStr);
            blogDAO.deleteBlog(id);
            response.sendRedirect("editblog");
            return;
        }

        List<Blog> listBl = blogDAO.getAllBlog();
        Collections.sort(listBl, Comparator.comparingInt(Blog::getId));
        request.setAttribute("listBl", listBl);
        request.getRequestDispatcher("EditBlog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogDAO blogDAO = new BlogDAO();
        String idStr = request.getParameter("id");
        String title = request.getParameter("title");
        String image = request.getParameter("image");
        String date = request.getParameter("date");
        String description = request.getParameter("description");

        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setImage(image);
        blog.setDate(date);
        blog.setDescription(description);

        if (idStr == null || idStr.isEmpty()) {
            blogDAO.addBlog(blog);
        } else {
            int id = Integer.parseInt(idStr);
            blog.setId(id);
            blogDAO.updateBlog(blog);
        }

        response.sendRedirect("editblog");
    }
}
