package controller;

import dal.BlogDAO;
import dal.BrandDAO;
import dal.CategoryDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Blog;
import model.Brand;
import model.Category;

@WebServlet(name = "BlogServlet", urlPatterns = {"/blog"})
public class BlogServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BrandDAO brandDAO = new BrandDAO();
        BlogDAO blogDAO = new BlogDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        List<Blog> listBl = blogDAO.getAllPublishedBlogs(); 
        List<Brand> listB = brandDAO.getAllBrand();
        List<Category> listC = categoryDAO.getAllCategory();

        request.setAttribute("listB", listB);
        request.setAttribute("listC", listC);
        request.setAttribute("listBl", listBl);

        request.getRequestDispatcher("blog.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Handles blog related requests";
    }
}
