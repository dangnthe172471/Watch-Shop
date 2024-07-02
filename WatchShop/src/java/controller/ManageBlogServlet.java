package controller;

import dal.BlogDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Blog;

public class ManageBlogServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogDAO blogDAO = new BlogDAO();
        List<Blog> listBl = blogDAO.getAllBlog();
        List<Account> listA = blogDAO.getAllAccount();
        request.setAttribute("listBl", listBl);
        request.setAttribute("listA", listA);
        request.setAttribute("tab", "4");
        request.getRequestDispatcher("ManageBlog.jsp").forward(request, response);
    }
}
